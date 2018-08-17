//
//  JKWWeekWeatherView.m
//  iPhone天气预报仿写
//
//  Created by 姜凯文 on 2018/8/15.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "JKWWeekWeatherView.h"
#define JKWDeviceWidth [UIScreen mainScreen].bounds.size.width
#define JKWDeviceHeight [UIScreen mainScreen].bounds.size.height

@implementation JKWWeekWeatherView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _cityWeekLabel = [[JKWWhiteLabel alloc] init];
        [self addSubview:_cityWeekLabel];
        
        _weatherImageView = [[UIImageView alloc] init];
        [self addSubview:_weatherImageView];
        
        _cityMaxLabel = [[JKWWhiteLabel alloc] init];
        [self addSubview:_cityMaxLabel];
        
        _cityMinLabel = [[UILabel alloc] init];
        _cityMinLabel.font = [UIFont systemFontOfSize:24];
        _cityMinLabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_cityMinLabel];
    }
    return self;
}

- (void) layoutSubviews {
    _cityWeekLabel.frame = CGRectMake(15, 10, 90, 30);
    
    _weatherImageView.frame = CGRectMake(JKWDeviceWidth * 0.5 - 15, 5, 40, 40);
    
    _cityMaxLabel.frame = CGRectMake(JKWDeviceWidth - 15 - 30 - 20 - 30, 10, 30, 30);
    
    _cityMinLabel.frame = CGRectMake(JKWDeviceWidth - 15 - 30, 10, 30, 30);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
