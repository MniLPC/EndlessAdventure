//
//  DescriptionView.m
//  Adventure
//
//  Created by admin on 2020/7/9.
//  Copyright © 2020 adv. All rights reserved.
//

#import "DescriptionView.h"

@implementation DescriptionView
+ (void)ShowDescriptionWithType:(NSInteger)type index:(NSInteger)index{
    
    DescriptionView * desView = [[NSBundle mainBundle] loadNibNamed:@"DescriptionView" owner:nil options:nil].firstObject;
    desView.frame = CGRectMake(0, 0, 414, 217);
    desView.center = kKeyWindow.center;
    [kKeyWindow addSubview:desView];
    
    
}
- (IBAction)closeClick:(id)sender {
    [self removeFromSuperview];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
