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
        
        [self addSubview:_tableView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _tableView.frame = CGRectMake(0, 0, JKWDeviceWidth, JKWDeviceHeight * 0.94);
    
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
        cell1.cityNameLabel.text = @"西安市";
        cell1.cityNameLabel.font = [UIFont systemFontOfSize:28];
        cell1.cityWeatherLabel.text = _briefCityWeather.weatherInformationStr;
        cell1.cityWeatherLabel.font = [UIFont systemFontOfSize:18];
        cell1.cityTempLabel.text = @"32°";
        cell1.cityTempLabel.font = [UIFont systemFontOfSize:75];
        cell1.cityWeekLabel.text = @"西安市";
        cell1.cityWeekLabel.font = [UIFont systemFontOfSize:24];
        cell1.cityTodayLabel.text = @"西安";
        cell1.cityMaxLabel.text = @"36";
        cell1.cityMaxLabel.font = [UIFont systemFontOfSize:24];
        cell1.cityMinLabel.text = @"26";
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
            everyDayScrollView.contentSize = CGSizeMake(JKWDeviceWidth * 0.2 * 7, JKWDeviceHeight * 0.2);
            everyDayScrollView.delegate = self;
            everyDayScrollView.scrollEnabled = YES;
            everyDayScrollView.bouncesZoom = NO;
            everyDayScrollView.showsHorizontalScrollIndicator = NO;
            for (int i = 0; i < 7; i++) {
                JKWEveryDayDetailedWeatherView *everyDayDetailedWeatherView = [[JKWEveryDayDetailedWeatherView alloc] initWithFrame:CGRectMake(0 + JKWDeviceWidth * 0.2 * i, 0 , JKWDeviceWidth * 0.2, JKWDeviceHeight * 0.2)];
                everyDayDetailedWeatherView.timeLabel.text = @"上午12时";
                everyDayDetailedWeatherView.rainLabel.text = @"30%";
                everyDayDetailedWeatherView.weatherImageView.image = [UIImage imageNamed:@"100n"];
                everyDayDetailedWeatherView.tempLabel.text = @"35°";
                
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
            for (int i = 0; i < 2; i++) {
                JKWWeekWeatherView *weekWeatherView = [[JKWWeekWeatherView alloc] initWithFrame:CGRectMake(0, 0 + 40 * i, JKWDeviceWidth, 40)];
                weekWeatherView.cityWeekLabel.text = @"星期一";
                weekWeatherView.cityWeekLabel.font = [UIFont systemFontOfSize:24];
                weekWeatherView.cityMaxLabel.text = @"37";
                weekWeatherView.cityMaxLabel.font = [UIFont systemFontOfSize:24];
                weekWeatherView.cityMinLabel.text = @"26";
                weekWeatherView.cityMinLabel.font = [UIFont systemFontOfSize:24];
                weekWeatherView.cityMinLabel.textColor = [UIColor colorWithRed:0.41f green:0.54f blue:0.60f alpha:1.00f];
                weekWeatherView.weatherImageView.image = [UIImage imageNamed:@"100n"];
                
                
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
            describeLabel.text = @"今天：当前多云。气温25°； 最高温度29°。";
            [cell4.contentView addSubview:describeLabel];
        }
        return cell4;
    } else {
        UITableViewCell *cell5 = [tableView dequeueReusableCellWithIdentifier:@"cell5"];
        if (cell5 == nil) {
            cell5 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell5"];
            cell5.contentView.backgroundColor = [UIColor clearColor];
            cell5.backgroundColor = [UIColor colorWithWhite:0 alpha:0.55];
            cell5.contentView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.55];
            cell5.contentView.alpha = 0.5;
            cell5.selectionStyle = UITableViewCellSelectionStyleNone;
            UILabel *littleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 200, 15)];
            littleLabel.textColor = [UIColor whiteColor];
            littleLabel.font = [UIFont systemFontOfSize:14];
            littleLabel.text = @"日出";
            [cell5.contentView addSubview:littleLabel];
            UILabel *bigLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 10 + 15 + 5, 200, 30)];
            bigLabel.backgroundColor = [UIColor clearColor];
            bigLabel.textColor = [UIColor whiteColor];
            bigLabel.font = [UIFont systemFontOfSize:24];
            bigLabel.text = @"上午10：03";
            [cell5.contentView addSubview:bigLabel];
        }
        return cell5;
    }
}



@end
