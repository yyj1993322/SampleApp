//
//  GTVideoToolbar.m
//  SampleApp
//
//  Created by 南继云 on 2021/1/24.
//

#import "GTVideoToolbar.h"

@interface GTVideoToolbar ()

@property(nonatomic,strong,readwrite) UIImageView *avatorImage;
@property(nonatomic,strong,readwrite) UILabel *nickLabel;

@property(nonatomic,strong,readwrite) UIImageView *commentImageView;
@property(nonatomic,strong,readwrite) UILabel *commentLabel;

@property(nonatomic,strong,readwrite) UIImageView *likeImageView;
@property(nonatomic,strong,readwrite) UILabel *likeLabel;

@property(nonatomic,strong,readwrite) UIImageView *shareImageView;
@property(nonatomic,strong,readwrite) UILabel *shareLabel;


@end

@implementation GTVideoToolbar

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
	if (self) {

		self.backgroundColor = [UIColor whiteColor];

		[self addSubview: ({
			_avatorImage = [[UIImageView alloc] initWithFrame:CGRectZero];
			_avatorImage.layer.masksToBounds = YES;
			_avatorImage.layer.cornerRadius = 15;
			_avatorImage.translatesAutoresizingMaskIntoConstraints = NO;
			_avatorImage;
		})];

		[self addSubview: ({
            _nickLabel = [[UILabel alloc] init];
            _nickLabel.font = [UIFont systemFontOfSize:15];
            _nickLabel.textColor = [UIColor lightGrayColor];
            _nickLabel.translatesAutoresizingMaskIntoConstraints = NO;
            _nickLabel;
		})];

		[self addSubview: ({
			_commentImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
			_commentImageView.layer.masksToBounds = YES;
			_commentImageView.layer.cornerRadius = 15;
			_commentImageView.translatesAutoresizingMaskIntoConstraints = NO;
			_commentImageView;
		})];

		[self addSubview: ({
            _commentLabel = [[UILabel alloc] init];
            _commentLabel.font = [UIFont systemFontOfSize:15];
            _commentLabel.textColor = [UIColor lightGrayColor];
            _commentLabel.translatesAutoresizingMaskIntoConstraints = NO;
            _commentLabel;
		})];

		[self addSubview: ({
			_likeImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
			_likeImageView.layer.masksToBounds = YES;
			_likeImageView.layer.cornerRadius = 15;
			_likeImageView.translatesAutoresizingMaskIntoConstraints = NO;
			_likeImageView;
		})];

		[self addSubview: ({
            _likeLabel = [[UILabel alloc] init];
            _likeLabel.font = [UIFont systemFontOfSize:15];
            _likeLabel.textColor = [UIColor lightGrayColor];
            _likeLabel.translatesAutoresizingMaskIntoConstraints = NO;
            _likeLabel;
		})];

		[self addSubview: ({
			_shareImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
			_shareImageView.layer.masksToBounds = YES;
			_shareImageView.layer.cornerRadius = 15;
			_shareImageView.translatesAutoresizingMaskIntoConstraints = NO;
			_shareImageView;
		})];

		[self addSubview: ({
            _shareLabel = [[UILabel alloc] init];
            _shareLabel.font = [UIFont systemFontOfSize:15];
            _shareLabel.textColor = [UIColor lightGrayColor];
            _shareLabel.translatesAutoresizingMaskIntoConstraints = NO;
            _shareLabel;
		})];
	}
	return self;
}

-(void)layoutWithModel:(id)model {
	_avatorImage.image = [UIImage imageNamed:@"videoPlay"];
    _nickLabel.text = @"极客时间";

	_commentImageView.image = [UIImage imageNamed:@"comment"];
    _commentLabel.text = @"100";

	_likeImageView.image = [UIImage imageNamed:@"praise"];
    _likeLabel.text = @"25";

	_shareImageView.image = [UIImage imageNamed:@"share"];
    _shareLabel.text = @"100";

	[NSLayoutConstraint activateConstraints:@[
        
		 [NSLayoutConstraint constraintWithItem:_avatorImage
		  attribute:NSLayoutAttributeCenterY
		  relatedBy:NSLayoutRelationEqual
		  toItem:self
		  attribute:NSLayoutAttributeCenterY
		  multiplier:1
		  constant:0],
         [NSLayoutConstraint constraintWithItem:_avatorImage
          attribute:NSLayoutAttributeLeft
          relatedBy:NSLayoutRelationEqual
          toItem:self
          attribute:NSLayoutAttributeLeft
          multiplier:1
          constant:15],
         [NSLayoutConstraint constraintWithItem:_avatorImage
          attribute:NSLayoutAttributeWidth
          relatedBy:NSLayoutRelationEqual
          toItem:nil
          attribute:NSLayoutAttributeNotAnAttribute
          multiplier:1
          constant:30],
         [NSLayoutConstraint constraintWithItem:_avatorImage
          attribute:NSLayoutAttributeHeight
          relatedBy:NSLayoutRelationEqual
          toItem:nil
          attribute:NSLayoutAttributeNotAnAttribute
          multiplier:1
          constant:30],
         [NSLayoutConstraint constraintWithItem:_nickLabel
          attribute:NSLayoutAttributeCenterY
          relatedBy:NSLayoutRelationEqual
          toItem:_avatorImage
          attribute:NSLayoutAttributeCenterY
          multiplier:1
          constant:0],
         [NSLayoutConstraint constraintWithItem:_nickLabel
          attribute:NSLayoutAttributeLeft
          relatedBy:NSLayoutRelationEqual
          toItem:_avatorImage
          attribute:NSLayoutAttributeRight
          multiplier:1
          constant:0]
	]];
    
    NSString *vflString =
        @"H:|-15-[_avatorImage]-0-[_nickLabel]-(>=0)-[_commentImageView(==_avatorImage)]-0-[_commentLabel]-15-[_likeImageView(==_avatorImage)]-0-[_likeLabel]-15-[_shareImageView(==_avatorImage)]-0-[_shareLabel]-15-|";
    
    [NSLayoutConstraint activateConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:vflString options:NSLayoutFormatAlignAllCenterY metrics:nil views:NSDictionaryOfVariableBindings(_avatorImage,_nickLabel,_commentImageView,_commentLabel,_likeImageView,_likeLabel,_shareImageView,_shareLabel)]];
}

@end
