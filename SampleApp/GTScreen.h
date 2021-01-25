//
//  GTScreen.h
//  SampleApp
//
//  Created by 南继云 on 2021/1/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//是否横屏
#define IS_LANDSCAPE (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]))

#define SCREEN_WIDTH (IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)

#define SCREEN_HEIGHT (IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)

#define UI(x) UIAdapter(x)

#define UIRect(x,y,width,height) UIRectUIAdapter(x,y,width,height)

static inline NSInteger UIAdapter(float x){
    //1 - 分机型 特定的比例
    
    //2 - 屏幕宽度按比例适配
    CGFloat scale = 414 / (SCREEN_WIDTH);
    return (NSInteger)x / scale;
}

static inline CGRect UIRectUIAdapter(x,y,width,height){
    return CGRectMake(UIAdapter(x), UIAdapter(y), UIAdapter(width), UIAdapter(height));
    
}

@interface GTScreen : NSObject

@end

NS_ASSUME_NONNULL_END
