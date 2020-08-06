//
//  MainTitleViewController.m
//  Adventure
//
//  Created by admin on 2020/7/15.
//  Copyright © 2020 adv. All rights reserved.
//

#import "MainTitleViewController.h"
#import "CharacterCollectionViewCell.h"
#import "ProfessionSelectViewController.h"
#import "PathViewController.h"
@interface MainTitleViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray * dataSource;
@property (weak, nonatomic) IBOutlet UILabel *SoulShardLabel;
@end

@implementation MainTitleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerNib:[UINib nibWithNibName:@"CharacterCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    NSArray * saveArray = [UserDefaults unArchiveArrayForKey:@"save"] ;

    NSNumber * SoulShard = [kUserDefaults objectForKey:@"SoulShard"];
    if (!SoulShard) {
        SoulShard = @0;
    }
    self.SoulShardLabel.text = [NSString stringWithFormat:@"%@",SoulShard];
    self.dataSource = [NSMutableArray arrayWithArray:saveArray];
    // Do any additional setup after loading the view from its nib.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count+1;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CharacterCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (indexPath.row<self.dataSource.count) {
        [cell setCellWithSave:self.dataSource[indexPath.row]];
    }
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == self.dataSource.count) {
        ProfessionSelectViewController * psvc = [[ProfessionSelectViewController alloc]initWithNibName:@"ProfessionSelectViewController" bundle:nil];
        [self.navigationController pushViewController:psvc animated:YES];
    }else{
        
        PathViewController * pathVC = [[PathViewController alloc]initWithNibName:@"PathViewController" bundle:nil];
        pathVC.save = self.dataSource[indexPath.row];
        pathVC.saveIndex = indexPath.row;
        [self.navigationController pushViewController:pathVC animated:nil];
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
