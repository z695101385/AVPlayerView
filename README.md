# ZCAVPlayerView
一个简单易用的支持画中画的网络视频，音频播放器

使用只需要

1·包含头文件
```objc
#import "ZCAVPlayerView.h"
```

2·使用
```objc

    ZCAVPlayerView *av = [ZCAVPlayerView sharedInstance];
    
    av.frame = CGRectMake(50, 50, 200, 320);
    
    [self.view addSubview:av];

    [av playWithUrl:@"http://bvideo.spriteapp.cn/video/2016/0719/af722642-4d04-11e6-876d-d4ae5296039d_wpd.mp4"];
```
