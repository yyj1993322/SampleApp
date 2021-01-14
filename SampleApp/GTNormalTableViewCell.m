//
//  GTNormalTableViewCell.m
//  SampleApp
//
//  Created by 南继云 on 2021/1/8.
//

#import "GTNormalTableViewCell.h"

@interface GTNormalTableViewCell ()

@property(nonatomic, strong, readwrite) UILabel *titleLabel;
@property(nonatomic, strong, readwrite) UILabel *sourceLabel;
@property(nonatomic, strong, readwrite) UILabel *commentLabel;
@property(nonatomic, strong, readwrite) UILabel *timeLabel;
@property(nonatomic, strong, readwrite) UIImageView *myImageView;
@property(nonatomic, strong, readwrite) UIButton *deleteButton;

@end

@implementation GTNormalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
   self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 300, 50)];
//            self.titleLabel.backgroundColor = [UIColor redColor];
            self.titleLabel.textColor = [UIColor blackColor];
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            self.titleLabel;
        })];
        
        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 50, 20)];
//            self.sourceLabel.backgroundColor = [UIColor redColor];
            self.sourceLabel.textColor = [UIColor blueColor];
            self.sourceLabel.font = [UIFont systemFontOfSize:12];
            self.sourceLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
            self.sourceLabel;
        })];
        
        [self.contentView addSubview:({
            self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 80, 50, 20)];
//            self.commentLabel.backgroundColor = [UIColor redColor];
            self.commentLabel.textColor = [UIColor blueColor];
            self.commentLabel.font = [UIFont systemFontOfSize:12];
            self.commentLabel;
        })];
        
        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 80, 50, 20)];
//            self.timeLabel.backgroundColor = [UIColor redColor];
            self.timeLabel.textColor = [UIColor blueColor];
            self.timeLabel.font = [UIFont systemFontOfSize:12];
            self.timeLabel;
        })];
        
        [self.contentView addSubview: ({
            self.myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(300, 15, 70, 70)];
//            self.myImageView.backgroundColor = [UIColor redColor];
            self.myImageView.contentMode = UIViewContentModeScaleAspectFill;
            self.myImageView;
        })];
        
        [self.contentView addSubview: ({
            self.deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(230, 80, 30, 15)];
            [self.deleteButton setTitle:@"X" forState: UIControlStateNormal];
            [self.deleteButton setTitle:@"V" forState:UIControlStateHighlighted];
            [self.deleteButton addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
            self.deleteButton.layer.cornerRadius = 5;
            self.deleteButton.layer.masksToBounds = YES;
            self.deleteButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
            self.deleteButton.layer.borderWidth = 1;
//            self.deleteButton.backgroundColor = [UIColor blueColor];
            self.deleteButton;
        })];
    }
   return self;
}

-(void)layoutTableViewCell{
    self.titleLabel.text = @"极客时间ios开发";
    
    self.sourceLabel.text = @"极客时间";
    [self.sourceLabel sizeToFit];
    
    self.commentLabel.text = @"1999评论";
    [self.commentLabel sizeToFit];
    self.commentLabel.frame = CGRectMake( self.sourceLabel.frame.origin.x + self.sourceLabel.frame.size.width + 15, self.commentLabel.frame.origin.y, self.commentLabel.frame.size.width, self.commentLabel.frame.size.height);
    
    self.timeLabel.text = @"三分钟前";
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake( self.commentLabel.frame.origin.x + self.commentLabel.frame.size.width + 15, self.timeLabel.frame.origin.y, self.timeLabel.frame.size.width, self.timeLabel.frame.size.height);
    
    self.myImageView.image = [UIImage imageNamed:@"awm"];
    
    
}



-(void)deleteButtonClick {
    if(self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickDeleteButton:)]){
        [self.delegate tableViewCell:self clickDeleteButton:self.deleteButton];
    }
}

@end
