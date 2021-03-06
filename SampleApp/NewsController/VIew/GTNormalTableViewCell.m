//
//  GTNormalTableViewCell.m
//  SampleApp
//
//  Created by 南继云 on 2021/1/8.
//

#import "GTNormalTableViewCell.h"
#import "GTListItem.h"
#import "SDWebImage.h"
#import "GTScreen.h"

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
			self.titleLabel = [[UILabel alloc] initWithFrame:UIRect(20, 15, 250, 50)];
//            self.titleLabel.backgroundColor = [UIColor redColor];
			self.titleLabel.textColor = [UIColor blackColor];
			self.titleLabel.font = [UIFont systemFontOfSize:16];
			self.titleLabel.numberOfLines = 2;//高两行
			self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;//末尾截断
			self.titleLabel;
		})];

		[self.contentView addSubview:({
			self.sourceLabel = [[UILabel alloc] initWithFrame:UIRect(20, 80, 50, 20)];
//            self.sourceLabel.backgroundColor = [UIColor redColor];
			self.sourceLabel.textColor = [UIColor blueColor];
			self.sourceLabel.font = [UIFont systemFontOfSize:12];
			self.sourceLabel.lineBreakMode = NSLineBreakByTruncatingTail;
			self.sourceLabel;
		})];

		[self.contentView addSubview:({
			self.commentLabel = [[UILabel alloc] initWithFrame:UIRect(90, 80, 50, 20)];
//            self.commentLabel.backgroundColor = [UIColor redColor];
			self.commentLabel.textColor = [UIColor blueColor];
			self.commentLabel.font = [UIFont systemFontOfSize:12];
            self.commentLabel.lineBreakMode = NSLineBreakByTruncatingTail;
			self.commentLabel;
		})];

		[self.contentView addSubview:({
			self.timeLabel = [[UILabel alloc] initWithFrame:UIRect(160, 80, 50, 20)];
//            self.timeLabel.backgroundColor = [UIColor redColor];
			self.timeLabel.textColor = [UIColor blueColor];
			self.timeLabel.font = [UIFont systemFontOfSize:12];
            self.timeLabel.lineBreakMode = NSLineBreakByTruncatingTail;
			self.timeLabel;
		})];

		[self.contentView addSubview: ({
			self.myImageView = [[UIImageView alloc] initWithFrame:UIRect(280, 15, 100, 70)];
//            self.myImageView.backgroundColor = [UIColor redColor];
			self.myImageView.contentMode = UIViewContentModeScaleAspectFill;
			self.myImageView;
		})];

//		[self.contentView addSubview: ({
//			self.deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(230, 80, 30, 15)];
//			[self.deleteButton setTitle:@"X" forState: UIControlStateNormal];
//			[self.deleteButton setTitle:@"V" forState:UIControlStateHighlighted];
//			[self.deleteButton addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
//			self.deleteButton.layer.cornerRadius = 5;
//			self.deleteButton.layer.masksToBounds = YES;
//			self.deleteButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
//			self.deleteButton.layer.borderWidth = 1;
//			self.deleteButton.backgroundColor = [UIColor blueColor];
//			self.deleteButton;
//		})];
	}
	return self;
}

-(void)layoutTableViewCellWithItem:(GTListItem *)item {
    
    BOOL hasRead = [[NSUserDefaults standardUserDefaults] boolForKey:item.uniquekey];
    if (hasRead) {
        self.titleLabel.textColor = [UIColor lightGrayColor];
    }else {
        self.titleLabel.textColor = [UIColor blackColor];
    }
	self.titleLabel.text = item.title;

	self.sourceLabel.text = item.authorName;
	[self.sourceLabel sizeToFit];

	self.commentLabel.text = item.category;
	[self.commentLabel sizeToFit];
	self.commentLabel.frame = CGRectMake( self.sourceLabel.frame.origin.x + self.sourceLabel.frame.size.width + UI(15), self.commentLabel.frame.origin.y, self.commentLabel.frame.size.width, self.commentLabel.frame.size.height);

	self.timeLabel.text = item.date;
	[self.timeLabel sizeToFit];
	self.timeLabel.frame = CGRectMake( self.commentLabel.frame.origin.x + self.commentLabel.frame.size.width + UI(15), self.timeLabel.frame.origin.y, self.timeLabel.frame.size.width, self.timeLabel.frame.size.height);

#warning
//    NSThread *downloadImageThread = [[NSThread alloc] initWithBlock:^{
//        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.pickUrl]]];
//        self.myImageView.image = image;
//    }];
//    downloadImageThread.name = @"downloadImageThread";
//    [downloadImageThread start];
    
//    dispatch_queue_main_t mainQueue = dispatch_get_main_queue();
//    dispatch_queue_global_t downloadQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(downloadQueue, ^{
//        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.pickUrl]]];
//        dispatch_async(mainQueue, ^{
//            self.myImageView.image = image;
//        });
//    });
    [self.myImageView sd_setImageWithURL:[NSURL URLWithString:item.pickUrl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            NSLog(@"");
        }];
    
   
}



-(void)deleteButtonClick {
	if(self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickDeleteButton:)]) {
		[self.delegate tableViewCell:self clickDeleteButton:self.deleteButton];
	}
}

@end
