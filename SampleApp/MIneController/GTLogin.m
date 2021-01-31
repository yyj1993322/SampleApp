//
//  GTLogin.m
//  SampleApp
//
//  Created by 南继云 on 2021/1/28.
//

#import "GTLogin.h"
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>

@interface GTLogin()<TencentSessionDelegate>
@property(nonatomic,strong,readwrite)TencentOAuth *oauth;
@property(nonatomic,assign,readwrite)BOOL isLogin;
@property(nonatomic,copy,readwrite)GTLoginFinishBlock finishBlock;

@end

@implementation GTLogin

+(instancetype)sharedLogin {
    static GTLogin *login;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        login = [[GTLogin alloc] init];
    });
    return login;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        _isLogin = NO;
        _oauth = [[TencentOAuth alloc] initWithAppId:@"222222" andDelegate:self];
    }
    return self;
}

-(BOOL)isLogin{
    //登录状态失效的逻辑
    return _isLogin;
}

-(void)loginWithFinishBlocck:(GTLoginFinishBlock)finishiBlock{
    _finishBlock = [finishiBlock copy];
    _oauth.authMode = kAuthModeClientSideToken;
    [_oauth authorize:@[
        kOPEN_PERMISSION_GET_USER_INFO,
        kOPEN_PERMISSION_GET_SIMPLE_USER_INFO,
        kOPEN_PERMISSION_ADD_ALBUM,
        kOPEN_PERMISSION_ADD_ONE_BLOG,
        kOPEN_PERMISSION_ADD_SHARE,
        kOPEN_PERMISSION_ADD_TOPIC,
        kOPEN_PERMISSION_CHECK_PAGE_FANS,
        kOPEN_PERMISSION_GET_INFO,
        kOPEN_PERMISSION_GET_OTHER_INFO,
        kOPEN_PERMISSION_LIST_ALBUM,
        kOPEN_PERMISSION_UPLOAD_PIC,
        kOPEN_PERMISSION_GET_VIP_INFO,
        kOPEN_PERMISSION_GET_VIP_RICH_INFO
    ]];
}

-(void)logOut{
    [_oauth logout:self];
    _isLogin = NO;
}



-(void)shareToQQWithArticleUrl:(NSURL *)articleUrl{
    
}

- (void)tencentDidLogin {
    _isLogin = YES;
    [_oauth getUserInfo];
}


- (void)tencentDidNotLogin:(BOOL)cancelled {
    if (_finishBlock) {
        _finishBlock(NO);
    }
}

- (void)tencentDidNotNetWork {
    
}

-(void)getUserInfoResponse:(APIResponse *)response{
    NSDictionary *userInfo = response.jsonResponse;
    _nick = userInfo[@"nickName"];
    _address = userInfo[@"city"];
    _avatarUrl = userInfo[@"figureurl_qq_2"];
    if (_finishBlock) {
        _finishBlock(YES);
    }
    
}

@end
