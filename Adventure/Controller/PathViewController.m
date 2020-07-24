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
#import "TreasureViewController.h"
#import "EventViewController.h"
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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refresh) name:@"actionDone" object:nil];
    // Do any additional setup after loading the view from its nib.
}
- (void)refresh{
    NSLog(@"%@",self.save.characterAttributes.MaxHp);

    
    
    
}

- (void)viewDidAppear:(BOOL)animated{
    
    NSLog(@"%@",self.save.characterAttributes.MaxHp);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self setUpRooms];

    });
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
        [self.view addSubview:roomView];

        [roomView setRoomWithEventIndex:randomEvent EnvirIndex:randomEffect];
        [self.currentRoomArray addObject:roomView];
        UIButton * locationButton = self.currentSelectionView[i];
        roomView.frame = locationButton.frame;
        roomView.clickButton.tag = i;
    
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
                [self.view addSubview:roomView];

                [roomView setRoomWithEventIndex:randomEvent EnvirIndex:randomEffect];
                [self.nextRoomArrray addObject:roomView];
                UIButton * locationButton = self.nextSelectionView[i];
                roomView.frame = locationButton.frame;
            }

}
- (void)clickBtn:(UIButton*)sender{
    

    RoomView * roomView = self.currentRoomArray[sender.tag];
    [self ChangeViewWithIndex:roomView.eventIndex];
    

}

- (void)ChangeViewWithIndex:(NSInteger)index{
    
    switch (index) {
        case 0:
            {
                BattleViewController * bvc = [[BattleViewController alloc]initWithNibName:@"BattleViewController" bundle:nil];
                [self addChildViewController:bvc];
                bvc.save = self.save;
                bvc.view.frame = kScreeenBounds;
                bvc.view.alpha = 0;
                [self.view addSubview:bvc.view];
                [bvc didMoveToParentViewController:self];
                [UIView animateWithDuration:1.0 animations:^{
                    bvc.view.alpha = 1;
                }];
            }
            break;
        case 1:
        {
            TreasureViewController * bvc = [[TreasureViewController alloc]initWithNibName:@"TreasureViewController" bundle:nil];
            [self addChildViewController:bvc];
            bvc.save = self.save;
            bvc.view.frame = kScreeenBounds;
            bvc.view.alpha = 0;
            [self.view addSubview:bvc.view];
            [bvc didMoveToParentViewController:self];
            [UIView animateWithDuration:1.0 animations:^{
                bvc.view.alpha = 1;
            }];
            
        }
            break;
        case 2:
        {
            EventViewController * bvc = [[EventViewController alloc]initWithNibName:@"EventViewController" bundle:nil];
            [self addChildViewController:bvc];
            bvc.save = self.save;
            bvc.view.frame = kScreeenBounds;
            bvc.view.alpha = 0;
            [self.view addSubview:bvc.view];
            [bvc didMoveToParentViewController:self];
            [UIView animateWithDuration:1.0 animations:^{
                bvc.view.alpha = 1;
            }];
        }
            break;
        default:
            break;
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
