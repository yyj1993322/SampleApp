//
//  GTVideoCollectionViewCell.m
//  SampleApp
//
//  Created by 南继云 on 2021/1/20.
//

#import "GTVideoCoverView.h"

@interface GTVideoCoverView ()
@property(nonatomic, strong, readwrite) UIImageView *coverView;
@property(nonatomic, strong, readwrite) UIImageView *playButton;
@property(nonatomic, strong, readwrite) NSString *videoUrl;
@end

@implementation GTVideoCoverView

-(instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame: frame];
	if (self) {
		[self addSubview: ({
			_coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
			_coverView;
		})];

		[self addSubview: ({
			_playButton = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 50)/2, (frame.size.height - 50)/2, 50, 50)];
			_playButton;
		})];

		UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapToPlay)];
		[self addGestureRecognizer:tapGesture];
		self.backgroundColor = [UIColor redColor];
	}
	return self;
}

#pragma mark - public
-(void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl {
	_coverView.image = [UIImage imageNamed:videoCoverUrl];
    _playButton.image = [UIImage systemImageNamed:@"play"];
//    _playButton.backgroundColor = [UIColor whiteColor];
    _playButton.layer.cornerRadius = 5;
	_videoUrl = videoUrl;
}

#pragma mark - private method
-(void)_tapToPlay {
    NSLog(@"");
}

@end