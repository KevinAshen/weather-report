//
//  JKWBriefCityWeatherNSO.m
//  iPhone天气预报仿写
//
//  Created by 姜凯文 on 2018/8/14.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "JKWBriefCityWeatherNSO.h"

@implementation JKWBriefCityWeatherNSO

- (instancetype)initWithName:(NSString *)selfName {
    self = [super init];
    if (self) {
        NSString *nowUrlStr = [NSString stringWithFormat:@"https://free-api.heweather.com/s6/weather/now?location=%@&key=0b32342eb6a14669a0ab16cfca9f1785", selfName];
        nowUrlStr = [nowUrlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        NSURL *nowUrl = [NSURL URLWithString:nowUrlStr];
        NSURLRequest *nowRequest = [NSURLRequest requestWithURL:nowUrl];
        NSURLSession *nowSession = [NSURLSession sharedSession];
        NSURLSessionDataTask *nowDataTask = [nowSession dataTaskWithRequest:nowRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            id nowObj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//            NSLog(@"%@", nowObj);
            self.cityNameString = nowObj[@"HeWeather6"][0][@"basic"][@"location"];
            self.cityIDStr = nowObj[@"HeWeather6"][0][@"basic"][@"cid"];
            self.tempString = nowObj[@"HeWeather6"][0][@"now"][@"tmp"];

//            NSLog(@"12%@", self.cityNameString);
//            NSLog(@"12%@", nowObj[@"HeWeather6"][0][@"basic"][@"location"]);
            
        }];
        [nowDataTask resume];
    }
    NSLog(@"--%@--", self.cityNameString);
    return self;
}

@end
