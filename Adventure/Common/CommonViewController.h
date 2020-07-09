//
//  LPCBaseViewController.h
//  liveShell
//
//  Created by Mac on 2019/1/3.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^afterLoading)(void);
@interface CommonViewController : UIViewController
- (void)adjustScrollView:(UIScrollView *)scrollView;
- (void)showToast:(NSString *)toast;
@end
