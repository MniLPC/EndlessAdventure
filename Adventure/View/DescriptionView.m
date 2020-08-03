//
//  DescriptionView.m
//  Adventure
//
//  Created by admin on 2020/7/9.
//  Copyright © 2020 adv. All rights reserved.
//

#import "DescriptionView.h"

@implementation DescriptionView
+ (void)ShowDescriptionWithType:(NSInteger)type index:(NSInteger)index{
    
    DescriptionView * desView = [[NSBundle mainBundle] loadNibNamed:@"DescriptionView" owner:nil options:nil].firstObject;
    if (type==1) {
        NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"SkillList"ofType:@"plist"];

            NSArray * professionArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
            NSDictionary * professionDict = professionArray[index];
        
        desView.nameLabel.text = professionDict[@"name"];
        desView.descriptionLabel.text = professionDict[@"description"];
        NSString * cdSTR = professionDict[@"cooldown"];
        desView.descriptionLabel.text =  [desView.descriptionLabel.text stringByAppendingFormat:@"\nCoolDown:%@",cdSTR];
        
    }else if(type == 0){
        NSArray * names =  @[@"Normal",@"Bless",@"Burn",@"Overpower",@"Narrow",@"Sandstorm"];
        NSArray * desArray = @[@"An ordinary room.",@"Everyone heal HP after ending turn.",@"Everyone lose HP after ending turn.",@"All damage will be doubled.",@"No miss and avoid.(Everyone)",@"Low Accuracy.(Everyone) You can run away more earlier."];
        desView.nameLabel.text = names[index];
        desView.descriptionLabel.text = desArray[index];        
    }
    desView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    desView.center = kKeyWindow.center;
    [kKeyWindow addSubview:desView];
    
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self removeFromSuperview];
    
}
- (IBAction)closeClick:(id)sender {
    [self removeFromSuperview];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
