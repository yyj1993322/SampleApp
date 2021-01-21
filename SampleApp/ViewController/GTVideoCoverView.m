//
//  GTVideoCollectionViewCell.m
//  SampleApp
//
//  Created by 南继云 on 2021/1/20.
//

#import "GTVideoCoverView.h"
#import <AVFoundation/AVFoundation.h>

@interface GTVideoCoverView ()

@property(nonatomic, strong, readwrite) AVPlayerLayer *playrLayer;
@property(nonatomic, strong, readwrite) AVPlayerItem *videoItem;
@property(nonatomic, strong, readwrite) AVPlayer *avPlayer;

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

		[_coverView addSubview: ({
			_playButton = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 50)/2, (frame.size.height - 50)/2, 50, 50)];
			_playButton;
		})];

		UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapToPlay)];
		[self addGestureRecognizer:tapGesture];
		self.backgroundColor = [UIColor redColor];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_handlePlayEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
	}
	return self;
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
    NSURL *videoURL = [NSURL URLWithString:_videoUrl];
    
    AVAsset *asset = [AVAsset assetWithURL: videoURL];

    _videoItem = [AVPlayerItem playerItemWithAsset:asset];
    [_videoItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    
    _avPlayer = [AVPlayer playerWithPlayerItem:_videoItem];
    
    _playrLayer = [AVPlayerLayer playerLayerWithPlayer:_avPlayer];
    _playrLayer.frame = _coverView.bounds;
    [_coverView.layer addSublayer:_playrLayer];
    
    
    NSLog(@"");
}

-(void)_handlePlayEnd{
    [_playrLayer removeFromSuperlayer];
    _videoItem = nil;
    _avPlayer = nil;
}

#pragma - KVO
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    if ([keyPath isEqualToString:@"status"]) {
        if (((NSNumber *)[change objectForKey:NSKeyValueChangeNewKey]).integerValue == AVPlayerItemStatusReadyToPlay) {
            [_avPlayer play];
        }else{
            NSLog(@"");
        }
    }
}

@end
