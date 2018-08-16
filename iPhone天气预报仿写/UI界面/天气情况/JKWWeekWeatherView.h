//
//  JKWWeekWeatherView.h
//  iPhone天气预报仿写
//
//  Created by 姜凯文 on 2018/8/15.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKWWhiteLabel.h"

@interface JKWWeekWeatherView : UIView

@property (nonatomic, strong) JKWWhiteLabel *cityWeekLabel;
@property (nonatomic, strong) UIImageView *weatherImageView;
@property (nonatomic, strong) JKWWhiteLabel *cityMaxLabel;
@property (nonatomic, strong) UILabel *cityMinLabel;

@end
