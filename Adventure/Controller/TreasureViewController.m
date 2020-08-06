//
//  TreasureViewController.m
//  Adventure
//
//  Created by admin on 2020/7/21.
//  Copyright © 2020 adv. All rights reserved.
//

#import "TreasureViewController.h"
#import "NewItemViewController.h"
#import "ToastView.h"
@interface TreasureViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *treasureImageView;
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UIImageView *lightImageView;

@end

@implementation TreasureViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view from its nib.
}
- (IBAction)openClick:(id)sender {
    UIButton * button = sender;
    button.enabled = NO;
    
    self.treasureImageView.image = [UIImage imageNamed:@"treasureOpen"];
    
    self.itemImageView.hidden = NO;
    self.lightImageView.hidden = NO;
    
    NSInteger random = arc4random()%3;
    
    if (!random) {
            NewItemViewController * itemVC = [NewItemViewController new];
        [itemVC setUpUI];
        self.itemImageView.image = [UIImage imageNamed:itemVC.NewItem.Image];
        [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            self.itemImageView.transform = CGAffineTransformMakeScale(4, 4);
            self.lightImageView.transform = CGAffineTransformRotate(self.lightImageView.transform, M_PI_4);
        } completion:^(BOOL finished) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self viewReturn];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"NewItem" object:nil userInfo:@{@"item":itemVC}];
            });

        }];
    }else{
        
        self.itemImageView.image = [UIImage imageNamed:@"SoulShard"];
             [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                 self.itemImageView.transform = CGAffineTransformMakeScale(4, 4);
                 self.lightImageView.transform = CGAffineTransformRotate(self.lightImageView.transform, M_PI_4);
             } completion:^(BOOL finished) {
                 [ToastView showToastWithText:@"You get 50 pieces of SoulShard."];

                 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                 });
                 [[NSNotificationCenter defaultCenter] postNotificationName:@"refresh" object:nil];

                 [self viewReturn];

             }];
        
    }
    



    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
