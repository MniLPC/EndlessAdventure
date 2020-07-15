//
//  ProfessionTableViewCell.m
//  Adventure
//
//  Created by admin on 2020/7/14.
//  Copyright © 2020 adv. All rights reserved.
//

#import "ProfessionTableViewCell.h"

@implementation ProfessionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
    UIView * bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    bgView.backgroundColor = ColorWithHex(0xFFC125);
    self.selectedBackgroundView = bgView;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
