//
//  AddAndSearchViewController.h
//  iPhone天气预报仿写
//
//  Created by 姜凯文 on 2018/8/14.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKWBriefCityWeatherNSO.h"
@protocol AddAndSearchViewControllerDelegate <NSObject>
- (void) passJKWBriefCityWeatherNSO:(JKWBriefCityWeatherNSO *)tempJKWBriefCityWeatherNSO;
@end
@interface AddAndSearchViewController : UIViewController

@property (nonatomic) NSString *testStatusStr;
@property (nonatomic) NSString *cityTempStr;
@property (nonatomic) NSString *tempCityIDStr;

@property (nonatomic, weak)id <AddAndSearchViewControllerDelegate> addAndSearchViewControllerDelegate;
@end
