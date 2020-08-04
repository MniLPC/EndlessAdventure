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
@property (nonatomic,strong) NSMutableArray * enemyBuffListArray;
@property (weak, nonatomic) IBOutlet UIImageView *selfHpBar;
@property (weak, nonatomic) IBOutlet UIImageView *enemyHpBar;
@property (nonatomic,assign) NSInteger enemyPoisonedTurn;
@property (nonatomic,assign) NSInteger selfPoisonedTurn;
@property (nonatomic,assign) NSInteger enemyLevel;
@property (nonatomic,assign) NSInteger enemyHp;
@property (nonatomic,assign) NSInteger enemyMaxHp;
@property (weak, nonatomic) IBOutlet UILabel *enemyHpLabel;
@property (weak, nonatomic) IBOutlet UILabel *selfHpLabel;
@property (weak, nonatomic) IBOutlet UIButton *effectBtn;
@end

@implementation BattleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.buffListArray = [NSMutableArray new];
    self.enemyBuffListArray = [NSMutableArray new];
    self.enemyLevel = self.save.floor.integerValue;
    self.enemyLevelLabel.text = [NSString stringWithFormat:@"Lv%ld",self.enemyLevel];
    self.selfLevelLabel.text = [NSString stringWithFormat:@"Lv%ld",self.save.characterAttributes.Level.integerValue];
    NSInteger random = arc4random()%20;
    self.enemyMaxHp = (self.enemyLevel/10.0+1)*80+random;
    self.enemyHp = self.enemyMaxHp;
    self.enemyHpLabel.text = [NSString stringWithFormat:@"%.0ld/%.0ld",(long)self.enemyMaxHp,(long)self.enemyMaxHp];
    self.selfHpLabel.text = [NSString stringWithFormat:@"%ld/%ld",self.save.characterAttributes.HP.integerValue,self.save.characterAttributes.MaxHp.integerValue];
    [self.effectBtn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"effectIcon%ld",self.effectIndex]] forState:UIControlStateNormal];

    NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"ProfessionList"ofType:@"plist"];

         NSArray * professionArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
    NSDictionary * professionDict = professionArray[self.save.characterIndex.integerValue];
    self.selfName.text = professionDict[@"name"];
    
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
    [DescriptionView ShowDescriptionWithType:0 index:self.effectIndex];
    
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
            [self castSkill:professionDict targetImageView:self.enemyImageView];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if (!professionDict[@"Instant"]) {
                    [self enemyAction];
                }
                int count = 0;
                
                for (UIButton * btn in self.skillButtonsArray) {

                    if (!btn.enabled) {
                        NSLog(@"%ld",btn.tag);
                        count++;
                    }
                }
                if (count == 4) {
                    [self updateCooldown];
                }
            });
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
            
            [self castSkill:professionDict targetImageView:self.enemyImageView];

            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if (!professionDict[@"Instant"]) {
                    [self enemyAction];
                }
                int count = 0;
                
                for (UIButton * btn in self.skillButtonsArray) {

                    if (!btn.enabled) {
                        NSLog(@"%ld",btn.tag);
                        count++;
                    }
                }
                if (count == 4) {
                    [self updateCooldown];
                }
            });
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
            [self castSkill:professionDict targetImageView:self.enemyImageView];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if (!professionDict[@"Instant"]) {
                    [self enemyAction];
                }
                int count = 0;
                
                for (UIButton * btn in self.skillButtonsArray) {

                    if (!btn.enabled) {
                        NSLog(@"%ld",btn.tag);
                        count++;
                    }
                }
                if (count == 4) {
                    [self updateCooldown];
                }
            });
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
            
            [self castSkill:professionDict targetImageView:self.enemyImageView];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if (!professionDict[@"Instant"]) {
                    [self enemyAction];
                }
                int count = 0;
                
                for (UIButton * btn in self.skillButtonsArray) {

                    if (!btn.enabled) {
                        NSLog(@"%ld",btn.tag);
                        count++;
                    }
                }
                if (count == 4) {
                    [self updateCooldown];
                }
            });
        }
            break;
    }
    



    

}

- (void)castSkill:(NSDictionary*)dict targetImageView:(UIImageView*)targetView{
    

    NSMutableArray * bufflistArray;
    NSMutableArray * targetBuffListArray;
    UIImageView * selfImageView;
    if (targetView == self.enemyImageView) {
        selfImageView = self.selfImageView;
        if (!dict[@"Instant"]) {
                    [self updateCooldown];
        }
        bufflistArray = self.buffListArray;
        targetBuffListArray = self.enemyBuffListArray;
    }else{
        selfImageView = self.enemyImageView;
        bufflistArray = self.enemyBuffListArray;
        targetBuffListArray = self.buffListArray;
    }
    
    NSNumber * power =  dict[@"power"];
    NSString * base = dict[@"base"];
    NSNumber * buff = dict[@"buff"];
    NSNumber * debuff = dict[@"debuff"];
    if (self.effectIndex == 1) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                   
                                                             UILabel * dmgLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 50)];
                                                             [self.view addSubview:dmgLabel];
                                                             dmgLabel.font = [UIFont fontWithName:@"Palatino" size:20];
                                                             dmgLabel.textColor = [UIColor greenColor];
                 dmgLabel.center = CGPointMake(selfImageView.center.x, selfImageView.center.y+50);
                                                             dmgLabel.text = [NSString stringWithFormat:@"Bless:+10"];
                                                             dmgLabel.textAlignment = NSTextAlignmentCenter;
                                                             [UIView animateWithDuration:2 animations:^{
                                                                 dmgLabel.center = CGPointMake(selfImageView.center.x, selfImageView.center.y-100);
                                                             } completion:^(BOOL finished) {
                                                                 [dmgLabel removeFromSuperview];
                                                             }];
                               });
    }else if (self.effectIndex == 2){
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                        UILabel * dmgLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 50)];
                                                                  [self.view addSubview:dmgLabel];
                                                                  dmgLabel.font = [UIFont fontWithName:@"Palatino" size:20];
                                                                  dmgLabel.textColor = [UIColor redColor];
                                                                  dmgLabel.center = CGPointMake(selfImageView.center.x, selfImageView.center.y+50);
                                                                  dmgLabel.text = [NSString stringWithFormat:@"Burn:-10"];
                                                                  dmgLabel.textAlignment = NSTextAlignmentCenter;
                                                                  [UIView animateWithDuration:2 animations:^{
                                                                      dmgLabel.center = CGPointMake(selfImageView.center.x, selfImageView.center.y-100);
                                                                  } completion:^(BOOL finished) {
                                                                      [dmgLabel removeFromSuperview];
                                                                  }];
                                   });
    }
    if (debuff.integerValue) {
        
        NSInteger randomNum = arc4random()%100;
                       if (randomNum<25-self.save.characterAttributes.DEX.integerValue/50.0) {
                           UILabel * dmgLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 50)];
                           [self.view addSubview:dmgLabel];
                           dmgLabel.font = [UIFont fontWithName:@"Palatino" size:20];
                           dmgLabel.textColor = [UIColor redColor];
                           dmgLabel.center = CGPointMake(targetView.center.x, targetView.center.y+50);
                           dmgLabel.text = @"Resist";
                           dmgLabel.textAlignment = NSTextAlignmentCenter;
                           [UIView animateWithDuration:2 animations:^{
                               dmgLabel.center = CGPointMake(targetView.center.x, targetView.center.y-100);
                           } completion:^(BOOL finished) {
                               [dmgLabel removeFromSuperview];
                           }];
                       }else{
                           if (targetView == self.enemyImageView) {
                               [self enemyShake];
                               self.enemyPoisonedTurn = 3;
                               self.enemyHpBar.layer.borderWidth =1;
                               self.enemyHpBar.layer.borderColor = [UIColor greenColor].CGColor;
                           }else{
                               [self selfShake];
                               self.selfPoisonedTurn = 3;
                               self.selfHpBar.layer.borderWidth =1;
                               self.selfHpBar.layer.borderColor = [UIColor greenColor].CGColor;
                           }
                        
                           UILabel * dmgLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 50)];
                           [self.view addSubview:dmgLabel];
                           dmgLabel.font = [UIFont fontWithName:@"Palatino" size:20];
                           dmgLabel.textColor = [UIColor redColor];
                           dmgLabel.center = CGPointMake(targetView.center.x, targetView.center.y+50);
                           dmgLabel.text = [NSString stringWithFormat:@"Poisoned"];
                           dmgLabel.textAlignment = NSTextAlignmentCenter;
                           [UIView animateWithDuration:2 animations:^{
                               dmgLabel.center = CGPointMake(targetView.center.x, targetView.center.y-100);
                           } completion:^(BOOL finished) {
                               [dmgLabel removeFromSuperview];
                           }];
                           
                       }
        return;
    }
    if (buff) {
        switch (buff.intValue) {
            case 0:
            {
                
                
                
                
                NSInteger randomNum = arc4random()%100;
                NSInteger avoid = 25;

                switch (self.effectIndex) {
                    case 4:
                        {
                                
                        avoid = 0;
                        }
                            break;
                    case 5:
                    {
                        avoid = 60;
                    }
                        break;
                }
                if ([bufflistArray containsObject:@2]) {
                    avoid = 80;
                    [bufflistArray removeObject:@2];
                }
                if (randomNum<avoid-self.save.characterAttributes.DEX.integerValue/50.0) {
                    UILabel * dmgLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 50)];
                    [self.view addSubview:dmgLabel];
                    dmgLabel.font = [UIFont fontWithName:@"Palatino" size:20];
                    dmgLabel.textColor = [UIColor redColor];
                    dmgLabel.center = CGPointMake(targetView.center.x, targetView.center.y+50);
                    dmgLabel.text = @"Miss";
                    dmgLabel.textAlignment = NSTextAlignmentCenter;
                    [UIView animateWithDuration:2 animations:^{
                        dmgLabel.center = CGPointMake(targetView.center.x, targetView.center.y-100);
                    } completion:^(BOOL finished) {
                        [dmgLabel removeFromSuperview];
                    }];
                }else{
                    NSNumber * baseValue;
                    float powerValue = 0;
                    if (targetView == self.enemyImageView) {
                        baseValue = [self.save.characterAttributes valueForKey:base];
                        powerValue = power.integerValue * (1+baseValue.integerValue/100.0);
                        [self enemyShake];
                    }else{
                        float coe = self.isBoss ? 1 :0.6;
                        powerValue = power.integerValue * (coe+self.enemyLevel/10);
                        [self selfShake];
                    }
                    
                  
                    int overpower = 1;
                    if (self.effectIndex == 3) {
                        overpower = 2;
                    }
                    NSInteger damage = powerValue*0.3*overpower;
                    if ([targetBuffListArray containsObject:@1]) {
                       damage= damage*0.5;
                        [targetBuffListArray removeObject:@1];
                    }
                    
                    if ([targetBuffListArray containsObject:@4]) {
                        damage = 0;
                        [targetBuffListArray removeObject:@4];
                    }
                    if ([bufflistArray containsObject:@5]) {
                        damage = damage*2;
                        [bufflistArray removeObject:@5];
                    }
                    
                    UILabel * dmgLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 50)];
                    [self.view addSubview:dmgLabel];
                    dmgLabel.font = [UIFont fontWithName:@"Palatino" size:20];
                    dmgLabel.textColor = [UIColor redColor];
                    dmgLabel.center = CGPointMake(targetView.center.x, targetView.center.y+50);
                    dmgLabel.text = [NSString stringWithFormat:@"%@: -%ld",dict[@"name"],damage];
                    dmgLabel.textAlignment = NSTextAlignmentCenter;
                    [UIView animateWithDuration:2 animations:^{
                        dmgLabel.center = CGPointMake(targetView.center.x, targetView.center.y-100);
                    } completion:^(BOOL finished) {
                        [dmgLabel removeFromSuperview];
                    }];
                    
                    if (targetView == self.enemyImageView) {
                        self.enemyHp -= damage;
                        self.enemyHpLabel.text = [NSString stringWithFormat:@"%ld/%ld",self.enemyHp,self.enemyMaxHp];
                        self.enemyHpConstraint.constant = 200 * (self.enemyHp*1.0001/self.enemyMaxHp);
                        if (self.enemyHpConstraint.constant<=0) {
                            NSLog(@"enemyDead");
                            
                            NSInteger random = arc4random()%100;
                            if (random<50) {
                                [[NSNotificationCenter defaultCenter] postNotificationName:@"NewItem" object:nil];
                            }else if (random<100){
                                [[NSNotificationCenter defaultCenter] postNotificationName:@"NewSkill" object:nil];
                            }
                            [UIView animateWithDuration:1.0 animations:^{
                                self.view.alpha = 0;
                            } completion:^(BOOL finished) {
                                [self.view removeFromSuperview];
                                [self removeFromParentViewController];
                            }];
                        }
                    }else{
                        
                        
                        self.save.characterAttributes.HP = @(self.save.characterAttributes.HP.integerValue-damage);
                                              
                        self.characterHpConstraint.constant = 200*(self.save.characterAttributes.HP.floatValue/self.save.characterAttributes.MaxHp.floatValue);
                        self.selfHpLabel.text = [NSString stringWithFormat:@"%@/%@",self.save.characterAttributes.HP,self.save.characterAttributes.MaxHp];
                        if (self.save.characterAttributes.HP.integerValue<=0) {
                            NSLog(@"selfDead");
                        }
                        
                        
                        
                    }
                    
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
                dmgLabel.center = CGPointMake(selfImageView.center.x, selfImageView.center.y+50);
                dmgLabel.text = BuffDes;
                dmgLabel.textAlignment = NSTextAlignmentCenter;
                [UIView animateWithDuration:2 animations:^{
                    dmgLabel.center = CGPointMake(selfImageView.center.x, selfImageView.center.y-100);
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
                dmgLabel.center = CGPointMake(selfImageView.center.x, selfImageView.center.y+50);
                dmgLabel.text = BuffDes;
                dmgLabel.textAlignment = NSTextAlignmentCenter;
                [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                    dmgLabel.center = CGPointMake(selfImageView.center.x, selfImageView.center.y-100);
                    
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
                dmgLabel.center = CGPointMake(selfImageView.center.x, selfImageView.center.y+50);
                dmgLabel.text = BuffDes;
                dmgLabel.textAlignment = NSTextAlignmentCenter;
                [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                    dmgLabel.center = CGPointMake(selfImageView.center.x, selfImageView.center.y-100);
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
                dmgLabel.center = CGPointMake(selfImageView.center.x, selfImageView.center.y+50);
                dmgLabel.text = BuffDes;
                dmgLabel.textAlignment = NSTextAlignmentCenter;
                [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                    dmgLabel.center = CGPointMake(selfImageView.center.x, selfImageView.center.y-100);
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
                dmgLabel.textColor = [UIColor greenColor];
                dmgLabel.center = CGPointMake(selfImageView.center.x, selfImageView.center.y+50);
                float  value = self.save.characterAttributes.MaxHp.intValue*0.3;
                dmgLabel.text = [BuffDes stringByAppendingFormat:@"%.0f",value];
                dmgLabel.textAlignment = NSTextAlignmentCenter;
                if (targetView == self.enemyImageView) {
                    self.characterHpConstraint.constant += 200*0.3;
                    if (self.characterHpConstraint.constant>200) {
                        self.characterHpConstraint.constant = 200;
                    }
                }else{
                    self.enemyHpConstraint.constant += 200*0.3;
                    if (self.enemyHpConstraint.constant>200) {
                        self.enemyHpConstraint.constant = 200;
                    }
                    
                }
                [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                    dmgLabel.center = CGPointMake(selfImageView.center.x, selfImageView.center.y-100);
                } completion:^(BOOL finished) {
                    [dmgLabel removeFromSuperview];
                }];
            }
                break;
            case 6:
            {

                [self.buffListArray addObject:@6];

                NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"BuffList"ofType:@"plist"];
                NSArray * BuffArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
                NSString * BuffDes = BuffArray[5];
                UILabel * dmgLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 50)];
                [self.view addSubview:dmgLabel];
                dmgLabel.font = [UIFont fontWithName:@"Palatino" size:20];
                dmgLabel.textColor = [UIColor yellowColor];
                dmgLabel.center = CGPointMake(selfImageView.center.x, selfImageView.center.y+50);
                dmgLabel.text = BuffDes;
                dmgLabel.textAlignment = NSTextAlignmentCenter;
                [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                    dmgLabel.center = CGPointMake(selfImageView.center.x, selfImageView.center.y-100);
                    
                } completion:^(BOOL finished) {
                    [dmgLabel removeFromSuperview];
                    
                }];
            }
                break;
            case 7:
            {
                [self.buffListArray addObject:@7];

                NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"BuffList"ofType:@"plist"];
                NSArray * BuffArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
                NSString * BuffDes = BuffArray[5];
                UILabel * dmgLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 50)];
                [self.view addSubview:dmgLabel];
                dmgLabel.font = [UIFont fontWithName:@"Palatino" size:20];
                dmgLabel.textColor = [UIColor yellowColor];
                dmgLabel.center = CGPointMake(selfImageView.center.x, selfImageView.center.y+50);
                dmgLabel.text = BuffDes;
                dmgLabel.textAlignment = NSTextAlignmentCenter;
                [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                    dmgLabel.center = CGPointMake(selfImageView.center.x, selfImageView.center.y-100);
                    
                } completion:^(BOOL finished) {
                    [dmgLabel removeFromSuperview];
                    
                }];
            }
                break;
            default:
            {
                
                NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"BuffList"ofType:@"plist"];
                NSArray * BuffArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
                NSString * BuffDes = BuffArray[7];
                UILabel * dmgLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 50)];
                [self.view addSubview:dmgLabel];
                dmgLabel.font = [UIFont fontWithName:@"Palatino" size:20];
                dmgLabel.textColor = [UIColor yellowColor];
                dmgLabel.center = CGPointMake(selfImageView.center.x, selfImageView.center.y+50);
                dmgLabel.text = BuffDes;
                dmgLabel.textAlignment = NSTextAlignmentCenter;
                [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                    dmgLabel.center = CGPointMake(selfImageView.center.x, selfImageView.center.y-100);
                    
                } completion:^(BOOL finished) {
                    [dmgLabel removeFromSuperview];
                    
                }];
                
            }
                break;;
        }
    }
    
    
    
    
}

- (void)enemyAction{
    if (!self.isBoss) {
        NSArray * skillOrderArray = @[@0,@0,@0, @2,@4, @12, @24, @20];
        NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"SkillList"ofType:@"plist"];
        NSArray * skillArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
        int  random = arc4random()%skillOrderArray.count;
        NSNumber * order = skillOrderArray[random];
        NSDictionary * skilldict = skillArray[order.integerValue];
        [self castSkill:skilldict targetImageView:self.selfImageView];
    }else{
        NSInteger random = arc4random()%38;
        
        NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"SkillList"ofType:@"plist"];
        NSArray * skillArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
        NSDictionary * skilldict = skillArray[random];
        [self castSkill:skilldict targetImageView:self.selfImageView];
        
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
