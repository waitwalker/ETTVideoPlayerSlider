//
//  ETTVideoPlayerSlider.h
//  VideoPlayerSlider
//
//  Created by LiuChuanan on 2017/6/8.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ETTVideoPlayerSliderDelegate.h"

@interface ETTVideoPlayerSlider : UIView

/* 播放进度值 */
@property (nonatomic, assign) CGFloat value;

/* 缓冲进度值 */
@property (nonatomic, assign) CGFloat trackValue;

/* 播放最小值 */
@property (nonatomic, assign) CGFloat minimumValue;

/* 播放最大值 */
@property (nonatomic, assign) CGFloat maximumValue;

/* slider条背景颜色   默认:黑色 */
@property (nonatomic, strong) UIColor *sliderBackgroundColor;

/* slider条缓冲颜色   默认:红色 */
@property (nonatomic, strong) UIColor *sliderTrackColor;

/* slider条播放颜色   默认:黄色 */
@property (nonatomic, strong) UIColor *sliderPlayedColor;

/* slider delegate */
@property (nonatomic, weak) id<ETTVideoPlayerSliderDelegate>delegate;


@end
