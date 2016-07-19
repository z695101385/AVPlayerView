//
//  ZCAVPlayerView.m
//  百思不得姐
//
//  Created by 张晨 on 2016/7/17.
//  Copyright © 2016年 zhangchen. All rights reserved.
//

#import "ZCAVPlayerView.h"
#import "UIView+ZCExtension.h"


@interface ZCAVPlayerView ()<AVPlayerViewControllerDelegate>
/** CADisplayLink */
@property (nonatomic, strong) CADisplayLink *timer;

@end

@implementation ZCAVPlayerView

static id _instace;

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instace = [super allocWithZone:zone];
    });
    return _instace;
}

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instace = [[self alloc] init];
    });
    return _instace;
}

- (id)copyWithZone:(NSZone *)zone
{
    return _instace;
}

- (void)awakeFromNib
{
    [self setUp];
}


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)setUp
{
    _session = [AVAudioSession sharedInstance];
    [_session setCategory:AVAudioSessionCategoryPlayback error:nil];
    _playerController = [[AVPlayerViewController alloc] init];
    _playerController.videoGravity = AVLayerVideoGravityResizeAspect;
    _playerController.delegate = self;
    _playerController.allowsPictureInPicturePlayback = true;    //画中画，iPad可用
    //        _playerController.showsPlaybackControls = false;
    
    _playerController.view.translatesAutoresizingMaskIntoConstraints = true;    //AVPlayerViewController 内部可能是用约束写的，这句可以禁用自动约束，消除报错
    [self addSubview:_playerController.view];
}

- (void)playWithUrl:(NSString *)url
{
    
    _url = url;
    
    _player = [ZCAVPlayer playerWithURL:[NSURL URLWithString:_url]];
    _playerController.player = _player;
    
    _timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(timeChanged)];
    [_timer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
}

- (void)timeChanged
{
    if (!self.zc_isShowingOnKeyWindow) {

        [self removeFromSuperview];
        
        [_playerController.player.currentItem cancelPendingSeeks];
        [_playerController.player.currentItem.asset cancelLoading];
        
        _player = nil;
        _playerController.player = nil;
        
        [_timer invalidate];
        
    }
}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    _playerController.view.frame = self.bounds;
}

#pragma mark - AVPlayerViewControllerDelegate
- (void)playerViewControllerWillStartPictureInPicture:(AVPlayerViewController *)playerViewController {
    NSLog(@"%s", __FUNCTION__);
}

- (void)playerViewControllerDidStartPictureInPicture:(AVPlayerViewController *)playerViewController {
    NSLog(@"%s", __FUNCTION__);
}

- (void)playerViewController:(AVPlayerViewController *)playerViewController failedToStartPictureInPictureWithError:(NSError *)error {
    NSLog(@"%s", __FUNCTION__);
}

- (void)playerViewControllerWillStopPictureInPicture:(AVPlayerViewController *)playerViewController {
    NSLog(@"%s", __FUNCTION__);
}

- (void)playerViewControllerDidStopPictureInPicture:(AVPlayerViewController *)playerViewController {
    NSLog(@"%s", __FUNCTION__);
}

- (BOOL)playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart:(AVPlayerViewController *)playerViewController {
    NSLog(@"%s", __FUNCTION__);
    return true;
}

- (void)playerViewController:(AVPlayerViewController *)playerViewController restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(void (^)(BOOL))completionHandler {
    NSLog(@"%s", __FUNCTION__);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

}

@end
