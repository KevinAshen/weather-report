//
//  JKWDetailedWeatherView.h
//  iPhone天气预报仿写
//
//  Created by 姜凯文 on 2018/8/15.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKWWhiteLabel.h"
#import "JKWBriefCityWeatherNSO.h"

@interface JKWDetailedWeatherView : UIView

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic) JKWBriefCityWeatherNSO *briefCityWeather;

- (instancetype) initWithFrame:(CGRect)frame WithCityWeather:(JKWBriefCityWeatherNSO *)briefCityWeather;


@end
