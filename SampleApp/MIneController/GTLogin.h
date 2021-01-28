//
//  GTLogin.h
//  SampleApp
//
//  Created by 南继云 on 2021/1/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^GTLoginFinishBlock)(BOOL isLogin);

@interface GTLogin : NSObject

+(instancetype)sharedLogin;

-(BOOL)isLogin;
-(void)loginWithFinishBlocck:(GTLoginFinishBlock)finishiBlock;
-(void)logOut;

-(void)shareToQQWithArticleUrl:(NSURL *)articleUrl;

@end

NS_ASSUME_NONNULL_END
