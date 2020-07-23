//
//  EventViewController.m
//  Adventure
//
//  Created by admin on 2020/7/22.
//  Copyright © 2020 adv. All rights reserved.
//

#import "EventViewController.h"
#import "ToastView.h"
#define EventText @[@"You found a strange fruit, you can feel it contains some kind of magic power.",@"You found a strange tombstone. It appears that something will happen by moving it.",@"You found a mysterious idol and you can feel some mysterious power."]
@interface EventViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;

@end

@implementation EventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.eventIndex = arc4random()%3;
    
    self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"event%ld",self.eventIndex]];
    self.textLabel.text = EventText[self.eventIndex];
    
    switch (self.eventIndex) {
        case 0:
            [self.confirmBtn setTitle:@"Eat" forState:UIControlStateNormal];
            break;
        case 1:
            [self.confirmBtn setTitle:@"Move" forState:UIControlStateNormal];

            break;
        default:
             [self.confirmBtn setTitle:@"Pray" forState:UIControlStateNormal];
            break;
    }
    
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)confirmClick:(id)sender {
    NSInteger index = arc4random()%5;
    
    switch (index) {
        case 0:
                [ToastView showToastWithText:@"You are poisoned."];
            break;
        case 1:
        {
                [ToastView showToastWithText:@"You feel full of power. Hp is restored."];
        }
            break;
        case 2:
        {
                [ToastView showToastWithText:@"You feel full of power and all attributes are improved."];
            
        }
            break;
        case 3:
        {
                 [ToastView showToastWithText:@"You're cursed. Max HP -5."];
        }
            break;
        default:
        {
              [ToastView showToastWithText:@"Nothing happened."];
        }
            break;
    }
    

    
}

- (void)randomEvent{
    
    
    
    
}

- (IBAction)cancelClick:(id)sender {
    
    [self.view removeFromSuperview];
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
