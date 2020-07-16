//
//  ProfessionSelectViewController.m
//  Adventure
//
//  Created by admin on 2020/7/14.
//  Copyright © 2020 adv. All rights reserved.
//

#import "ProfessionSelectViewController.h"
#import "ProfessionTableViewCell.h"
#import "DescriptionView.h"
@interface ProfessionSelectViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *characterImageView;
@property (weak, nonatomic) IBOutlet UITextView *characterDescriptionTextView;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *skillBtns;
@property (nonatomic,assign) NSInteger currentIndex;
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;
@property (nonatomic,strong) DescriptionView * descriptionView;
@end

@implementation ProfessionSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView registerNib:[UINib nibWithNibName:@"ProfessionTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    // Do any additional setup after loading the view from its nib.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 18;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40;
    
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ProfessionTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[ProfessionTableViewCell alloc]init];
    }
    NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"ProfessionList"ofType:@"plist"];
    NSArray * professionArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
    NSDictionary * professionDict = professionArray[indexPath.row];
    cell.nameLabel.text = professionDict[@"name"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.currentIndex = indexPath.row;
    NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"ProfessionList"ofType:@"plist"];

       NSArray * professionArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
       NSDictionary * professionDict = professionArray[indexPath.row];
    self.characterImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"character_%ld",indexPath.row]];
    NSString * text = professionDict[@"description"];
    text = [text stringByAppendingFormat:@"\n\nAbility:\n%@",professionDict[@"ability"]];
    self.characterDescriptionTextView.text = text;
    for (UIButton * btn in self.skillBtns) {
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"skill%ld",indexPath.row*3+btn.tag]] forState:UIControlStateNormal];
    }
}
- (IBAction)clickSkill:(UIButton *)sender {
    
     [DescriptionView ShowDescriptionWithType:1 index:self.currentIndex*3+sender.tag];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    for (UIView * view in kKeyWindow.subviews) {
        if ([view isKindOfClass:[DescriptionView class]]) {
            [view removeFromSuperview];
        }
    }
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
