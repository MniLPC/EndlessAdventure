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
#import "PathViewController.h"
@interface ProfessionSelectViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *characterImageView;
@property (weak, nonatomic) IBOutlet UITextView *characterDescriptionTextView;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *skillBtns;
@property (nonatomic,assign) NSInteger currentIndex;
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;
@property (weak, nonatomic) IBOutlet UILabel *SoulShardLabel;
@property (nonatomic,strong) DescriptionView * descriptionView;
@end

@implementation ProfessionSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView registerNib:[UINib nibWithNibName:@"ProfessionTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    NSNumber * SoulShard = [kUserDefaults objectForKey:@"SoulShard"];
    if (!SoulShard) {
        SoulShard = @0;
    }
    self.SoulShardLabel.text = [NSString stringWithFormat:@"%@",SoulShard];
    
    // Do any additional setup after loading the view from its nib.
}
- (void)viewDidAppear:(BOOL)animated{
    
    [self tableView:self.tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]]
    ;

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 18;
}
- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40;
    
}
- (IBAction)confirmClick:(id)sender {
    
      NSArray * unlockArray = [kUserDefaults objectForKey:@"UnlockCharacter"];
      unlockArray = @[@0,@1,@2,@3,@4];
    if ([unlockArray containsObject:[NSNumber numberWithInteger:self.currentIndex]]) {
        CharacterSave * save = [CharacterSave newSaveWithIndex:self.currentIndex];
        NSArray * saveArray = [UserDefaults unArchiveArrayForKey:@"save"] ;
        NSMutableArray * newSaveArray = [NSMutableArray new];
        [newSaveArray addObjectsFromArray:saveArray];
        [newSaveArray addObject:save];
        [UserDefaults setArchivedArray:newSaveArray forKey:@"save"];
        PathViewController * pvc = [[PathViewController alloc]initWithNibName:@"PathViewController" bundle:nil];
        pvc.save = save;
        [self.navigationController pushViewController:pvc animated:YES];
        
        
        
      }else if(self.currentIndex == 5||self.currentIndex == 6||self.currentIndex == 7){
        
      }else if(self.currentIndex == 8||self.currentIndex == 9||self.currentIndex == 10){
         
          return;
      }else{
         return;
      }
    
    
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
    NSArray * unlockArray = [kUserDefaults objectForKey:@"UnlockCharacter"];
    unlockArray = @[@0,@1,@2,@3,@4];
    if ([unlockArray containsObject:[NSNumber numberWithInteger:indexPath.row]]) {
            for (UIButton * btn in self.skillBtns) {
            [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"skill%ld",indexPath.row*3+btn.tag]] forState:UIControlStateNormal];
        }
        [self.confirmBtn setTitle:@"Start Adventure" forState:UIControlStateNormal];
        [self.confirmBtn setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];;

    }else if(indexPath.row == 5||indexPath.row == 6||indexPath.row == 7){
        for (UIButton * btn in self.skillBtns) {
                   [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@""]] forState:UIControlStateNormal];
               }
        [self.confirmBtn setTitle:@"-2000 Soul Shard unlock" forState:UIControlStateNormal];
        [self.confirmBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];;

    }else if(indexPath.row == 8||indexPath.row == 9||indexPath.row == 10){
              [self.confirmBtn setTitle:@"-5000 Soul Shard to unlock" forState:UIControlStateNormal];
        [self.confirmBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];;

    }else{
                     [self.confirmBtn setTitle:@"Unlock With Event" forState:UIControlStateNormal];
        [self.confirmBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];;

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
