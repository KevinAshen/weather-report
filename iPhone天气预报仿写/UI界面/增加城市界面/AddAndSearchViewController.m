//
//  AddAndSearchViewController.m
//  iPhone天气预报仿写
//
//  Created by 姜凯文 on 2018/8/14.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "AddAndSearchViewController.h"
#define JKWDeviceWidth [UIScreen mainScreen].bounds.size.width
#define JKWDeviceHeight [UIScreen mainScreen].bounds.size.height


@interface AddAndSearchViewController ()<UISearchBarDelegate>

@end

@implementation AddAndSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *backgroundImage = [UIImage imageNamed:@"f5949a32d5c0fa913d70ed0694b00d4b (1).jpg"];
    self.view.layer.contents = (id)backgroundImage.CGImage;
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    UISearchBar *topSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, JKWDeviceWidth, JKWDeviceHeight * 0.1)];
    topSearchBar.showsCancelButton = YES;
    topSearchBar.barStyle = UIBarStyleBlack;
    topSearchBar.barTintColor = [UIColor grayColor];
    topSearchBar.placeholder = @"输入省市";
    topSearchBar.delegate = self;
    
    [self.view addSubview:topSearchBar];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.view endEditing:YES];
    NSString *searchBarTextStr = searchBar.text;
    JKWBriefCityWeatherNSO *tempBriefWeather = [[JKWBriefCityWeatherNSO alloc] init];
    NSString *testUrlStr = [NSString stringWithFormat:@"https://free-api.heweather.com/s6/weather?location=%@&key=0b32342eb6a14669a0ab16cfca9f1785", searchBarTextStr];
    testUrlStr = [testUrlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *testUrl = [NSURL URLWithString:testUrlStr];
    NSURLRequest *testRequest = [NSURLRequest requestWithURL:testUrl];
    NSURLSession *testSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *testDataTask = [testSession dataTaskWithRequest:testRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            id obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            self.testStatusStr = obj[@"HeWeather6"][0][@"status"];
            if (![self.testStatusStr isEqualToString:@"unknown city"]) {
                //NSLog(@"%@", obj);
                tempBriefWeather.cityNameString = searchBarTextStr;
                tempBriefWeather.tempString = obj[@"HeWeather6"][0][@"now"][@"tmp"];
                tempBriefWeather.cityIDStr = obj[@"HeWeather6"][0][@"basic"][@"cid"];
                tempBriefWeather.weatherInformationStr = obj[@"HeWeather6"][0][@"now"][@"cond_txt"];
                tempBriefWeather.weatherIcon = obj[@"HeWeather6"][0][@"now"][@"cond_code"];
                tempBriefWeather.waterPercentStr = obj[@"HeWeather6"][0][@"now"][@"hum"];
                tempBriefWeather.windSpeedStr = obj[@"HeWeather6"][0][@"now"][@"wind_spd"];
                tempBriefWeather.rainNumberStr = obj[@"HeWeather6"][0][@"now"][@"pcpn"];
                tempBriefWeather.downStr = obj[@"HeWeather6"][0][@"now"][@"pres"];
                tempBriefWeather.canSeeStr = obj[@"HeWeather6"][0][@"now"][@"vis"];
                
                tempBriefWeather.maxTempStr = obj[@"HeWeather6"][0][@"daily_forecast"][0][@"tmp_max"];
                tempBriefWeather.minTempStr = obj[@"HeWeather6"][0][@"daily_forecast"][0][@"tmp_min"];
                
                tempBriefWeather.weekMaxTemp1 = obj[@"HeWeather6"][0][@"daily_forecast"][1][@"tmp_max"];
                tempBriefWeather.weekMinTemp1 = obj[@"HeWeather6"][0][@"daily_forecast"][1][@"tmp_min"];
                tempBriefWeather.weekWeatherIcon1 = obj[@"HeWeather6"][0][@"daily_forecast"][1][@"cond_code_d"];
                
                tempBriefWeather.weekMaxTemp2 = obj[@"HeWeather6"][0][@"daily_forecast"][2][@"tmp_max"];
                tempBriefWeather.weekMinTemp2 = obj[@"HeWeather6"][0][@"daily_forecast"][2][@"tmp_min"];
                tempBriefWeather.weekWeatherIcon2 = obj[@"HeWeather6"][0][@"daily_forecast"][2][@"cond_code_d"];
                
                tempBriefWeather.sunRiseTimeStr = obj[@"HeWeather6"][0][@"daily_forecast"][0][@"sr"];
                tempBriefWeather.sunSetTimeStr = obj[@"HeWeather6"][0][@"daily_forecast"][0][@"ss"];
                tempBriefWeather.rainHappenStr = obj[@"HeWeather6"][0][@"daily_forecast"][0][@"pop"];
                tempBriefWeather.purpleStr = obj[@"HeWeather6"][0][@"daily_forecast"][0][@"uv_index"];
            }
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if ([self.testStatusStr isEqualToString:@"unknown city"]) {
                UIAlertController *wrongAlertController = [UIAlertController alertControllerWithTitle:@"错误" message:@"该城市不存在" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *returnAction = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleDefault handler:nil];
                [wrongAlertController addAction:returnAction];
                [self presentViewController:wrongAlertController animated:YES completion:nil];
            } else {
                [self dismissViewControllerAnimated:YES completion:nil];
                if ([self->_addAndSearchViewControllerDelegate respondsToSelector:@selector(passJKWBriefCityWeatherNSO:)]) {
                    [self->_addAndSearchViewControllerDelegate passJKWBriefCityWeatherNSO:tempBriefWeather];
                }
            }
        });
    }];
    [testDataTask resume];
    
    NSString *test1UrlStr = [NSString stringWithFormat:@"https://free-api.heweather.com/s6/air/now?location=%@&key=0b32342eb6a14669a0ab16cfca9f1785", searchBarTextStr];
    test1UrlStr = [test1UrlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *test1Url = [NSURL URLWithString:test1UrlStr];
    NSURLRequest *test1Request = [NSURLRequest requestWithURL:test1Url];
    NSURLSession *test1Session = [NSURLSession sharedSession];
    NSURLSessionDataTask *testDataTask1 = [test1Session dataTaskWithRequest:test1Request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            id obj1 = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            self.testStatusStr = obj1[@"HeWeather6"][0][@"status"];
            if (![self.testStatusStr isEqualToString:@"unknown city"]) {
                tempBriefWeather.airNumberStr = obj1[@"HeWeather6"][0][@"air_now_city"][@"aqi"];
                tempBriefWeather.airGoodStr = obj1[@"HeWeather6"][0][@"air_now_city"][@"qlty"];
                
            }
        } else {
            NSLog(@"%@", error);
        }
        
    }];
    [testDataTask1 resume];
    
    NSString *test3UrlStr = [NSString stringWithFormat:@"https://api.jisuapi.com/weather/query?appkey=3261731f81589d75&city=%@", searchBarTextStr];
    test3UrlStr = [test3UrlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *test3Url = [NSURL URLWithString:test3UrlStr];
    NSURLRequest *test3Request = [NSURLRequest requestWithURL:test3Url];
    NSURLSession *test3Session = [NSURLSession sharedSession];
    NSURLSessionDataTask *testDataTask3 = [test3Session dataTaskWithRequest:test3Request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            id obj3 = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            tempBriefWeather.dayTimeMut = [[NSMutableArray alloc] init];
            tempBriefWeather.dayTempStrMut = [[NSMutableArray alloc] init];
            tempBriefWeather.dayWeatherIcon = [[NSMutableArray alloc] init];
            for (int i = 0; i < 24; i++) {
                [tempBriefWeather.dayTimeMut addObject:obj3[@"result"][@"hourly"][i][@"time"]];
                [tempBriefWeather.dayWeatherIcon addObject:obj3[@"result"][@"hourly"][i][@"img"]];
                [tempBriefWeather.dayTempStrMut addObject:obj3[@"result"][@"hourly"][i][@"temp"]];
            }
        } else {
            NSLog(@"wrong");
        }
        
    }];
    [testDataTask3 resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
