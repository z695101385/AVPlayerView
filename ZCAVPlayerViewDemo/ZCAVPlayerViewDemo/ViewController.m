//
//  ViewController.m
//  ZCAVPlayerViewDemo
//
//  Created by 张晨 on 2016/7/19.
//  Copyright © 2016年 zhangchen. All rights reserved.
//

#import "ViewController.h"
#import "ZCAVPlayerView.h"

@interface ViewController ()

@property(nonatomic, weak) ZCAVPlayerView *av;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZCAVPlayerView *av = [ZCAVPlayerView sharedInstance];
    
    av.frame = CGRectMake(50, 50, 200, 320);
    
    [self.view addSubview:av];
    
    self.av = av;
    
    
}
- (IBAction)play:(id)sender {
    [self.av playWithUrl:@"http://bvideo.spriteapp.cn/video/2016/0719/af722642-4d04-11e6-876d-d4ae5296039d_wpd.mp4"];
}

@end
