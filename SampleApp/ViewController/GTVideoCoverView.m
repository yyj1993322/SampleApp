//
//  GTVideoCollectionViewCell.m
//  SampleApp
//
//  Created by 南继云 on 2021/1/20.
//

#import "GTVideoCoverView.h"
#import <AVFoundation/AVFoundation.h>
#import "GTVideoPlayer.h"
#import "GTVideoToolbar.h"

@interface GTVideoCoverView ()



@property(nonatomic, strong, readwrite) UIImageView *coverView;
@property(nonatomic, strong, readwrite) UIImageView *playButton;
@property(nonatomic, strong, readwrite) NSString *videoUrl;
@property(nonatomic, strong, readwrite) GTVideoToolbar *toolbar;

@end

@implementation GTVideoCoverView

-(instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame: frame];
	if (self) {
		[self addSubview: ({
			_coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - GTVideoToolbarHeight)];
			_coverView;
		})];

		[_coverView addSubview: ({
			_playButton = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 50)/2, (frame.size.height - GTVideoToolbarHeight - 50)/2, 50, 50)];
			_playButton;
		})];

		[self addSubview:({
			_toolbar = [[GTVideoToolbar alloc] initWithFrame:CGRectMake(0, _coverView.bounds.size.height, frame.size.width, GTVideoToolbarHeight)];
			_toolbar;
		})];

		UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapToPlay)];
		[self addGestureRecognizer:tapGesture];
		self.backgroundColor = [UIColor redColor];

	}
	return self;
}

-(void)dealloc {

}

#pragma mark - public
-(void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl {
	_coverView.image = [UIImage imageNamed:videoCoverUrl];
	_playButton.image = [UIImage systemImageNamed:@"play"];
	_playButton.layer.cornerRadius = 5;
	_videoUrl = videoUrl;
	[_toolbar layoutWithModel:nil];
}

-(void)_tapToPlay {
	[[GTVideoPlayer player] playVideoWithUrl:_videoUrl attachView:_coverView];
}


@end
