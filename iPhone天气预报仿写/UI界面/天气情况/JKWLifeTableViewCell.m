//
//  JKWLifeTableViewCell.m
//  iPhone天气预报仿写
//
//  Created by 姜凯文 on 2018/8/16.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "JKWLifeTableViewCell.h"

@implementation JKWLifeTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _littleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_littleLabel];
        
        _bigLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_bigLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _littleLabel.frame = CGRectMake(15, 10, 400, 15);
    
    _bigLabel.frame = CGRectMake(15, 10 + 15 + 5, 400, 30);
    
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
