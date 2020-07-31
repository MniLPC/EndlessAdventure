//
//  NewSkillViewController.m
//  Adventure
//
//  Created by admin on 2020/7/21.
//  Copyright © 2020 adv. All rights reserved.
//

#import "NewSkillViewController.h"

@interface NewSkillViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *selectedImageView;
@property (weak, nonatomic) IBOutlet UIImageView *newskillIcon;
@property (nonatomic,assign) NSInteger selectIndex;
@property (weak, nonatomic) IBOutlet UILabel *skillInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *cooldownlabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *skillBtns;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *skillNameLabels;
@end

@implementation NewSkillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.newskillIcon.image = [UIImage imageNamed:[NSString stringWithFormat:@"skill%ld",self.skillIndex]];
    
    NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"SkillList"ofType:@"plist"];

              NSArray * skillArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
    NSDictionary * skillDict = skillArray[self.skillIndex];
    NSString * name = skillDict[@"name"];
    NSString * description = skillDict[@"description"];
    
    self.skillInfoLabel.text = [NSString stringWithFormat:@"%@\n%@",name,description];
    
    self.cooldownlabel.text = [NSString stringWithFormat:@"Cooldown:%@",skillDict[@"cooldown"]];
    for (int i = 0; i<4; i++) {
        UIButton * btn = self.skillBtns[i];
        switch (i) {
            case 0:
            {   [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"skill%@",self.save.characterSkills.skill1]] forState:UIControlStateNormal];
                NSDictionary * skillDict = skillArray[self.save.characterSkills.skill1.integerValue];
                UILabel * nameLabel = self.skillNameLabels[i];
                nameLabel.text = skillDict[@"name"];
            }
                break;
                case 1:
            {   [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"skill%@",self.save.characterSkills.skill2]] forState:UIControlStateNormal];
                NSDictionary * skillDict = skillArray[self.save.characterSkills.skill2.integerValue];
                               UILabel * nameLabel = self.skillNameLabels[i];
                               nameLabel.text = skillDict[@"name"];
                
                
            }
                break;
                case 2:
            {  [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"skill%@",self.save.characterSkills.skill3]] forState:UIControlStateNormal];
                NSDictionary * skillDict = skillArray[self.save.characterSkills.skill3.integerValue];
                    UILabel * nameLabel = self.skillNameLabels[i];
                               nameLabel.text = skillDict[@"name"];
            }
                break;
            default:
            {
                NSDictionary * skillDict = skillArray[self.save.characterSkills.skill4.integerValue];
                                               UILabel * nameLabel = self.skillNameLabels[i];
                if (!
                    self.save.characterSkills.skill4) {
                    [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"bg_green"]] forState:UIControlStateNormal];
                    nameLabel.text = @"Empty";
                }else{
              

                               nameLabel.text = skillDict[@"name"];
                    [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"skill%@",self.save.characterSkills.skill4]] forState:UIControlStateNormal];
                                    }
            }
                break;
        }

    }
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)clickSkill:(UIButton *)sender {
    self.selectedImageView.center = CGPointMake(sender.center.x, self.selectedImageView.center.y);
    self.selectIndex = sender.tag;
}
- (IBAction)acceptClick:(UIButton*)sender {
    NSLog(@"%ld",self.selectIndex);
    
    switch (self.selectIndex) {
        case 0:
            self.save.characterSkills.skill1 = [NSNumber numberWithInteger:self.skillIndex];
            self.save.characterSkills.skillCoolDown1 = @0;
            break;
            case 1:
                self.save.characterSkills.skill2 = [NSNumber numberWithInteger:self.skillIndex];
            self.save.characterSkills.skillCoolDown2 = @0;

                break;
            case 2:
                self.save.characterSkills.skill3 = [NSNumber numberWithInteger:self.skillIndex];
            self.save.characterSkills.skillCoolDown3 = @0;

                break;
        default:
            self.save.characterSkills.skill4 = [NSNumber numberWithInteger:self.skillIndex];
            self.save.characterSkills.skillCoolDown4 = @0;

            break;
    }
    NSLog(@"%@",self.save);
    [self viewReturn];
}
- (IBAction)leaveClick:(id)sender {
    [self viewReturn];

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
