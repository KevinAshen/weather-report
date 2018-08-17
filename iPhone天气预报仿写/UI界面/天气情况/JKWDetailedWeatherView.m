//
//  JKWDetailedWeatherView.m
//  iPhone天气预报仿写
//
//  Created by 姜凯文 on 2018/8/15.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "JKWDetailedWeatherView.h"
#import "JKWAddressTableViewCell.h"
#import "JKWEveryDayDetailedWeatherView.h"
#import "JKWWeekWeatherView.h"
#import "JKWLifeTableViewCell.h"

#define JKWDeviceWidth [UIScreen mainScreen].bounds.size.width
#define JKWDeviceHeight [UIScreen mainScreen].bounds.size.height

@interface JKWDetailedWeatherView ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation JKWDetailedWeatherView
- (instancetype) initWithFrame:(CGRect)frame WithCityWeather:(JKWBriefCityWeatherNSO *)briefCityWeather {
    self = [super initWithFrame:frame];
    if (self) {
        self.tableView = [[UITableView alloc] init];
        
        _briefCityWeather = briefCityWeather;
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        
        [_tableView registerClass:[JKWAddressTableViewCell class] forCellReuseIdentifier:@"cell1"];
        [_tableView registerClass:[JKWLifeTableViewCell class] forCellReuseIdentifier:@"cell5"];
        
        [self addSubview:_tableView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _tableView.frame = CGRectMake(0, 0, JKWDeviceWidth, JKWDeviceHeight * 0.94);
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 16;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return JKWDeviceHeight * 0.4;
    } else if (indexPath.row == 1) {
        return JKWDeviceHeight * 0.2;
    } else if (indexPath.row == 2) {
        return 40 * 2 + 10;
    } else if (indexPath.row == 3) {
        return 50;
    } else {
        return 10 + 15 + 5 + 30 + 10;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row == 0) {
        JKWAddressTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
        cell1.contentView.backgroundColor = [UIColor clearColor];
        cell1.cityNameLabel.text = _briefCityWeather.cityNameString;
        cell1.cityNameLabel.font = [UIFont systemFontOfSize:28];
        cell1.cityWeatherLabel.text = _briefCityWeather.weatherInformationStr;
        cell1.cityWeatherLabel.font = [UIFont systemFontOfSize:18];
        NSString *tempStr = [NSString stringWithFormat:@"%@°", _briefCityWeather.tempString];
        cell1.cityTempLabel.text = tempStr;
        cell1.cityTempLabel.font = [UIFont systemFontOfSize:75];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        NSArray *weekArr = @[@"星期一", @"星期二" ,@"星期三" ,@"星期四" ,@"星期五" ,@"星期六" ,@"星期天"];
        formatter.shortWeekdaySymbols = weekArr;
        [formatter setDateFormat:@"eee"];
        NSString *dateTime = [formatter stringFromDate:[NSDate date]];
        cell1.cityWeekLabel.text = dateTime;
        cell1.cityWeekLabel.font = [UIFont systemFontOfSize:24];
        cell1.cityTodayLabel.text = @"今天";
        cell1.cityMaxLabel.text = _briefCityWeather.maxTempStr;
        cell1.cityMaxLabel.font = [UIFont systemFontOfSize:24];
        cell1.cityMinLabel.text = _briefCityWeather.minTempStr;
        cell1.cityMinLabel.font = [UIFont systemFontOfSize:24];
        cell1.cityMinLabel.textAlignment = NSTextAlignmentCenter;
        cell1.backgroundColor = [UIColor colorWithWhite:0 alpha:0.55];
        cell1.contentView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.55];
        cell1.contentView.alpha = 0.5;
        cell1.cityMinLabel.textColor = [UIColor colorWithRed:0.56f green:0.76f blue:0.84f alpha:1.00f];
        cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell1;
    } else if (indexPath.row == 1) {
        UITableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        if (cell2 == nil) {
            cell2 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell2"];
            cell2.contentView.backgroundColor = [UIColor clearColor];
            cell2.backgroundColor = [UIColor colorWithWhite:0 alpha:0.55];
            cell2.contentView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.55];
            cell2.contentView.alpha = 0.5;
            cell2.selectionStyle = UITableViewCellSelectionStyleNone;
            UIScrollView *everyDayScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, JKWDeviceWidth, JKWDeviceHeight * 0.2)];
            everyDayScrollView.bounces = NO;
            everyDayScrollView.alwaysBounceHorizontal = NO;
            everyDayScrollView.alwaysBounceVertical = NO;
            everyDayScrollView.contentSize = CGSizeMake(JKWDeviceWidth * 0.2 * 24, JKWDeviceHeight * 0.2);
            everyDayScrollView.delegate = self;
            everyDayScrollView.scrollEnabled = YES;
            everyDayScrollView.bouncesZoom = NO;
            everyDayScrollView.showsHorizontalScrollIndicator = NO;
            for (int i = 0; i < 24; i++) {
                JKWEveryDayDetailedWeatherView *everyDayDetailedWeatherView = [[JKWEveryDayDetailedWeatherView alloc] initWithFrame:CGRectMake(0 + JKWDeviceWidth * 0.2 * i, 0 , JKWDeviceWidth * 0.2, JKWDeviceHeight * 0.2)];
                everyDayDetailedWeatherView.timeLabel.text = _briefCityWeather.dayTimeMut[i];
                everyDayDetailedWeatherView.rainLabel.text = @"30%";
                everyDayDetailedWeatherView.weatherImageView.image = [UIImage imageNamed:_briefCityWeather.dayWeatherIcon[i]];
                everyDayDetailedWeatherView.tempLabel.text = _briefCityWeather.dayTempStrMut[i];
                
                [everyDayScrollView addSubview:everyDayDetailedWeatherView];
            }
            [cell2.contentView addSubview:everyDayScrollView];
        }
        return cell2;
    } else if (indexPath.row == 2) {
        UITableViewCell *cell3 = [tableView dequeueReusableCellWithIdentifier:@"cell3"];
        
        if (cell3 == nil) {
            cell3 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell3"];
            cell3.contentView.backgroundColor = [UIColor clearColor];
            cell3.backgroundColor = [UIColor colorWithWhite:0 alpha:0.55];
            cell3.contentView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.55];
            cell3.contentView.alpha = 0.5;
            cell3.selectionStyle = UITableViewCellSelectionStyleNone;
            NSDate *date = [NSDate date];//当前时间
            NSDate *nextDay = [NSDate dateWithTimeInterval:24*60*60 sinceDate:date];//后一天
            NSDate *nextNextDay = [NSDate dateWithTimeInterval:24*60*60 sinceDate:nextDay];
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
            NSArray *weekArr = @[@"星期一", @"星期二" ,@"星期三" ,@"星期四" ,@"星期五" ,@"星期六" ,@"星期天"];
            formatter.shortWeekdaySymbols = weekArr;
            [formatter setDateFormat:@"eee"];
            NSString *dateTime = [formatter stringFromDate:nextDay];
            
            formatter1.shortWeekdaySymbols = weekArr;
            [formatter1 setDateFormat:@"eee"];
            NSString *dateTime1 = [formatter stringFromDate:nextNextDay];
            
            NSArray *tempArr1 = @[dateTime, _briefCityWeather.weekWeatherIcon1, _briefCityWeather.weekMaxTemp1, _briefCityWeather.weekMinTemp1];
            NSArray *tempArr2 = @[dateTime1, _briefCityWeather.weekWeatherIcon2, _briefCityWeather.weekMaxTemp2, _briefCityWeather.weekMinTemp2];
            NSMutableArray *weekMut = [[NSMutableArray alloc] initWithObjects:tempArr1, tempArr2, nil];
            
            for (int i = 0; i < 2; i++) {
                JKWWeekWeatherView *weekWeatherView = [[JKWWeekWeatherView alloc] initWithFrame:CGRectMake(0, 0 + 40 * i, JKWDeviceWidth, 40)];
                weekWeatherView.cityWeekLabel.text = weekMut[i][0];
                weekWeatherView.cityWeekLabel.font = [UIFont systemFontOfSize:24];
                weekWeatherView.cityMaxLabel.text = weekMut[i][2];
                weekWeatherView.cityMaxLabel.font = [UIFont systemFontOfSize:24];
                weekWeatherView.cityMinLabel.text = weekMut[i][3];
                weekWeatherView.cityMinLabel.font = [UIFont systemFontOfSize:24];
                weekWeatherView.cityMinLabel.textColor = [UIColor colorWithRed:0.41f green:0.54f blue:0.60f alpha:1.00f];
                weekWeatherView.weatherImageView.image = [UIImage imageNamed:weekMut[i][1]];
                [cell3.contentView addSubview:weekWeatherView];
            }
        }
        return cell3;
    } else if (indexPath.row == 3) {
        UITableViewCell *cell4 = [tableView dequeueReusableCellWithIdentifier:@"cell4"];
        if (cell4 == nil) {
            cell4 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell4"];
            cell4.contentView.backgroundColor = [UIColor clearColor];
            cell4.backgroundColor = [UIColor colorWithWhite:0 alpha:0.55];
            cell4.contentView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.55];
            cell4.contentView.alpha = 0.5;
            cell4.selectionStyle = UITableViewCellSelectionStyleNone;
            UILabel *describeLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 400, 30)];
            describeLabel.backgroundColor = [UIColor clearColor];
            describeLabel.textColor = [UIColor whiteColor];
            NSString *tempStr = [NSString stringWithFormat:@"今天：当前%@。气温%@°； 最高温度%@°。", _briefCityWeather.weatherInformationStr, _briefCityWeather.tempString, _briefCityWeather.maxTempStr];
            describeLabel.text = tempStr;
            [cell4.contentView addSubview:describeLabel];
        }
        return cell4;
    } else {
        JKWLifeTableViewCell *cell5 = [tableView dequeueReusableCellWithIdentifier:@"cell5" forIndexPath:indexPath];
        cell5.contentView.backgroundColor = [UIColor clearColor];
        cell5.backgroundColor = [UIColor colorWithWhite:0 alpha:0.55];
        cell5.contentView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.55];
        cell5.contentView.alpha = 0.5;
        cell5.selectionStyle = UITableViewCellSelectionStyleNone;
        cell5.littleLabel.textColor = [UIColor whiteColor];
        cell5.littleLabel.font = [UIFont systemFontOfSize:14];
        NSArray *bigArr = @[@"日出" , @"日落", @"降雨概率", @"湿度", @"风速", @"体感温度", @"降水量", @"气压", @"能见度", @"紫外线指数", @"空气质量指数", @"空气质量"];
        NSString *tempSunRiseStr = [NSString stringWithFormat:@"上午%@", _briefCityWeather.sunRiseTimeStr];
        NSString *tempSunSetStr = [NSString stringWithFormat:@"下午%@", _briefCityWeather.sunSetTimeStr];
        NSString *tempRainHappenStr = [NSString stringWithFormat:@"%@%%", _briefCityWeather.rainHappenStr];
        NSString *tempWaterStr = [NSString stringWithFormat:@"%@%%", _briefCityWeather.waterPercentStr];
        NSString *tempWindSpeedStr = [NSString stringWithFormat:@"%@米/秒", _briefCityWeather.windSpeedStr];
        NSString *tempTempStr = [NSString stringWithFormat:@"%@°", _briefCityWeather.tempString];
        NSString *tempRainNumberStr = [NSString stringWithFormat:@"%@毫米", _briefCityWeather.rainNumberStr];
        NSString *tempAirDownStr = [NSString stringWithFormat:@"%@百帕", _briefCityWeather.downStr];
        NSString *tempCanSeeStr = [NSString stringWithFormat:@"%@公里", _briefCityWeather.canSeeStr];
        NSArray *littleArr = @[tempSunRiseStr, tempSunSetStr, tempRainHappenStr, tempWaterStr, tempWindSpeedStr, tempTempStr, tempRainNumberStr, tempAirDownStr, tempCanSeeStr, _briefCityWeather.purpleStr, _briefCityWeather.airNumberStr, _briefCityWeather.airGoodStr];
        cell5.littleLabel.text = bigArr[indexPath.row - 4];
        cell5.bigLabel.backgroundColor = [UIColor clearColor];
        cell5.bigLabel.textColor = [UIColor whiteColor];
        cell5.bigLabel.font = [UIFont systemFontOfSize:24];
        cell5.bigLabel.text = littleArr[indexPath.row - 4];
        return cell5;
    }
}



@end
