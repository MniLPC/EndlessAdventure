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
@property (nonatomic,strong) NSMutableArray * buffListArray;
@property (weak, nonatomic) IBOutlet UIImageView *selfHpBar;
@property (weak, nonatomic) IBOutlet UIImageView *enemyHpBar;

@end

@implementation BattleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.buffListArray = [NSMutableArray new];
    
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
                        button.enabled = NO;
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
                btn.enabled = NO;

            }
            [self castSkill:professionDict];
            
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
                btn.enabled = NO;
            }
            
            [self castSkill:professionDict];
            
            
        }
            
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
                btn.enabled = NO;

            }
            [self castSkill:professionDict];
        }
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
                btn.enabled = NO;

            }
            
            [self castSkill:professionDict];
            
        }
            break;
    }
    
    int count = 0;
    for (UIButton * btn in self.skillButtonsArray) {
        if (!btn.enabled) {
            NSLog(@"%ld",btn.tag);
            count++;
        }
    }
    if (count == 4) {
        [self enemyAction];
        [self updateCooldown];
    }
    
}
- (void)castSkill:(NSDictionary*)dict{
    
    NSNumber * power =  dict[@"power"];
    NSString * base = dict[@"base"];
    NSNumber * buff = dict[@"buff"];
    if (buff) {
        switch (buff.intValue) {
            case 0:
            {
                NSInteger randomNum = arc4random()%100;
                if (randomNum<25-self.save.characterAttributes.DEX.integerValue/50.0) {
                    UILabel * dmgLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 50)];
                    [self.view addSubview:dmgLabel];
                    dmgLabel.font = [UIFont fontWithName:@"Palatino" size:20];
                    dmgLabel.textColor = [UIColor redColor];
                    dmgLabel.center = CGPointMake(self.enemyImageView.center.x, self.enemyImageView.center.y+50);
                    dmgLabel.text = @"Miss";
                    dmgLabel.textAlignment = NSTextAlignmentCenter;
                    [UIView animateWithDuration:2 animations:^{
                        dmgLabel.center = CGPointMake(self.enemyImageView.center.x, self.enemyImageView.center.y-100);
                    } completion:^(BOOL finished) {
                        [dmgLabel removeFromSuperview];
                    }];
                }else{
                    [self enemyShake];
                    NSNumber * baseValue = [self.save.characterAttributes valueForKey:base];
                    NSInteger powerValue = power.integerValue * (1+baseValue.integerValue/100.0);
                    NSInteger damage = powerValue*0.3;
                    UILabel * dmgLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 50)];
                    [self.view addSubview:dmgLabel];
                    dmgLabel.font = [UIFont fontWithName:@"Palatino" size:20];
                    dmgLabel.textColor = [UIColor redColor];
                    dmgLabel.center = CGPointMake(self.enemyImageView.center.x, self.enemyImageView.center.y+50);
                    dmgLabel.text = [NSString stringWithFormat:@"%@-%ld",dict[@"name"],damage];
                    dmgLabel.textAlignment = NSTextAlignmentCenter;
                    [UIView animateWithDuration:2 animations:^{
                        dmgLabel.center = CGPointMake(self.enemyImageView.center.x, self.enemyImageView.center.y-100);
                    } completion:^(BOOL finished) {
                        [dmgLabel removeFromSuperview];
                    }];
                    
                }
            }
                break;
            case 1:
            {
                [self.buffListArray addObject:@1];
                
                NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"BuffList"ofType:@"plist"];
                NSArray * BuffArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
                NSString * BuffDes = BuffArray[0];
                UILabel * dmgLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 50)];
                [self.view addSubview:dmgLabel];
                dmgLabel.font = [UIFont fontWithName:@"Palatino" size:20];
                dmgLabel.textColor = [UIColor yellowColor];
                dmgLabel.center = CGPointMake(self.selfImageView.center.x, self.selfImageView.center.y+50);
                dmgLabel.text = BuffDes;
                dmgLabel.textAlignment = NSTextAlignmentCenter;
                [UIView animateWithDuration:2 animations:^{
                    dmgLabel.center = CGPointMake(self.selfImageView.center.x, self.selfImageView.center.y-100);
                } completion:^(BOOL finished) {
                    [dmgLabel removeFromSuperview];
                }];
                
            }
                break;
            case 2:
            {
                [self.buffListArray addObject:@2];

                NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"BuffList"ofType:@"plist"];
                NSArray * BuffArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
                NSString * BuffDes = BuffArray[1];
                UILabel * dmgLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 50)];
                [self.view addSubview:dmgLabel];
                dmgLabel.font = [UIFont fontWithName:@"Palatino" size:20];
                dmgLabel.textColor = [UIColor yellowColor];
                dmgLabel.center = CGPointMake(self.selfImageView.center.x, self.selfImageView.center.y+50);
                dmgLabel.text = BuffDes;
                dmgLabel.textAlignment = NSTextAlignmentCenter;
                [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                    dmgLabel.center = CGPointMake(self.selfImageView.center.x, self.selfImageView.center.y-100);
                    
                } completion:^(BOOL finished) {
                    [dmgLabel removeFromSuperview];
                    
                }];
                
            }
                break;
            case 3:
            {
                [self updateCooldown];

                NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"BuffList"ofType:@"plist"];
                NSArray * BuffArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
                NSString * BuffDes = BuffArray[2];
                UILabel * dmgLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 50)];
                [self.view addSubview:dmgLabel];
                dmgLabel.font = [UIFont fontWithName:@"Palatino" size:20];
                dmgLabel.textColor = [UIColor yellowColor];
                dmgLabel.center = CGPointMake(self.selfImageView.center.x, self.selfImageView.center.y+50);
                dmgLabel.text = BuffDes;
                dmgLabel.textAlignment = NSTextAlignmentCenter;
                [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                    dmgLabel.center = CGPointMake(self.selfImageView.center.x, self.selfImageView.center.y-100);
                } completion:^(BOOL finished) {
                    [dmgLabel removeFromSuperview];
                }];
            }
                break;
            case 4:
            {

                [self.buffListArray addObject:@4];
                self.selfHpBar.layer.borderWidth = 3;
                self.selfHpBar.layer.borderColor = [UIColor yellowColor].CGColor;
                NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"BuffList"ofType:@"plist"];
                NSArray * BuffArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
                NSString * BuffDes = BuffArray[3];
                UILabel * dmgLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 50)];
                [self.view addSubview:dmgLabel];
                dmgLabel.font = [UIFont fontWithName:@"Palatino" size:20];
                dmgLabel.textColor = [UIColor yellowColor];
                dmgLabel.center = CGPointMake(self.selfImageView.center.x, self.selfImageView.center.y+50);
                dmgLabel.text = BuffDes;
                dmgLabel.textAlignment = NSTextAlignmentCenter;
                [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                    dmgLabel.center = CGPointMake(self.selfImageView.center.x, self.selfImageView.center.y-100);
                } completion:^(BOOL finished) {
                    [dmgLabel removeFromSuperview];
                }];
            }
                break;
            case 5:
            {

                [self.buffListArray addObject:@5];
                NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"BuffList"ofType:@"plist"];
                NSArray * BuffArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
                NSString * BuffDes = BuffArray[4];
                UILabel * dmgLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 50)];
                [self.view addSubview:dmgLabel];
                dmgLabel.font = [UIFont fontWithName:@"Palatino" size:20];
                dmgLabel.textColor = [UIColor yellowColor];
                dmgLabel.center = CGPointMake(self.selfImageView.center.x, self.selfImageView.center.y+50);
                dmgLabel.text = BuffDes;
                dmgLabel.textAlignment = NSTextAlignmentCenter;
                [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                    dmgLabel.center = CGPointMake(self.selfImageView.center.x, self.selfImageView.center.y-100);
                } completion:^(BOOL finished) {
                    [dmgLabel removeFromSuperview];
                }];
            }
                break;
            case 6:
            {

                [self.buffListArray addObject:@6];
                self.characterHpConstraint.constant += 200*0.3;
                if (self.characterHpConstraint.constant>200) {
                    self.characterHpConstraint.constant = 200;
                }
                NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"BuffList"ofType:@"plist"];
                NSArray * BuffArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
                NSString * BuffDes = BuffArray[5];
                UILabel * dmgLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 50)];
                [self.view addSubview:dmgLabel];
                dmgLabel.font = [UIFont fontWithName:@"Palatino" size:20];
                dmgLabel.textColor = [UIColor yellowColor];
                dmgLabel.center = CGPointMake(self.selfImageView.center.x, self.selfImageView.center.y+50);
                dmgLabel.text = BuffDes;
                dmgLabel.textAlignment = NSTextAlignmentCenter;
                [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                    dmgLabel.center = CGPointMake(self.selfImageView.center.x, self.selfImageView.center.y-100);
                    
                } completion:^(BOOL finished) {
                    [dmgLabel removeFromSuperview];
                    
                }];
            }
                break;
            default:
            {
                [self.buffListArray addObject:@7];

                NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"BuffList"ofType:@"plist"];
                NSArray * BuffArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
                NSString * BuffDes = BuffArray[5];
                UILabel * dmgLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 50)];
                [self.view addSubview:dmgLabel];
                dmgLabel.font = [UIFont fontWithName:@"Palatino" size:20];
                dmgLabel.textColor = [UIColor yellowColor];
                dmgLabel.center = CGPointMake(self.selfImageView.center.x, self.selfImageView.center.y+50);
                dmgLabel.text = BuffDes;
                dmgLabel.textAlignment = NSTextAlignmentCenter;
                [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                    dmgLabel.center = CGPointMake(self.selfImageView.center.x, self.selfImageView.center.y-100);
                    
                } completion:^(BOOL finished) {
                    [dmgLabel removeFromSuperview];
                    
                }];
            }
                break;
        }
    }
}

- (void)enemyAction{
    if (!self.isBoss) {
        NSArray * skillOrderArray = @[@0, @2, @12, @15, @20];
        NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"SkillList"ofType:@"plist"];
        NSArray * skillArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
        int  random = arc4random()%skillOrderArray.count;
        NSDictionary * skilldict = skillArray[random];
#warning todo
        
    }
    
    
    
}

- (void)selfShake{
    
    CGFloat t =4.0;
       CGAffineTransform translateRight  =CGAffineTransformTranslate(CGAffineTransformIdentity, t,0.0);
       CGAffineTransform translateLeft =CGAffineTransformTranslate(CGAffineTransformIdentity,-t,0.0);
    self.selfImageView.transform = translateLeft;
       [UIView animateWithDuration:0.07 delay:0.0 options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
           [UIView setAnimationRepeatCount:2.0];
           self.selfImageView.transform = translateRight;
       } completion:^(BOOL finished){
           if(finished){
               [UIView animateWithDuration:0.05 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                   self.selfImageView.transform =CGAffineTransformIdentity;
               } completion:NULL];
           }
       }];
    
    
}
- (void)enemyShake{
    CGFloat t =4.0;
       CGAffineTransform translateRight  =CGAffineTransformTranslate(CGAffineTransformIdentity, t,0.0);
       CGAffineTransform translateLeft =CGAffineTransformTranslate(CGAffineTransformIdentity,-t,0.0);
    self.enemyImageView.transform = translateLeft;
       [UIView animateWithDuration:0.07 delay:0.0 options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
           [UIView setAnimationRepeatCount:2.0];
           self.enemyImageView.transform = translateRight;
       } completion:^(BOOL finished){
           if(finished){
               [UIView animateWithDuration:0.05 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                   self.enemyImageView.transform =CGAffineTransformIdentity;
               } completion:NULL];
           }
       }];
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
    
    if (btn.hidden) {
        btn.enabled = NO;
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
