//
//  GTDeleteCellView.m
//  SampleApp
//
//  Created by 南继云 on 2021/1/12.
//

#import "GTDeleteCellView.h"

@implementation GTDeleteCellView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview: ({
            _backgroundView = [[UIView alloc] initWithFrame:self.bounds];
            _backgroundView.backgroundColor = [UIColor blackColor];
            _backgroundView.alpha = 0.5;
            [_backgroundView addGestureRecognizer: ({
                UITapGestureRecognizer *tapgesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissDeleteView)];
                tapgesture;
            })];
            _backgroundView;
        })];
        
        [self addSubview: ({
            _deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
            _deleteButton.backgroundColor = [UIColor blueColor];
            [_deleteButton addTarget:self action:@selector(_clickButton) forControlEvents:UIControlEventTouchUpInside];
            _deleteButton;
        })];
    }
    return  self;
}

-(void)showDeleteView:(CGPoint)point clickBlock:(dispatch_block_t) clickBlock{
    
    _deleteButton.frame = CGRectMake(point.x, point.y, 0, 0);
    _deleteBlock = [clickBlock copy];
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
//    [UIView animateWithDuration:1.f animations:^{
//        self.deleteButton.frame = CGRectMake((self.bounds.size.width - 200)/2, (self.bounds.size.height - 200)/2, 200, 200);
//    }];
    [UIView animateWithDuration:1.f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.deleteButton.frame = CGRectMake((self.bounds.size.width - 200)/2, (self.bounds.size.height - 200)/2, 200, 200);
        } completion:^(BOOL finished){
            NSLog(@"");
        }];
    
}

-(void)dismissDeleteView{
    [self removeFromSuperview];
    
}

-(void)_clickButton{
    if (_deleteBlock){
        _deleteBlock();
    }
    [self removeFromSuperview];
}

@end
