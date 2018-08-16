//
//  JKWAddressTableViewCell.m
//  iPhone天气预报仿写
//
//  Created by 姜凯文 on 2018/8/15.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "JKWAddressTableViewCell.h"
#define JKWDeviceWidth [UIScreen mainScreen].bounds.size.width
#define JKWDeviceHeight [UIScreen mainScreen].bounds.size.height

@implementation JKWAddressTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _cityNameLabel = [[JKWWhiteLabel alloc] init];
        [self.contentView addSubview:_cityNameLabel];
        
        _cityWeatherLabel = [[JKWWhiteLabel alloc] init];
        [self.contentView addSubview:_cityWeatherLabel];
        
        _cityTempLabel = [[JKWWhiteLabel alloc] init];
        [self.contentView addSubview:_cityTempLabel];
        
        _cityWeekLabel = [[JKWWhiteLabel alloc] init];
        [self.contentView addSubview:_cityWeekLabel];
        
        _cityTodayLabel = [[JKWWhiteLabel alloc] init];
        [self.contentView addSubview:_cityTodayLabel];
        
        _cityMaxLabel = [[JKWWhiteLabel alloc] init];
        [self.contentView addSubview:_cityMaxLabel];
        
        _cityMinLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_cityMinLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _cityNameLabel.frame = CGRectMake(JKWDeviceWidth * 0.2 * 2 - 10, JKWDeviceHeight * 0.4 * 0.1, JKWDeviceWidth * 0.2 + 20, JKWDeviceHeight * 0.4 * 0.2 - 30);
    
    _cityWeatherLabel.frame = CGRectMake(JKWDeviceWidth * 0.2 * 2 + JKWDeviceWidth * 0.2 * 0.333 - 10,  JKWDeviceHeight * 0.4 * 0.2 + JKWDeviceHeight * 0.4 * 0.2 * 0.333 + 10 - 20, JKWDeviceWidth * 0.2 * 0.333 + 20, JKWDeviceHeight * 0.4 * 0.2 * 0.333 + 20);
    
    _cityTempLabel.frame = CGRectMake(JKWDeviceWidth * 0.35, JKWDeviceHeight * 0.4 * 0.2 + JKWDeviceHeight * 0.4 * 0.2 * 0.333 + 10 + JKWDeviceHeight * 0.4 * 0.2 * 0.333 * 0.5 + 30 - 20, JKWDeviceWidth * 0.3, JKWDeviceHeight * 0.4 * 0.4 * 0.75);
    
    _cityWeekLabel.frame = CGRectMake(15, JKWDeviceHeight * 0.4 - 20 - 15, 90, 30);
    
    _cityTodayLabel.frame = CGRectMake(30 + 90 + 10 - 15, JKWDeviceHeight * 0.4 - 20 - 15, 40, 30);
    
    _cityMaxLabel.frame = CGRectMake(JKWDeviceWidth - 15 - 30 - 20 - 30, JKWDeviceHeight * 0.4 - 20 - 15, 30, 30);
    
    _cityMinLabel.frame = CGRectMake(JKWDeviceWidth - 15 - 30, JKWDeviceHeight * 0.4 - 20 - 15, 30, 30);
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
