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
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *skillNameLabels;

@end

@implementation BattleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (!self.isBoss) {

        int random = arc4random()%36;
        self.enemyImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"enemy%d",random]];
        self.enemyName.text = MonsterNamesArray[random];
    }
    if (self.save) {
        self.selfImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"character_%ld",self.save.characterIndex.integerValue]];
        
        for (int i = 0; i<4; i++) {
            switch (i) {
                case 0:
                    {

                        
                        UIButton * button = self.skillButtonsArray[i];
                                   [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"skill%ld",self.save.characterSkills.skill1.integerValue]] forState:UIControlStateNormal];
                        
                        NSInteger  coolDown = self.save.characterSkills.skillCoolDown1.integerValue;
                        if (coolDown) {
                            button.enabled = NO;
                            [button setTitle:[NSString stringWithFormat:@"%ld",coolDown] forState:UIControlStateNormal];
                        }else{
                            button.enabled = YES;
                        }
                        NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"SkillList"ofType:@"plist"];

                            NSArray * professionArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
                        NSDictionary * professionDict = professionArray[self.save.characterSkills.skill1.integerValue];
                        
                        UILabel * skillNameLabel = self.skillNameLabels[i];
                        skillNameLabel.text= professionDict[@"name"];
                    }
                    break;
                case 1:
                    {
                        UIButton * button = self.skillButtonsArray[i];
                                   [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"skill%ld",self.save.characterSkills.skill2.integerValue]] forState:UIControlStateNormal];
                        NSInteger  coolDown = self.save.characterSkills.skillCoolDown2.integerValue;
                        if (coolDown) {
                            button.enabled = NO;
                            [button setTitle:[NSString stringWithFormat:@"%ld",coolDown] forState:UIControlStateNormal];
                        }else{
                            button.enabled = YES;
                        }
                        NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"SkillList"ofType:@"plist"];

                                                 NSArray * professionArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
                                             NSDictionary * professionDict = professionArray[self.save.characterSkills.skill2.integerValue];
                                             
                                             UILabel * skillNameLabel = self.skillNameLabels[i];
                                             skillNameLabel.text= professionDict[@"name"];
                    }
                    break;
                case 2:
                    {
                        UIButton * button = self.skillButtonsArray[i];
                                   [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"skill%ld",self.save.characterSkills.skill3.integerValue]] forState:UIControlStateNormal];
                        NSInteger  coolDown = self.save.characterSkills.skillCoolDown3.integerValue;
                        if (coolDown) {
                            button.enabled = NO;
                            [button setTitle:[NSString stringWithFormat:@"%ld",coolDown] forState:UIControlStateNormal];
                        }else{
                            button.enabled = YES;
                        }
                        NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"SkillList"ofType:@"plist"];

                                                 NSArray * professionArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
                                             NSDictionary * professionDict = professionArray[self.save.characterSkills.skill3.integerValue];
                                             
                                             UILabel * skillNameLabel = self.skillNameLabels[i];
                                             skillNameLabel.text= professionDict[@"name"];
                    }
                    break;
                default:
                {  UILabel * skillNameLabel = self.skillNameLabels[i];
                    UIButton * button = self.skillButtonsArray[i];

                    if (!self.save.characterSkills.skill4) {
                        skillNameLabel.text = @"";
                        button.hidden = YES;
                        return;
                    }
                    NSInteger  coolDown = self.save.characterSkills.skillCoolDown4.integerValue;
                    if (coolDown) {
                        button.enabled = NO;
                        [button setTitle:[NSString stringWithFormat:@"%ld",coolDown] forState:UIControlStateNormal];
                    }else{
                        button.enabled = YES;
                    }
                    button.hidden = NO;

                               [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"skill%ld",self.save.characterSkills.skill4.integerValue]] forState:UIControlStateNormal];
                    
                    NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"SkillList"ofType:@"plist"];

                                             NSArray * professionArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
                                         NSDictionary * professionDict = professionArray[self.save.characterSkills.skill4.integerValue];
                                         
                                       
                                         skillNameLabel.text= professionDict[@"name"];
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
    [self updateCooldown];

    switch (sender.tag) {
        case 0:
        {


            NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"SkillList"ofType:@"plist"];
            NSArray * professionArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
            NSDictionary * professionDict = professionArray[self.save.characterSkills.skill1.integerValue];
            self.save.characterSkills.skillCoolDown1 = professionDict[@"cooldown"];
     
            UIButton * btn = self.skillButtonsArray[sender.tag];
            NSNumber * cooldown = professionDict[@"cooldown"];
            if (cooldown.integerValue) {
                 [btn setTitle:professionDict[@"cooldown"] forState:UIControlStateNormal];
            }
                
            
        }
            break;
        case 1:
        {
  

            NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"SkillList"ofType:@"plist"];
            NSArray * professionArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
            NSDictionary * professionDict = professionArray[self.save.characterSkills.skill2.integerValue];
            self.save.characterSkills.skillCoolDown2 = professionDict[@"cooldown"];
                 UIButton * btn = self.skillButtonsArray[sender.tag];
                           NSNumber * cooldown = professionDict[@"cooldown"];
                           if (cooldown.integerValue) {
                                [btn setTitle:professionDict[@"cooldown"] forState:UIControlStateNormal];
                           }        }
            break;
        case 2:
        {
            


            NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"SkillList"ofType:@"plist"];
            NSArray * professionArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
            NSDictionary * professionDict = professionArray[self.save.characterSkills.skill3.integerValue];
            self.save.characterSkills.skillCoolDown3 = professionDict[@"cooldown"];
            UIButton * btn = self.skillButtonsArray[sender.tag];
                      NSNumber * cooldown = professionDict[@"cooldown"];
                      if (cooldown.integerValue) {
                           [btn setTitle:professionDict[@"cooldown"] forState:UIControlStateNormal];
                      }        }
            break;
        default:
        {


            NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"SkillList"ofType:@"plist"];
            NSArray * professionArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
            NSDictionary * professionDict = professionArray[self.save.characterSkills.skill4.integerValue];
            self.save.characterSkills.skillCoolDown4 = professionDict[@"cooldown"];
            UIButton * btn = self.skillButtonsArray[sender.tag];
                      NSNumber * cooldown = professionDict[@"cooldown"];
            if (cooldown.integerValue) {
                [btn setTitle:professionDict[@"cooldown"] forState:UIControlStateNormal];
            }
            
            
        }
            break;
    }

}

- (void)updateCooldown{
    
    NSInteger cooldown = self.save.characterSkills.skillCoolDown1.integerValue;
    UIButton * btn = self.skillButtonsArray[0];

    if (cooldown>1) {
        cooldown--;
        [btn setTitle:[NSString stringWithFormat:@"%ld",cooldown] forState:UIControlStateNormal];
        self.save.characterSkills.skillCoolDown1 = @(cooldown);

    }else{
        self.save.characterSkills.skillCoolDown1 = @0;
        btn.enabled = YES;
        [btn setTitle:@"" forState:UIControlStateNormal];
    }
    
    cooldown = self.save.characterSkills.skillCoolDown2.integerValue;
    btn = self.skillButtonsArray[1];

    if (cooldown>1) {
        
        cooldown--;
        [btn setTitle:[NSString stringWithFormat:@"%ld",cooldown] forState:UIControlStateNormal];
        self.save.characterSkills.skillCoolDown2 = @(cooldown);

    }else{
        self.save.characterSkills.skillCoolDown2 = @0;

        btn.enabled = YES;
        [btn setTitle:@"" forState:UIControlStateNormal];
    }
    
    cooldown = self.save.characterSkills.skillCoolDown3.integerValue;
    btn = self.skillButtonsArray[2];

    if (cooldown>1) {
        cooldown--;
        [btn setTitle:[NSString stringWithFormat:@"%ld",cooldown] forState:UIControlStateNormal];
        self.save.characterSkills.skillCoolDown3 = @(cooldown);

    }else{
        self.save.characterSkills.skillCoolDown3 = @0;

        btn.enabled = YES;
        [btn setTitle:@"" forState:UIControlStateNormal];
    }
    
    cooldown = self.save.characterSkills.skillCoolDown4.integerValue;
    btn = self.skillButtonsArray[3];

    if (cooldown>1) {
        cooldown--;
        [btn setTitle:[NSString stringWithFormat:@"%ld",cooldown] forState:UIControlStateNormal];
        self.save.characterSkills.skillCoolDown4 = @(cooldown);

    }else{
        self.save.characterSkills.skillCoolDown4 = @0;

        btn.enabled = YES;
        [btn setTitle:@"" forState:UIControlStateNormal];
    }
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
