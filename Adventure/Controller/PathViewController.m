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
#import "ToastView.h"
@interface PathViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *currentSelectionView;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *nextSelectionView;
@property (nonatomic,strong) NSMutableArray * currentRoomArray;
@property (nonatomic,strong) NSMutableArray * nextRoomArrray;
@property (weak, nonatomic) IBOutlet UIImageView *heroImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *hpLabel;
@property (weak, nonatomic) IBOutlet UIImageView *hpbar;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *hpWidthConstraint;
@property (weak, nonatomic) IBOutlet UILabel *LevelLabel;
@property (nonatomic,assign) NSInteger actionCount;
@property (nonatomic,assign) BOOL nextFloor;
@end

@implementation PathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.actionCount = 0;
    self.heroImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"character_%@",self.save.characterIndex]];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refresh) name:@"actionDone" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(NewItem:) name:@"NewItem" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(NewSkill) name:@"NewSkill" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refresh) name:@"refresh" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(NextFloor) name:@"NextFloor" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(treasure) name:@"treasure" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dead) name:@"dead" object:nil];

    NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"ProfessionList"ofType:@"plist"];
    
    NSArray * professionArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
    NSDictionary * professionDict = professionArray[self.save.characterIndex.integerValue];
    self.nameLabel.text = professionDict[@"name"];
    [self refresh];
    self.view.alpha = 0;
    [UIView animateWithDuration:1 animations:^{
        self.view.alpha =1;
    }];
    // Do any additional setup after loading the view from its nib.
}
- (void)NextFloor{
    self.nextFloor = YES;
}
- (void)treasure{
    
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
- (void)dead{
    
    
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
    NSArray * saveArray = [UserDefaults unArchiveArrayForKey:@"save"] ;
    NSMutableArray * newSaveArray = [NSMutableArray new];
    [newSaveArray addObjectsFromArray:saveArray];
    [newSaveArray replaceObjectAtIndex:self.saveIndex withObject:self.save];
    [UserDefaults setArchivedArray:newSaveArray forKey:@"save"];
    if (self.nextFloor) {
         self.save.floor = [NSNumber numberWithInteger:self.save.floor.integerValue+1];
           [UIView animateWithDuration:0.5 animations:^{
               self.view.alpha = 0;

           }completion:^(BOOL finished) {
               for (RoomView * roomview in self.currentRoomArray) {
                   [roomview removeFromSuperview];
               }
               for (RoomView * roomview in self.nextRoomArrray) {
                   [roomview removeFromSuperview];
               }
               [self setUpRooms];
               dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                   [ToastView showToastWithText:[NSString stringWithFormat:@"labyrinth Floor:%@",self.save.floor]];
                   [UIView animateWithDuration:0.5 animations:^{
                       self.view.alpha = 1;
                   }];
               });
           }];
        self.nextFloor = NO;
    }
    
    
    self.hpLabel.text = [NSString stringWithFormat:@"%ld/%ld",self.save.calCharacterAttributes.HP.integerValue,self.save.calCharacterAttributes.MaxHp.integerValue];
    self.hpWidthConstraint.constant = self.save.calCharacterAttributes.HP.floatValue/self.save.calCharacterAttributes.MaxHp.floatValue*200;
    if (self.save.PoisonedTurn) {
        self.hpbar.layer.borderColor = [UIColor greenColor].CGColor;
        self.hpbar.layer.borderWidth = 1;
    }else{
        self.hpbar.layer.borderWidth = 0;

    }
    self.LevelLabel.text = [NSString stringWithFormat:@"Lv%@",self.save.calCharacterAttributes.Level];
}

- (void)viewDidAppear:(BOOL)animated{
    
    NSLog(@"%@",self.save.calCharacterAttributes.MaxHp);
    
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
        int randomEffect = arc4random()%6;
        [self.view addSubview:roomView];
        randomEvent = 4;
        [roomView setRoomWithEventIndex:randomEvent EnvirIndex:randomEffect];
        [self.currentRoomArray addObject:roomView];
        UIButton * locationButton = self.currentSelectionView[i];
        roomView.frame = locationButton.frame;
        roomView.clickButton.tag = i;
        
        [roomView.clickButton addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    for (int i = 0; i<4; i++) {
        RoomView * roomView = [[NSBundle mainBundle] loadNibNamed:@"RoomView" owner:nil options:nil].firstObject;
        int randomEvent = arc4random()%7;
        if (randomEvent<5) {
            randomEvent =0;
        }else{
            randomEvent = randomEvent-3;
        }
        int randomEffect = arc4random()%6;
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
        int randomEvent = arc4random()%7;
        if (randomEvent<5) {
            randomEvent =0;
        }else{
            randomEvent = randomEvent-3;
        }
        NSLog(@"randomEvent:%d",randomEvent);
        int randomEffect = arc4random()%5;
        if (self.actionCount>5) {
            NSInteger random = arc4random()%2;
            if (random == 0) {
                randomEvent = 4;
            }
        }
        [roomView setRoomWithEventIndex:randomEvent EnvirIndex:randomEffect];
    }
    
}
- (void)clickBtn:(UIButton*)sender{
    
    RoomView * roomView = self.currentRoomArray[sender.tag];
    [self ChangeViewWithIndex:roomView];
    NSLog(@"eventIndex:%ld",roomView.eventIndex);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self NextRoom:sender.tag];
    });
    
    
}

- (void)ChangeViewWithIndex:(RoomView*)roomView{
    
    switch (roomView.eventIndex) {
        case 0:
        {
            BattleViewController * bvc = [[BattleViewController alloc]initWithNibName:@"BattleViewController" bundle:nil];
            bvc.effectIndex = roomView.effectIndex;
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
        case 3:
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
        default:
        {
            BattleViewController * bvc = [[BattleViewController alloc]initWithNibName:@"BattleViewController" bundle:nil];
                      bvc.effectIndex = roomView.effectIndex;
            bvc.isBoss = YES;
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
    }
}
- (IBAction)backClick:(id)sender {
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
//    [self.navigationController popViewControllerAnimated:YES];
    
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
