//
//  TreasureViewController.m
//  Adventure
//
//  Created by admin on 2020/7/21.
//  Copyright © 2020 adv. All rights reserved.
//

#import "TreasureViewController.h"

@interface TreasureViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *treasureImageView;

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
