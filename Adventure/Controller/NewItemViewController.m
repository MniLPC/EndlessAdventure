//
//  NewItemViewController.m
//  Adventure
//
//  Created by admin on 2020/7/21.
//  Copyright © 2020 adv. All rights reserved.
//

#import "NewItemViewController.h"

@interface NewItemViewController (){
    ItemAttributes * newItem;
}
@property (weak, nonatomic) IBOutlet UIImageView *selfItemImageView;
@property (weak, nonatomic) IBOutlet UIImageView *NewItemImageView;
@property (nonatomic,assign) NSInteger Part;
@property (weak, nonatomic) IBOutlet UILabel *selfItemDesLabel;
@property (weak, nonatomic) IBOutlet UILabel *NewItemDesLabel;
@end

@implementation NewItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
}
- (void)viewWillAppear:(BOOL)animated{
    [self setUpUI];
    
    
}
- (void)setUpUI{
    
    self.Part = arc4random()%3;
    self.Part = 1;
    CharacterItems * items = self.save.characterItems;
    NSString * str = @"";
    newItem = [ItemAttributes new];
    NSInteger mainAtt = arc4random()%4;
    
    switch (self.Part) {
        case 0:
        {
            self.selfItemImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",items.Weapon.Image]];
            if (items.Weapon.STR.intValue) {
                
                str = [str stringByAppendingFormat:@"STR+%@",items.Weapon.STR];
            }
            if (items.Weapon.DEX.intValue) {
                str = [str stringByAppendingFormat:@"\nDEX+%@",items.Weapon.DEX];
            }
            if (items.Weapon.INT.intValue) {
                str =[str stringByAppendingFormat:@"\nINT+%@",items.Weapon.INT];
            }
            if (items.Weapon.PIE.intValue) {
                str = [str stringByAppendingFormat:@"\nPIE+%@",items.Weapon.PIE];
            }
            if (items.Weapon.Rest.intValue) {
                str = [str stringByAppendingFormat:@"\nRest+%@",items.Weapon.Rest];
            }
            if (items.Weapon.MaxHp.intValue) {
                str = [str stringByAppendingFormat:@"\nMaxHp+%@",items.Weapon.MaxHp];
            }
            if (items.Weapon.Avoid.intValue) {
                str = [str stringByAppendingFormat:@"\nAvoid+%@",items.Weapon.Avoid];
            }
            if (items.Weapon.Critical.intValue) {
                str = [str stringByAppendingFormat:@"\nCritical+%@",items.Weapon.Critical];
            }
            
            if (self.NewItem) {
                newItem = self.NewItem;
            }else{
                NSInteger mainValue = 10+arc4random()%20+self.save.characterAttributes.Level.integerValue*10;
                NSInteger subValue = arc4random()%20+self.save.characterAttributes.Level.integerValue*10;
                NSInteger specAtt = arc4random()%3;
                NSInteger specValue = arc4random()%15+self.save.characterAttributes.Level.integerValue*5;
                
                switch (specAtt) {
                    case 0:
                    {
                        newItem.Avoid = @(specValue);
                    }
                        break;
                    case 1:
                    {
                        newItem.Critical = @(specValue);
                        
                    }
                        break;
                    case 2:
                    {
                        newItem.Rest = @(specValue);
                        
                    }
                        break;
                    default:
                        
                        break;
                }
                switch (mainAtt) {
                    case 0:
                    {
                        newItem.STR = @(mainValue);
                    }
                        break;
                    case 1:
                    {
                        newItem.DEX = @(mainValue);
                    }
                        break;
                    case 2:
                    {
                        newItem.INT = @(mainValue);
                    }
                        break;
                    default:
                    {
                        newItem.PIE = @(mainValue);
                    }
                        break;
                }
                NSInteger subAtt = arc4random()%4;
                switch (subAtt) {
                    case 0:
                    {
                        newItem.STR = @(subValue+newItem.STR.integerValue);
                    }
                        break;
                    case 1:
                    {
                        newItem.DEX = @(subValue+newItem.DEX.integerValue);
                    }
                        break;
                    case 2:
                    {
                        newItem.INT = @(subValue+newItem.INT.integerValue);
                    }
                        break;
                    default:
                    {
                        newItem.PIE = @(subValue+newItem.PIE.integerValue);
                    }
                        break;
                }
            }
        }
            break;
        case 1:
        {
            self.selfItemImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",items.Armor.Image]];
            if (items.Armor.STR.intValue) {
                str= [str stringByAppendingFormat:@"STR+%@",items.Armor.STR];
            }
            
            if (items.Armor.DEX.intValue) {
                str= [str stringByAppendingFormat:@"\nDEX+%@",items.Armor.DEX];
            }
            if (items.Armor.INT.intValue) {
                str = [str stringByAppendingFormat:@"\nINT+%@",items.Armor.INT];
            }
            if (items.Armor.PIE.intValue) {
                str=[str stringByAppendingFormat:@"\nPIE+%@",items.Armor.PIE];
            }
            if (items.Armor.Rest.intValue) {
                str = [str stringByAppendingFormat:@"\nRest+%@",items.Armor.Rest];
            }
            if (items.Armor.MaxHp.intValue) {
                str=[str stringByAppendingFormat:@"\nMaxHp+%@",items.Armor.MaxHp];
            }
            if (items.Armor.Avoid.intValue) {
                str= [str stringByAppendingFormat:@"\nAvoid+%@",items.Armor.Avoid];
            }
            if (items.Armor.Critical.intValue) {
                str = [str stringByAppendingFormat:@"\nCritical+%@",items.Armor.Critical];
            }
            
            
            if (self.NewItem) {
                newItem = self.NewItem;
            }else{
                NSInteger mainValue = 10+arc4random()%20+self.save.characterAttributes.Level.integerValue*10;
                NSInteger subValue = arc4random()%20+self.save.characterAttributes.Level.integerValue*10;
                NSInteger mainAtt = arc4random()%4;
                NSInteger specAtt = arc4random()%3;
                NSInteger specValue = arc4random()%15+self.save.characterAttributes.Level.integerValue*5;
                
                switch (specAtt) {
                    case 0:
                    {
                        newItem.MaxHp = @(specValue);
                    }
                        break;
                    case 1:
                    {
                        newItem.Shield = @(specValue);
                        
                    }
                        break;
                    case 2:
                    {
                        newItem.Rest = @(specValue);
                        
                    }
                        break;
                    default:
                        
                        break;
                }
                switch (mainAtt) {
                    case 0:
                    {
                        newItem.STR = @(mainValue);
                    }
                        break;
                    case 1:
                    {
                        newItem.DEX = @(mainValue);
                    }
                        break;
                    case 2:
                    {
                        newItem.INT = @(mainValue);
                    }
                        break;
                    default:
                    {
                        newItem.PIE = @(mainValue);
                    }
                        break;
                }
                NSInteger subAtt = arc4random()%4;
                switch (subAtt) {
                    case 0:
                    {
                        newItem.STR = @(subValue+newItem.STR.integerValue);
                    }
                        break;
                    case 1:
                    {
                        newItem.DEX = @(subValue+newItem.DEX.integerValue);
                    }
                        break;
                    case 2:
                    {
                        newItem.INT = @(subValue+newItem.INT.integerValue);
                    }
                        break;
                    default:
                    {
                        newItem.PIE = @(subValue+newItem.PIE.integerValue);
                    }
                        break;
                }
            }
        }
            break;
        default:
        {
            self.selfItemImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",items.Jewelry.Image]];
            if (items.Jewelry.STR.intValue) {
                str= [str stringByAppendingFormat:@"STR+%@",items.Jewelry.STR];
            }
            if (items.Jewelry.DEX.intValue) {
                str= [str stringByAppendingFormat:@"\nDEX+%@",items.Jewelry.DEX];
            }
            if (items.Jewelry.INT.intValue) {
                str= [str stringByAppendingFormat:@"\nINT+%@",items.Jewelry.INT];
            }
            if (items.Jewelry.PIE.intValue) {
                str= [str stringByAppendingFormat:@"\nPIE+%@",items.Jewelry.PIE];
            }
            if (items.Jewelry.Rest.intValue) {
                str = [str stringByAppendingFormat:@"\nRest+%@",items.Jewelry.Rest];
            }
            if (items.Jewelry.MaxHp.intValue) {
                str= [str stringByAppendingFormat:@"\nMaxHp+%@",items.Jewelry.MaxHp];
            }
            if (items.Jewelry.Avoid.intValue) {
                str = [str stringByAppendingFormat:@"\nAvoid+%@",items.Jewelry.Avoid];
            }
            if (items.Jewelry.Critical.intValue) {
                str= [str stringByAppendingFormat:@"\nCritical+%@",items.Jewelry.Critical];
            }
            
            if (self.NewItem) {
                newItem = self.NewItem;
            }else{
                
                NSInteger mainValue = 10+arc4random()%20+self.save.characterAttributes.Level.integerValue*10;
                NSInteger subValue = arc4random()%20+self.save.characterAttributes.Level.integerValue*10;
                NSInteger mainAtt = arc4random()%4;
                NSInteger specAtt = arc4random()%3;
                NSInteger specValue = arc4random()%15+self.save.characterAttributes.Level.integerValue*5;
                
                switch (specAtt) {
                    case 0:
                    {
                        newItem.MaxHp = @(specValue);
                    }
                        break;
                    case 1:
                    {
                        newItem.Avoid = @(specValue);
                        
                    }
                        break;
                    case 2:
                    {
                        newItem.Critical = @(specValue);
                        
                    }
                        break;
                    default:
                        
                        break;
                }
                switch (mainAtt) {
                    case 0:
                    {
                        newItem.STR = @(mainValue);
                    }
                        break;
                    case 1:
                    {
                        newItem.DEX = @(mainValue);
                    }
                        break;
                    case 2:
                    {
                        newItem.INT = @(mainValue);
                    }
                        break;
                    default:
                    {
                        newItem.PIE = @(mainValue);
                    }
                        break;
                }
                NSInteger subAtt = arc4random()%4;
                switch (subAtt) {
                    case 0:
                    {
                        newItem.STR = @(subValue+newItem.STR.integerValue);
                    }
                        break;
                    case 1:
                    {
                        newItem.DEX = @(subValue+newItem.DEX.integerValue);
                    }
                        break;
                    case 2:
                    {
                        newItem.INT = @(subValue+newItem.INT.integerValue);
                    }
                        break;
                    default:
                    {
                        newItem.PIE = @(subValue+newItem.PIE.integerValue);
                    }
                        break;
                }
            }
        }
            break;
    }

    self.selfItemDesLabel.text = str;
    NSString * newStr = @"";
//    self.NewItemImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",items.Weapon.Image]];
    if (newItem.STR.intValue) {
        newStr =[newStr stringByAppendingFormat:@"STR+%@",newItem.STR];
    }
    if (newItem.DEX.intValue) {
        newStr =[newStr stringByAppendingFormat:@"\nDEX+%@",newItem.DEX];
    }
    if (newItem.INT.intValue) {
        newStr =[newStr stringByAppendingFormat:@"\nINT+%@",newItem.INT];
    }
    if (newItem.PIE.intValue) {
        newStr =[newStr stringByAppendingFormat:@"\nPIE+%@",newItem.PIE];
    }
    if (newItem.MaxHp.intValue) {
        newStr =[newStr stringByAppendingFormat:@"\nMaxHp+%@",newItem.MaxHp];
    }
    if (newItem.Avoid.intValue) {
        newStr =[newStr stringByAppendingFormat:@"\nAvoid+%@",newItem.Avoid];
    }
    if (newItem.Critical.intValue) {
        newStr =[newStr stringByAppendingFormat:@"\nCritical+%@",newItem.Critical];
    }
    if (newItem.Rest.intValue) {
        newStr =[newStr stringByAppendingFormat:@"\nRest+%@",newItem.Rest];
    }
    if (self.Part == 2 && !items.Jewelry) {
        self.selfItemImageView.image = [UIImage imageNamed:@"bg_red"];
        self.selfItemDesLabel.text = @"Empty";
    }
    
    self.NewItemDesLabel.text = newStr;
    if (!self.NewItem) {
            NSArray * typeArray = @[@"Weapon",@"Armor",@"Jewelry0"];
        NSArray * attArray = @[@"STR",@"DEX",@"INT",@"PIE"];
        NSInteger randomNum = arc4random()%10;
        if (self.Part<2) {
            NSString * imageSTR = [NSString stringWithFormat:@"%@_%@%ld",typeArray[self.Part],attArray[mainAtt],randomNum];
            newItem.Image = imageSTR;
            NSLog(@"imageName:%@",imageSTR);
            self.NewItemImageView.image = [UIImage imageNamed:imageSTR];
        }else{
            NSString * imageSTR = [NSString stringWithFormat:@"%@%ld",typeArray[2],randomNum];
            newItem.Image = imageSTR;
            self.NewItemImageView.image = [UIImage imageNamed:imageSTR];
        }
        newItem.Type = @(self.Part);
    }else{
        self.NewItemImageView.image = [UIImage imageNamed:self.NewItem.Image];
    }

    self.NewItem = newItem;
}
- (IBAction)acceptClick:(id)sender {
    
    
    switch (self.Part) {
        case 0:
        {
            self.save.characterItems.Weapon = newItem;
        }
            break;
        case 1:
        {
            self.save.characterItems.Armor = newItem;
        }
            break;
        case 2:
        {
            self.save.characterItems.Jewelry = newItem;
        }
            break;
        default:
            break;
    }
    
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
