//
//  DetailedWeatherViewController.h
//  iPhone天气预报仿写
//
//  Created by 姜凯文 on 2018/8/15.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailedWeatherViewController : UIViewController

@property (nonatomic) UIPageControl *cityPageControl;
@property (nonatomic, strong) UIScrollView *cityScrollView;
@property (nonatomic) NSMutableArray *cityManageMut;
@property (nonatomic) NSUInteger count;

@end
