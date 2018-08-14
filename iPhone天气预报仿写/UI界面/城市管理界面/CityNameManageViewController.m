//
//  CityNameManageViewController.m
//  iPhone天气预报仿写
//
//  Created by 姜凯文 on 2018/8/13.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "CityNameManageViewController.h"
#import "AddAndSearchViewController.h"
#define JKWDeviceWidth [UIScreen mainScreen].bounds.size.width
#define JKWDeviceHeight [UIScreen mainScreen].bounds.size.height

@interface CityNameManageViewController ()<UITableViewDelegate, UITableViewDataSource, AddAndSearchViewControllerDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation CityNameManageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _BriefCityWeatherMut = [[NSMutableArray alloc] init];
    
    UIImage *backgroundImage = [UIImage imageNamed:@"e7a4a9477308cd4d4261ac4ef327273b"];
    self.view.layer.contents = (id) backgroundImage.CGImage;
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;
    self.view.backgroundColor = [UIColor colorWithRed:0.91f green:0.91f blue:0.91f alpha:1.00f];
//    self.view.alpha = 0.8;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, JKWDeviceWidth, JKWDeviceHeight * 0.94) style:UITableViewStyleGrouped];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.bounces = NO;
    [self.view addSubview:_tableView];
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, JKWDeviceHeight * 0.94, JKWDeviceWidth, JKWDeviceHeight * 0.06)];
    bottomView.backgroundColor = [UIColor blackColor];
    bottomView.alpha = 0.7;
    [self.view addSubview:bottomView];
    
    UIButton *AddButton = [[UIButton alloc] initWithFrame:CGRectMake(JKWDeviceWidth * 0.9, JKWDeviceHeight * 0.06 * 0.15, JKWDeviceWidth * 0.1, JKWDeviceHeight * 0.06 * 0.8)];
    [AddButton setImage:[UIImage imageNamed:@"CityNameManageAdd"] forState:UIControlStateNormal];
    [AddButton addTarget:self action:@selector(addButtonPresentAddAndSearch) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:AddButton];
}

- (void)addButtonPresentAddAndSearch {
    AddAndSearchViewController *addAndSearchViewController = [[AddAndSearchViewController alloc] init];
    addAndSearchViewController.addAndSearchViewControllerDelegate = self;
    [self presentViewController:addAndSearchViewController animated:YES completion:nil];
}

- (void) passJKWBriefCityWeatherNSO:(JKWBriefCityWeatherNSO *)tempJKWBriefCityWeatherNSO {
    for (JKWBriefCityWeatherNSO *temp1BriefCityWeatherNSO in _BriefCityWeatherMut) {
        if ([tempJKWBriefCityWeatherNSO.cityIDStr isEqualToString:temp1BriefCityWeatherNSO.cityIDStr]) {
            return;
        }
    }
    [_BriefCityWeatherMut addObject:tempJKWBriefCityWeatherNSO];
    [_tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _BriefCityWeatherMut.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        JKWBriefCityWeatherNSO *tempBriefCityWeatherNSO = [[JKWBriefCityWeatherNSO alloc] init];
        tempBriefCityWeatherNSO = _BriefCityWeatherMut[indexPath.row];
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.AMSymbol = @"上午";
        formatter.PMSymbol = @"下午";
        [formatter setDateFormat:@"aaa hh:mm"];
        NSString *dateTime = [formatter stringFromDate:[NSDate date]];
        UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(JKWDeviceWidth * 0.05 * 0.5, JKWDeviceHeight * 0.1175 * 0.1 * 0.5, JKWDeviceWidth * 0.15 * 2, JKWDeviceHeight * 0.1175 * 0.4)];
        timeLabel.text = dateTime;
        timeLabel.textColor = [UIColor colorWithRed:1.00f green:1.00f blue:1.00f alpha:1.00f];
        timeLabel.font = [UIFont boldSystemFontOfSize:15];
        [cell.contentView addSubview:timeLabel];
        
        UILabel *cityNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(JKWDeviceWidth * 0.05 * 0.5, JKWDeviceHeight * 0.1175 * 0.1 * 0.5 + JKWDeviceHeight * 0.1175 * 0.4, JKWDeviceWidth * 0.15 * 2, JKWDeviceHeight * 0.1175 * 0.4)];
        cityNameLabel.text = tempBriefCityWeatherNSO.cityNameString;
        cityNameLabel.textColor = [UIColor whiteColor];
        cityNameLabel.font = [UIFont boldSystemFontOfSize:25];
        [cell.contentView addSubview:cityNameLabel];
        
        //self.view.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.7f];
        cell.backgroundColor = [UIColor colorWithWhite:0 alpha:0.55];
        cell.contentView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.55];
        cell.contentView.alpha = 0.5;
        
        UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(JKWDeviceWidth * 0.7, JKWDeviceHeight * 0.1175 * 0.1, JKWDeviceWidth * 0.15 * 2, JKWDeviceHeight * 0.1175 * 0.8)];
        tempLabel.text = [tempBriefCityWeatherNSO.tempString stringByAppendingString:@"℃"];
        //tempLabel.text = tempBriefCityWeatherNSO.tempString;
    
        tempLabel.textColor = [UIColor whiteColor];
        tempLabel.font = [UIFont systemFontOfSize:45];
        [cell.contentView addSubview:tempLabel];
    }
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return JKWDeviceHeight * 0.1175;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.0001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
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
