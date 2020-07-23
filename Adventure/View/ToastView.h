//
//  ToastView.h
//  Adventure
//
//  Created by admin on 2020/7/23.
//  Copyright © 2020 adv. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ToastView : UIView
@property (weak, nonatomic) IBOutlet UILabel *toastLabel;
+ (void)showToastWithText:(NSString*)text;

@end
NS_ASSUME_NONNULL_END
