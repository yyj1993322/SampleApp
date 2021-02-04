//
//  GTCommentManager.m
//  SampleApp
//
//  Created by 南继云 on 2021/2/4.
//

#import "GTCommentManager.h"
#import <UIKit/UIKit.h>
#import "GTScreen.h"

@interface GTCommentManager()<UITextViewDelegate>

@property(nonatomic,strong,readwrite)UITextView *textView;
@property(nonatomic,strong,readwrite)UIView *backgroundView;

@end

@implementation GTCommentManager

+(GTCommentManager *)shardManager{
    static GTCommentManager* manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[GTCommentManager alloc] init];
    });
    return manager;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        _backgroundView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        _backgroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
        
        [_backgroundView addGestureRecognizer: [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapBackground)] ];
        [_backgroundView addSubview: ({
            _textView = [[UITextView alloc] initWithFrame:CGRectMake(0, _backgroundView.bounds.size.height, SCREEN_WIDTH, UI(100))];
            _textView.backgroundColor = [UIColor whiteColor];
            _textView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
            _textView.layer.borderWidth = 0.5f;
            _textView.delegate = self;
            _textView;
        })];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_doTextViewAnimationWithNotification:) name:UIKeyboardWillChangeFrameNotification object:nil];
    }
    return self;
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark -

-(void)_tapBackground{
    [_textView resignFirstResponder];
    [_backgroundView removeFromSuperview];
}

-(void)showCommentView{
    [[UIApplication sharedApplication].keyWindow addSubview:_backgroundView];
    [_textView becomeFirstResponder];
}

#pragma mark - delegate

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    return YES;
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    
}

-(void)_doTextViewAnimationWithNotification:(NSNotification *)noti{
   CGFloat duration = [[noti.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
   CGRect keyboardFram = [[noti.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    if (keyboardFram.origin.y >= SCREEN_HEIGHT) {
        //收起
        [UIView animateWithDuration:duration animations:^{
            self.textView.frame = CGRectMake(0, self.backgroundView.bounds.size.height, SCREEN_WIDTH, UI(100));
        }];
    }else{
        self.textView.frame = CGRectMake(0, self.backgroundView.bounds.size.height, SCREEN_WIDTH, UI(100));
        [UIView animateWithDuration:duration animations:^{
            self.textView.frame = CGRectMake(0, self.backgroundView.bounds.size.height - keyboardFram.size.height - UI(100), SCREEN_WIDTH, UI(100));
        }];
    }
}

@end
