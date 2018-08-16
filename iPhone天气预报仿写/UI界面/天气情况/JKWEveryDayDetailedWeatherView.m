//
//  JKWEveryDayDetailedWeatherView.m
//  iPhone天气预报仿写
//
//  Created by 姜凯文 on 2018/8/15.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "JKWEveryDayDetailedWeatherView.h"
#define JKWDeviceWidth [UIScreen mainScreen].bounds.size.width
#define JKWDeviceHeight [UIScreen mainScreen].bounds.size.height

@implementation JKWEveryDayDetailedWeatherView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        _timeLabel = [[JKWWhiteLabel alloc] init];
        [self addSubview:_timeLabel];
        
        _rainLabel = [[UILabel alloc] init];
        _rainLabel.textColor = [UIColor colorWithRed:0.31f green:0.71f blue:0.93f alpha:1.00f];
        _rainLabel.backgroundColor = [UIColor clearColor];
        _rainLabel.font = [UIFont systemFontOfSize:15];
        _rainLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_rainLabel];
        
        _tempLabel = [[JKWWhiteLabel alloc] init];
        [self addSubview:_tempLabel];
        
        _weatherImageView = [[UIImageView alloc] init];
        [self addSubview:_weatherImageView];
    }
    return self;
}

- (void)layoutSubviews {
    _timeLabel.frame = CGRectMake(0, 10, JKWDeviceWidth * 0.2, JKWDeviceHeight * 0.4 * 0.2 * 0.333 + 10);
    
    _rainLabel.frame = CGRectMake(0, 10 + JKWDeviceHeight * 0.4 * 0.2 * 0.333 + 10, JKWDeviceWidth * 0.2, JKWDeviceHeight * 0.4 * 0.2 * 0.333);
    
    _weatherImageView.frame = CGRectMake((JKWDeviceWidth * 0.2 - (JKWDeviceHeight * 0.4 * 0.2 * 0.333 + 30)) / 2, 10 + JKWDeviceHeight * 0.4 * 0.2 * 0.333 + 10 + JKWDeviceHeight * 0.4 * 0.2 * 0.333, JKWDeviceHeight * 0.4 * 0.2 * 0.333 + 30, JKWDeviceHeight * 0.4 * 0.2 * 0.333 + 30);
    
    _tempLabel.frame = CGRectMake(0, 10 + JKWDeviceHeight * 0.4 * 0.2 * 0.333 + 10 + JKWDeviceHeight * 0.4 * 0.2 * 0.333 + JKWDeviceHeight * 0.4 * 0.2 * 0.333 + 30, JKWDeviceWidth * 0.2, JKWDeviceHeight * 0.4 * 0.2 * 0.333 + 10);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
