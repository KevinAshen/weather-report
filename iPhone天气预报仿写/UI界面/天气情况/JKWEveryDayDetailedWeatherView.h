//
//  JKWEveryDayDetailedWeatherView.h
//  iPhone天气预报仿写
//
//  Created by 姜凯文 on 2018/8/15.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKWWhiteLabel.h"

@interface JKWEveryDayDetailedWeatherView : UIView

@property (nonatomic, strong) JKWWhiteLabel *timeLabel;
@property (nonatomic, strong) UILabel *rainLabel;
@property (nonatomic, strong) UIImageView *weatherImageView;
@property (nonatomic, strong) JKWWhiteLabel *tempLabel;

@end
