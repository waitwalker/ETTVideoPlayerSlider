//
//  ETTVideoPlayerSliderDelegate.h
//  VideoPlayerSlider
//
//  Created by LiuChuanan on 2017/6/8.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ETTVideoPlayerSliderDelegate <NSObject>

/* 开始拖动 */
- (void)beginDragSliderButton:(UIButton *)button;

/* 停止拖动 */
- (void)endDragSliderButton:(UIButton *)button;

/* 正在拖动 */
- (void)draggingSliderButton:(UIButton *)button;

@end
