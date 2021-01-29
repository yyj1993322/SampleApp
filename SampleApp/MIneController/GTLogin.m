//
//  GTLogin.m
//  SampleApp
//
//  Created by 南继云 on 2021/1/28.
//

#import "GTLogin.h"

@interface GTLogin()

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
    }
    return self;
}

-(BOOL)isLogin{
    return _isLogin;
}

-(void)loginWithFinishBlocck:(GTLoginFinishBlock)finishiBlock{
    
}

-(void)logOut{
    _isLogin = NO;
}

-(void)shareToQQWithArticleUrl:(NSURL *)articleUrl{
    
}

@end
