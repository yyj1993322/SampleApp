//
//  GTDeleteCellView.h
//  SampleApp
//
//  Created by 南继云 on 2021/1/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTDeleteCellView : UIView

@property(nonatomic, strong, readwrite)UIView *backgroundView;
@property(nonatomic, strong, readwrite)UIButton *deleteButton;
@property(nonatomic, copy, readwrite) dispatch_block_t deleteBlock;
-(void)showDeleteView:(CGPoint)point clickBlock:(dispatch_block_t) clickBlock;
@end

NS_ASSUME_NONNULL_END
