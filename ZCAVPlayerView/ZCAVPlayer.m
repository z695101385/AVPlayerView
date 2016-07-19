//
//  ZCAVPlayer.m
//  百思不得姐
//
//  Created by 张晨 on 2016/7/18.
//  Copyright © 2016年 zhangchen. All rights reserved.
//

#import "ZCAVPlayer.h"

@implementation ZCAVPlayer

+ (instancetype)playerWithURL:(NSURL *)URL
{
    ZCAVPlayer *player = [super playerWithURL:URL];
    
    [player addObserver:player forKeyPath:@"status" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];
    
    return player;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"status"] && [change[@"new"] class] != [NSNull class]) {
        
        !([change[@"new"] compare:@1] == NSOrderedSame) ? : [self play];
        
    }
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"status"];
}

@end
