//
//  GTSplashView.m
//  SampleApp
//
//  Created by 南继云 on 2021/1/26.
//

#import "GTSplashView.h"
#import "GTScreen.h"

@interface GTSplashView()
@property(nonatomic,strong,readwrite)UIButton *button;
@end

@implementation GTSplashView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"splash"];
        
        [self addSubview: ({
            _button = [[UIButton alloc] initWithFrame:UIRect(300, 50, 60, 40)];
            _button.backgroundColor = [UIColor lightGrayColor];
            [_button setTitle:@"跳过" forState:UIControlStateNormal];
            [_button addTarget:self action:@selector(_removieSplashView) forControlEvents:UIControlEventTouchDragInside];
            _button;
        })];
        self.userInteractionEnabled = YES;
    }
    return self;
}

-(void)_removieSplashView{
    [self removeFromSuperview];
}

@end
