//
//  JKWBriefCityWeatherNSO.h
//  iPhone天气预报仿写
//
//  Created by 姜凯文 on 2018/8/14.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JKWBriefCityWeatherNSO : NSObject

//身份识别
@property (nonatomic, strong) NSString *cityIDStr;
@property (nonatomic, strong) NSString *cityStatusStr;

//主页介绍
@property (nonatomic, strong) NSString *cityNameString;
@property (nonatomic, strong) NSString *weatherInformationStr;
@property (nonatomic, strong) NSString *tempString;
@property (nonatomic, strong) NSString *maxTempStr; // 3~10
@property (nonatomic, strong) NSString *MinTempStr; // 3~10

//24小时播报
//  @property (nonatomic, strong) NSString *tempString;
@property (nonatomic, strong) NSString *weatherIcon;

@property (nonatomic, strong) NSString *time1Str;
@property (nonatomic, strong) NSString *tempString1;
@property (nonatomic, strong) NSString *weatherIcon1;

@property (nonatomic, strong) NSString *time2Str;
@property (nonatomic, strong) NSString *tempString2;
@property (nonatomic, strong) NSString *weatherIcon2;

@property (nonatomic, strong) NSString *time3Str;
@property (nonatomic, strong) NSString *tempString3;
@property (nonatomic, strong) NSString *weatherIcon3;

@property (nonatomic, strong) NSString *time4Str;
@property (nonatomic, strong) NSString *tempString4;
@property (nonatomic, strong) NSString *weatherIcon4;

@property (nonatomic, strong) NSString *time5Str;
@property (nonatomic, strong) NSString *tempString5;
@property (nonatomic, strong) NSString *weatherIcon5;

@property (nonatomic, strong) NSString *time6Str;
@property (nonatomic, strong) NSString *tempString6;
@property (nonatomic, strong) NSString *weatherIcon6;

@property (nonatomic, strong) NSString *time7Str;
@property (nonatomic, strong) NSString *tempString7;
@property (nonatomic, strong) NSString *weatherIcon7;

@property (nonatomic, strong) NSString *time8Str;
@property (nonatomic, strong) NSString *tempString8;
@property (nonatomic, strong) NSString *weatherIcon8;

//一周播报
@property (nonatomic, strong) NSString *weekWeatherIcon1;
@property (nonatomic, strong) NSString *weekMaxTemp1;
@property (nonatomic, strong) NSString *weekMinTemp1;

@property (nonatomic, strong) NSString *weekWeatherIcon2;
@property (nonatomic, strong) NSString *weekMaxTemp2;
@property (nonatomic, strong) NSString *weekMinTemp2;

//
//@property (nonatomic, strong) NSString *weatherInformationStr;
//@property (nonatomic, strong) NSString *tempString;
//@property (nonatomic, strong) NSString *maxTempStr;

//日出时间
@property (nonatomic, strong) NSString *sunRiseTimeStr; // 3~10

//日落时间
@property (nonatomic, strong) NSString *sunSetTimeStr; // 3~10

//降雨概率
@property (nonatomic, strong) NSString *rainHappenStr; // 3~10

//湿度
@property (nonatomic, strong) NSString *waterPercentStr;

//风速
@property (nonatomic, strong) NSString *windSpeedStr;

//体感温度
//@property (nonatomic, strong) NSString *tempString;

//降水量
@property (nonatomic, strong) NSString *rainNumberStr;

//气压
@property (nonatomic, strong) NSString *downStr;

//能见度
@property (nonatomic, strong) NSString *canSeeStr;

//紫外线指数
@property (nonatomic, strong) NSString *purpleStr;  //3~10

//空气质量指数
@property (nonatomic, strong) NSString *airNumberStr;

//空气质量
@property (nonatomic, strong) NSString *airGoodStr;

- (instancetype) initWithName:(NSString *)selfName;



@end
