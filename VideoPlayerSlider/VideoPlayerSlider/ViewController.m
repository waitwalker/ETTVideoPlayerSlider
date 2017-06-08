//
//  ViewController.m
//  VideoPlayerSlider
//
//  Created by LiuChuanan on 2017/6/8.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

#import "ViewController.h"
#import "ETTVideoPlayerSlider.h"

@interface ViewController ()<ETTVideoPlayerSliderDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ETTVideoPlayerSlider *videoPlayerSlider = [[ETTVideoPlayerSlider alloc]initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, 50)];
    videoPlayerSlider.delegate              = self;
    
    //设置播放进度
    [videoPlayerSlider setValue:0.3];
    
    //设置缓冲进度
    [videoPlayerSlider setTrackValue:0.7];
    
    [self.view addSubview:videoPlayerSlider];
    
}

#pragma mark ETTVideoPlayerSliderDelegate代理回调
- (void)beginDragSliderButton:(UIButton *)button
{
    NSLog(@"开始拖动滑竿");
}

- (void)draggingSliderButton:(UIButton *)button
{
    NSLog(@"正在拖动滑竿");
}

- (void)endDragSliderButton:(UIButton *)button
{
    NSLog(@"结束拖动滑竿");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
