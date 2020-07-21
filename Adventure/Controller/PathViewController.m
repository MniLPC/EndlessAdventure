//
//  PathViewController.m
//  Adventure
//
//  Created by admin on 2020/7/16.
//  Copyright © 2020 adv. All rights reserved.
//

#import "PathViewController.h"
#import "RoomView.h"
#import "BattleViewController.h"
#import "CharacterSave.h"
@interface PathViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *currentSelectionView;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *nextSelectionView;
@property (nonatomic,strong) NSMutableArray * currentRoomArray;
@property (nonatomic,strong) NSMutableArray * nextRoomArrray;
@property (weak, nonatomic) IBOutlet UIImageView *heroImageView;
@property (nonatomic,strong) CharacterSave * save;
@end

@implementation PathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSInteger random = arc4random()%8 ;
    self.save = [CharacterSave newSaveWithIndex:random];
    self.heroImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"character_%ld",random]];
    // Do any additional setup after loading the view from its nib.
}


- (void)viewDidAppear:(BOOL)animated{
    [self setUpRooms];
}
- (void)setUpRooms{
    self.currentRoomArray = [NSMutableArray new];
    self.nextRoomArrray = [NSMutableArray new];
    for (int i = 0; i<2; i++) {
        RoomView * roomView = [[NSBundle mainBundle] loadNibNamed:@"RoomView" owner:nil options:nil].firstObject;
        
        int randomEvent = arc4random()%8;
        if (randomEvent<5) {
            randomEvent =0;
        }else{
            randomEvent = randomEvent-4;
        }
        NSLog(@"event:%d",randomEvent);
        int randomEffect = arc4random()%5;
        
        [roomView setRoomWithEventIndex:randomEvent EnvirIndex:randomEffect];
        [self.currentRoomArray addObject:roomView];
        UIButton * locationButton = self.currentSelectionView[i];
        roomView.frame = locationButton.frame;
        [self.view addSubview:roomView];
        roomView.tag = i;
        [roomView.clickButton addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    }

    for (int i = 0; i<4; i++) {
        RoomView * roomView = [[NSBundle mainBundle] loadNibNamed:@"RoomView" owner:nil options:nil].firstObject;
        int randomEvent = arc4random()%8;
        if (randomEvent<5) {
            randomEvent =0;
        }else{
            randomEvent = randomEvent-3;
        }
        int randomEffect = arc4random()%5;
        
        [roomView setRoomWithEventIndex:randomEvent EnvirIndex:randomEffect];
        [self.nextRoomArrray addObject:roomView];
        UIButton * locationButton = self.nextSelectionView[i];
        roomView.frame = locationButton.frame;
        [self.view addSubview:roomView];
    }
}
- (void)clickBtn:(UIButton*)sender{
    
    
    RoomView * roomView = self.currentRoomArray[sender.tag];
    
    BattleViewController * bvc = [[BattleViewController alloc]initWithNibName:@"BattleViewController" bundle:nil];
    bvc.save = self.save;
    [self.navigationController pushViewController:bvc animated:YES];
    
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
