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
    NSString *testUrlStr = [NSString stringWithFormat:@"https://free-api.heweather.com/s6/weather/now?location=%@&key=0b32342eb6a14669a0ab16cfca9f1785", searchBarTextStr];
    testUrlStr = [testUrlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *testUrl = [NSURL URLWithString:testUrlStr];
    NSURLRequest *testRequest = [NSURLRequest requestWithURL:testUrl];
    NSURLSession *testSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *testDataTask = [testSession dataTaskWithRequest:testRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            id obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            self.testStatusStr = obj[@"HeWeather6"][0][@"status"];
            if (![self.testStatusStr isEqualToString:@"unknown city"]) {
                self.cityTempStr = obj[@"HeWeather6"][0][@"now"][@"tmp"];
                self.tempCityIDStr = obj[@"HeWeather6"][0][@"basic"][@"cid"];
            }
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if ([self.testStatusStr isEqualToString:@"unknown city"]) {
                UIAlertController *wrongAlertController = [UIAlertController alertControllerWithTitle:@"错误" message:@"该城市不存在" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *returnAction = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleDefault handler:nil];
                [wrongAlertController addAction:returnAction];
                [self presentViewController:wrongAlertController animated:YES completion:nil];
            } else {
                JKWBriefCityWeatherNSO *tempJKWBriefCityWeatherNSO = [[JKWBriefCityWeatherNSO alloc] init];
                tempJKWBriefCityWeatherNSO.cityNameString = searchBarTextStr;
                tempJKWBriefCityWeatherNSO.tempString = self.cityTempStr;
                tempJKWBriefCityWeatherNSO.cityIDStr = self.tempCityIDStr;
                [self dismissViewControllerAnimated:YES completion:nil];
                if ([self->_addAndSearchViewControllerDelegate respondsToSelector:@selector(passJKWBriefCityWeatherNSO:)]) {
                    [self->_addAndSearchViewControllerDelegate passJKWBriefCityWeatherNSO:tempJKWBriefCityWeatherNSO];
                }
            }
        });
    }];
    [testDataTask resume];
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
