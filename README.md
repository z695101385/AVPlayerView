# ZCAVPlayerView
一个简单易用的支持画中画的网络视频，音频播放器

使用只需要

1·包含头文件
```objc
#import "ZCAVPlayerView.h"
```

2·项目Capabilities属性中Background Modes中勾选Audio,AirPlay and Picture in Picture选项

3·使用
```objc

    ZCAVPlayerView *av = [ZCAVPlayerView sharedInstance];
    
    av.frame = CGRectMake(50, 50, 200, 320);
    
    [self.view addSubview:av];
    //苹果已经不建议使用HTTP协议
    //如果视频协议是HTTP,还需要设置Info.plist,允许使用HTTP协议
    [av playWithUrl:@"http://bvideo.spriteapp.cn/video/2016/0719/af722642-4d04-11e6-876d-d4ae5296039d_wpd.mp4"];
```
