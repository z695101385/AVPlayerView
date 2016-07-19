//
//  ZCAVPlayerView.h
//  百思不得姐
//
//  Created by 张晨 on 2016/7/17.
//  Copyright © 2016年 zhangchen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>
#import "ZCAVPlayer.h"


@interface ZCAVPlayerView : UIView

/** url */
@property (nonatomic, copy) NSString *url;
/** AVPlayerViewController */
@property (nonatomic, strong) AVPlayerViewController *playerController;
/** AVAudioSession */
@property (nonatomic, strong) AVAudioSession *session;
/** AVPlayer */
@property (nonatomic, strong) ZCAVPlayer *player;

+ (instancetype)sharedInstance;

- (void)playWithUrl:(NSString *)url;

@end
