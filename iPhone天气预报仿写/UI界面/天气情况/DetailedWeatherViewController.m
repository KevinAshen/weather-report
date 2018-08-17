//
//  DetailedWeatherViewController.m
//  iPhone天气预报仿写
//
//  Created by 姜凯文 on 2018/8/15.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "DetailedWeatherViewController.h"
#import "JKWDetailedWeatherView.h"
#import "CityNameManageViewController.h"
#define JKWDeviceWidth [UIScreen mainScreen].bounds.size.width
#define JKWDeviceHeight [UIScreen mainScreen].bounds.size.height

@interface DetailedWeatherViewController ()<UIScrollViewDelegate>

@end

@implementation DetailedWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //_cityManageMut = [[NSMutableArray alloc] init];
    NSLog(@"%lu", _cityManageMut.count);
    
    UIImage *backgroundImage = [UIImage imageNamed:@"cccfa962703f398d390dd810d18d1e9d.jpg"];
    self.view.layer.contents = (id)backgroundImage.CGImage;
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, JKWDeviceHeight * 0.94, JKWDeviceWidth, JKWDeviceHeight * 0.06)];
    bottomView.backgroundColor = [UIColor blackColor];
    bottomView.alpha = 0.7;
    [self.view addSubview:bottomView];
    
    UIButton *ListButton = [[UIButton alloc] initWithFrame:CGRectMake(JKWDeviceWidth * 0.9, JKWDeviceHeight * 0.06 * 0.15, JKWDeviceWidth * 0.1, JKWDeviceHeight * 0.06 * 0.8)];
    [ListButton setImage:[UIImage imageNamed:@"按钮"] forState:UIControlStateNormal];
    [ListButton addTarget:self action:@selector(presentList) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:ListButton];
    
    _cityPageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(JKWDeviceWidth * 0.3, JKWDeviceHeight * 0.06 * 0.15, JKWDeviceWidth * 0.4, JKWDeviceHeight * 0.06 * 0.8)];
    _cityPageControl.numberOfPages = _cityManageMut.count;
    [bottomView addSubview:_cityPageControl];
    
    _cityScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, JKWDeviceWidth, JKWDeviceHeight * 0.94)];
    _cityScrollView.alwaysBounceHorizontal = NO;
    _cityScrollView.alwaysBounceVertical = NO;
    _cityScrollView.contentSize = CGSizeMake(0 + _cityManageMut.count * JKWDeviceWidth,  JKWDeviceHeight * 0.94);
    _cityScrollView.delegate = self;
    _cityScrollView.pagingEnabled = YES;
    _cityScrollView.scrollEnabled = YES;
    _cityScrollView.bounces = YES;
    _cityScrollView.bouncesZoom = NO;
    _cityScrollView.showsHorizontalScrollIndicator = NO;
    _cityScrollView.backgroundColor = [UIColor clearColor];
    [_cityScrollView setContentOffset:CGPointMake(JKWDeviceWidth * _count, 0) animated:YES];
    
    for (int i = 0; i < _cityManageMut.count; i++) {
        JKWDetailedWeatherView *detailedWeatherView = [[JKWDetailedWeatherView alloc] initWithFrame:CGRectMake(0 + i * JKWDeviceWidth, 0, JKWDeviceWidth, JKWDeviceHeight * 0.94)WithCityWeather:_cityManageMut[i]];
        [_cityScrollView addSubview:detailedWeatherView];
    }
    [self.view addSubview:_cityScrollView];
}

- (void) presentList {
    //CityNameManageViewController *cityNameManageViewController = [[CityNameManageViewController alloc] init];
    [self dismissViewControllerAnimated:YES completion:nil];
}

//正在滚动的时候
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int page = (scrollView.contentOffset.x + scrollView.frame.size.width / 2)/ scrollView.frame.size.width;
    self.cityPageControl.currentPage = page;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
