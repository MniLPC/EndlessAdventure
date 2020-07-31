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
#import "NewItemViewController.h"
#import "NewSkillViewController.h"
@interface PathViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *currentSelectionView;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *nextSelectionView;
@property (nonatomic,strong) NSMutableArray * currentRoomArray;
@property (nonatomic,strong) NSMutableArray * nextRoomArrray;
@property (weak, nonatomic) IBOutlet UIImageView *heroImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *hpLabel;
@property (nonatomic,strong) CharacterSave * save;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *hpWidthConstraint;
@property (weak, nonatomic) IBOutlet UILabel *LevelLabel;

@end

@implementation PathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSInteger random = arc4random()%8 ;
    self.save = [CharacterSave newSaveWithIndex:random];
    self.heroImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"character_%ld",random]];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refresh) name:@"actionDone" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(NewItem:) name:@"NewItem" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(NewSkill) name:@"NewSkill" object:nil];
    
    
    NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"ProfessionList"ofType:@"plist"];
    
    NSArray * professionArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
    NSDictionary * professionDict = professionArray[self.save.characterIndex.integerValue];
    self.nameLabel.text = professionDict[@"name"];
    [self refresh];
    
    // Do any additional setup after loading the view from its nib.
}
-(void)NewItem:(NSNotification*)noti{
    NewItemViewController * bvc ;
    if (noti.userInfo) {
        bvc  = noti.userInfo[@"item"];
    }else{
   bvc = [[NewItemViewController alloc]initWithNibName:@"NewItemViewController" bundle:nil];

    }
    
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
-(void)NewSkill{
    NewSkillViewController * bvc = [[NewSkillViewController alloc]initWithNibName:@"NewSkillViewController" bundle:nil];
    [self addChildViewController:bvc];
    bvc.save = self.save;
    bvc.skillIndex = arc4random()%39;
    bvc.view.frame = kScreeenBounds;
    bvc.view.alpha = 0;
    [self.view addSubview:bvc.view];
    [bvc didMoveToParentViewController:self];
    [UIView animateWithDuration:1.0 animations:^{
        bvc.view.alpha = 1;
    }];
}
- (void)refresh{
    self.hpLabel.text = [NSString stringWithFormat:@"%ld/%ld",self.save.characterAttributes.HP.integerValue,self.save.characterAttributes.MaxHp.integerValue];
    self.LevelLabel.text = [NSString stringWithFormat:@"Lv%@",self.save.characterAttributes.Level];
    
    
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
- (void)NextRoom:(NSInteger)index{
    
    RoomView * roomLeft = self.currentRoomArray[0];
    RoomView * roomRight = self.currentRoomArray[1];
    
    if (!index) {
        RoomView * nextRoom1 = self.nextRoomArrray[0];
        RoomView * nextRoom2 = self.nextRoomArrray[1];
        [roomLeft setRoomWithEventIndex:nextRoom1.eventIndex EnvirIndex:nextRoom1.effectIndex];
        [roomRight setRoomWithEventIndex:nextRoom2.eventIndex EnvirIndex:nextRoom2.effectIndex];
    }else{
        RoomView * nextRoom1 = self.nextRoomArrray[2];
        RoomView * nextRoom2 = self.nextRoomArrray[3];
        [roomLeft setRoomWithEventIndex:nextRoom1.eventIndex EnvirIndex:nextRoom1.effectIndex];
        [roomRight setRoomWithEventIndex:nextRoom2.eventIndex EnvirIndex:nextRoom2.effectIndex];
    }
    
    
    for (RoomView * roomView in self.nextRoomArrray) {
        int randomEvent = arc4random()%8;
        if (randomEvent<5) {
            randomEvent =0;
        }else{
            randomEvent = randomEvent-3;
        }
        int randomEffect = arc4random()%5;
        [roomView setRoomWithEventIndex:randomEvent EnvirIndex:randomEffect];
    }
    
}
- (void)clickBtn:(UIButton*)sender{
    
    RoomView * roomView = self.currentRoomArray[sender.tag];
    [self ChangeViewWithIndex:roomView.eventIndex];
    NSLog(@"eventIndex:%ld",roomView.eventIndex);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self NextRoom:sender.tag];
    });
    
    
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
        {
            [UIView animateWithDuration:1 animations:^{
                self.view.alpha = 0;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.5 animations:^{
                    self.view.alpha = 1;
                }];
            }];
            
        }
            break;
    }
}
- (IBAction)backClick:(id)sender {
    
    NewItemViewController * bvc = [[NewItemViewController alloc]initWithNibName:@"NewItemViewController" bundle:nil];
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
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
