//
//  ToastView.m
//  Adventure
//
//  Created by admin on 2020/7/23.
//  Copyright © 2020 adv. All rights reserved.
//

#import "ToastView.h"

@implementation ToastView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (void)showToastWithText:(NSString*)text{
    
    ToastView * toastView = [[NSBundle mainBundle] loadNibNamed:@"ToastView" owner:nil options:nil].firstObject;
    toastView.toastLabel.text = text;
    toastView.frame = [UIScreen mainScreen].bounds;
    [kKeyWindow addSubview:toastView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [toastView removeFromSuperview];
    });
    
}
@end
