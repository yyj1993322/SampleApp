//
//  GTVideoPlayer.h
//  SampleApp
//
//  Created by 南继云 on 2021/1/22.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface GTVideoPlayer : NSObject

+ (GTVideoPlayer *)player;

-(void)playVideoWithUrl:(NSString *)videoUrl attachView:(UIView *)attchView;

@end

NS_ASSUME_NONNULL_END
