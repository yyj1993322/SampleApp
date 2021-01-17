//
//  GTNormalTableViewCell.h
//  SampleApp
//
//  Created by 南继云 on 2021/1/8.
//

#import <UIKit/UIKit.h>

@class GTListItem;

NS_ASSUME_NONNULL_BEGIN


/// 点击删除
@protocol GTNormalTableViewCellDelegate <NSObject>

-(void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton;

@end


/// 新闻列表cell
@interface GTNormalTableViewCell : UITableViewCell

@property(nonatomic, weak, readwrite) id<GTNormalTableViewCellDelegate> delegate;

-(void)layoutTableViewCellWithItem:(GTListItem *)item;

@end

NS_ASSUME_NONNULL_END
