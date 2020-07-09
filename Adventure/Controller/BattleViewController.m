//
//  BattleViewController.m
//  Adventure
//
//  Created by admin on 2020/7/9.
//  Copyright © 2020 adv. All rights reserved.
//

#import "BattleViewController.h"
#import "DescriptionView.h"
@interface BattleViewController ()
@property (weak, nonatomic) IBOutlet UIView *characterTextCenterView;
@property (weak, nonatomic) IBOutlet UIView *enemyTextCenterView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *characterHpConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *enemyHpConstraint;
@property (weak, nonatomic) IBOutlet UILabel *selfLevelLabel;
@property (weak, nonatomic) IBOutlet UILabel *selfName;
@property (weak, nonatomic) IBOutlet UILabel *enemyLevelLabel;
@property (weak, nonatomic) IBOutlet UILabel *enemyName;
@property (weak, nonatomic) IBOutlet UIImageView *selfImageView;
@property (weak, nonatomic) IBOutlet UIImageView *enemyImageView;

@end

@implementation BattleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)stateClick:(id)sender {
    [DescriptionView ShowDescriptionWithType:0 index:0];
    
}
- (IBAction)settingClick:(id)sender {
}
- (IBAction)skillClick:(UIButton *)sender {
}
- (IBAction)runawayClick:(id)sender {
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
