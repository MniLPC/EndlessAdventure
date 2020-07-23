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
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *skillButtonsArray;

@end

@implementation BattleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.save) {
        self.selfImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"character_%ld",self.save.characterIndex.integerValue]];
        
        for (int i = 0; i<4; i++) {
            switch (i) {
                case 0:
                    {
                        UIButton * button = self.skillButtonsArray[i];
                                   [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"skill%ld",self.save.characterSkills.skill1.integerValue]] forState:UIControlStateNormal];
                    }
                    break;
                case 1:
                    {
                        UIButton * button = self.skillButtonsArray[i];
                                   [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"skill%ld",self.save.characterSkills.skill2.integerValue]] forState:UIControlStateNormal];
                    }
                    break;
                case 2:
                    {
                        UIButton * button = self.skillButtonsArray[i];
                                   [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"skill%ld",self.save.characterSkills.skill3.integerValue]] forState:UIControlStateNormal];
                    }
                    break;
                default:
                {
                    if (!self.save.characterSkills.skill4) {
                        return;
                    }
                    UIButton * button = self.skillButtonsArray[i];
                               [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"skill%ld",self.save.characterSkills.skill4.integerValue]] forState:UIControlStateNormal];
                }
                    break;
            }
           
            
        }
      
        
        
        
    }
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)stateClick:(id)sender {
    [DescriptionView ShowDescriptionWithType:0 index:0];
    
}
- (IBAction)settingClick:(id)sender {
    [UIView animateWithDuration:1.0 animations:^{
        self.view.alpha = 0;
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    }];
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
