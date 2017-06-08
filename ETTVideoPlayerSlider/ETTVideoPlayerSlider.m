//
//  ETTVideoPlayerSlider.m
//  VideoPlayerSlider
//
//  Created by LiuChuanan on 2017/6/8.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

#import "ETTVideoPlayerSlider.h"

#define kSliderButtonWidthHeight 20.0

#define kSliderWidth       \
(                          \
self.frame.size.width      \
- kSliderButtonWidthHeight \
)

#define kSliderHeight 5.0

#define kSliderY           \
(                          \
(self.frame.size.height    \
- 2.5)                     \
/ 2                        \
)

#define kSliderX kSliderButtonWidthHeight * 0.5

@interface ETTVideoPlayerSlider ()

/* 进度条背景视图 */
@property (nonatomic, strong) UIView   *sliderBackgroundView;

/* 进度条缓存视图 */
@property (nonatomic, strong) UIView   *sliderBufferView;

/* 进度条播放视图 */
@property (nonatomic, strong) UIView   *sliderPlayedView;

/* 进度条按钮 */
@property (nonatomic, strong) UIButton *sliderButton;

/* 上次拖动结束point */
@property (nonatomic, assign) CGPoint  lastPoint;

@end

@implementation ETTVideoPlayerSlider

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) 
    {   
        self.backgroundColor = [UIColor clearColor];
        [self setupSubviewsPlayerSlider];
    }
    return self;
}

#pragma mark 初始化控件
- (void)setupSubviewsPlayerSlider
{
    /* 进度条背景视图 */
    UIView *sliderBackgroundView         = [[UIView alloc]init];
    sliderBackgroundView.backgroundColor = [UIColor blackColor];
    [self addSubview:sliderBackgroundView];
    self.sliderBackgroundView            = sliderBackgroundView;
    
    /* 进度条缓存视图 */
    UIView *sliderBufferView             = [[UIView alloc]init];
    sliderBufferView.backgroundColor     = [UIColor redColor];
    [self addSubview:sliderBufferView];
    self.sliderBufferView                = sliderBufferView;
    
    /* 进度条播放视图 */
    UIView *sliderPlayView               = [[UIView alloc]init];
    sliderPlayView.backgroundColor       = [UIColor yellowColor];
    [self addSubview:sliderPlayView];
    self.sliderPlayedView                = sliderPlayView;
    
    /* 进度条按钮 */
    UIButton *sliderButton               = [[UIButton alloc]init];
    sliderButton.backgroundColor         = [UIColor orangeColor];
    sliderButton.layer.cornerRadius      = 10;
    sliderButton.clipsToBounds           = YES;
    [sliderButton addTarget:self action:@selector(beginSliderButtonDrag:) forControlEvents:UIControlEventTouchDown];
    [sliderButton addTarget:self action:@selector(endSilderButtonDrag:) forControlEvents:UIControlEventTouchCancel];
    [sliderButton addTarget:self action:@selector(draggingSliderButton:event:) forControlEvents:UIControlEventTouchDragInside];
    [sliderButton addTarget:self action:@selector(endSilderButtonDrag:) forControlEvents:UIControlEventTouchUpInside];
    [sliderButton addTarget:self action:@selector(endSilderButtonDrag:) forControlEvents:UIControlEventTouchUpOutside];
    [self addSubview:sliderButton];
    self.sliderButton                    = sliderButton;
    
    /* 进度条背景视图 */
    self.sliderBackgroundView.frame = CGRectMake(kSliderX, kSliderY, kSliderWidth, kSliderHeight);
    
    /* 进度条缓存视图 */
    self.sliderBufferView.frame     = CGRectMake(kSliderX, kSliderY, 0, kSliderHeight);
    
    /* 进度条播放视图 */
    self.sliderPlayedView.frame     = CGRectMake(kSliderX, kSliderY, 0, kSliderHeight);
    
    /* 进度条按钮 */
    self.sliderButton.frame         = CGRectMake(0, 20, kSliderButtonWidthHeight, kSliderButtonWidthHeight);
    CGPoint center                  = self.sliderButton.center;
    center.x                        = self.sliderBackgroundView.frame.origin.x;
    center.y                        = self.sliderPlayedView.center.y;
    self.sliderButton.center        = center;
    
    self.lastPoint                  = self.sliderButton.center;
}

#pragma mark sliderButton事件回调
- (void)beginSliderButtonDrag:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(beginSliderButtonDrag:)]) 
    {
        [self.delegate beginDragSliderButton:button];
    }
}

- (void)draggingSliderButton:(UIButton *)button event:(UIEvent *)event
{
    CGPoint touchPoint = [[[event allTouches]anyObject] locationInView:self];
    CGFloat offsetX = touchPoint.x - _lastPoint.x;
    CGPoint tmpPoint = CGPointMake(button.center.x + offsetX, button.center.y);
    
    //获取进度值
    CGFloat progressValue = (tmpPoint.x - kSliderX) * 1.0 / kSliderWidth;
    [self setValue:progressValue];
    
    if ([self.delegate respondsToSelector:@selector(draggingSliderButton:)]) 
    {
        [self.delegate draggingSliderButton:button];
    }
}

- (void)endSilderButtonDrag:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(endDragSliderButton:)]) 
    {
        [self.delegate endDragSliderButton:button];
    }
}

#pragma mark setter
- (void)setValue:(CGFloat)progressValue
{
    _value            = progressValue;
    CGFloat finishValue = kSliderWidth * progressValue;
    CGPoint tmpPoint  = _sliderButton.center;
    tmpPoint.x        = kSliderX + finishValue;
    if (tmpPoint.x >= kSliderX && tmpPoint.x <= (self.frame.size.width - kSliderButtonWidthHeight * 0.5))
    {
        _sliderButton.center         = tmpPoint;
        _lastPoint                   = _sliderButton.center;
        CGRect sliderPlayedFrame     = _sliderPlayedView.frame;
        sliderPlayedFrame.size.width = tmpPoint.x;
        _sliderPlayedView.frame      = sliderPlayedFrame;
    }
}

- (void)setTrackValue:(CGFloat)trackValue
{
    float bufferValue                = _sliderBackgroundView.frame.size.width * trackValue;
    CGRect sliderBufferViewFrame     = _sliderBufferView.frame;
    sliderBufferViewFrame.size.width = bufferValue;
    _sliderBufferView.frame          = sliderBufferViewFrame;
}

- (void)setSliderBackgroundColor:(UIColor *)sliderBackgroundColor
{
    if (_sliderBackgroundColor != sliderBackgroundColor) 
    {
        _sliderBackgroundView.backgroundColor = sliderBackgroundColor;
    }
}

- (void)setSliderTrackColor:(UIColor *)sliderTrackColor
{
    if (_sliderBackgroundColor != sliderTrackColor) 
    {
        _sliderBufferView.backgroundColor = sliderTrackColor;
    }
}

- (void)setSliderPlayedColor:(UIColor *)sliderPlayedColor
{
    if (_sliderPlayedColor != sliderPlayedColor) 
    {
        _sliderPlayedView.backgroundColor = sliderPlayedColor;
    }
}

@end

