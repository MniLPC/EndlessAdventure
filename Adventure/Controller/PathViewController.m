//
//  PathViewController.m
//  Adventure
//
//  Created by admin on 2020/7/16.
//  Copyright © 2020 adv. All rights reserved.
//

#import "PathViewController.h"
#import "RoomView.h"
@interface PathViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *currentSelectionView;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *nextSelectionView;
@property (nonatomic,strong) NSMutableArray * currentRoomArray;
@property (nonatomic,strong) NSMutableArray * nextRoomArrray;
@end

@implementation PathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpRooms];
    
    // Do any additional setup after loading the view from its nib.
}
- (void)setUpRooms{
    self.currentRoomArray = [NSMutableArray new];
    self.nextRoomArrray = [NSMutableArray new];
    for (int i = 0; i<2; i++) {
            RoomView * roomView = [[NSBundle mainBundle] loadNibNamed:@"RoomView" owner:nil options:nil].firstObject;
        
        int randomEvent = arc4random()%8;
        if (randomEvent<5) {
            randomEvent =1;
        }else{
            randomEvent = randomEvent-3;
        }
        int randomEffect = arc4random()%5;
        
        [roomView setRoomWithEventIndex:randomEvent EnvirIndex:randomEffect];
        [self.currentRoomArray addObject:roomView];
        UIButton * locationButton = self.currentSelectionView[i];
        roomView.frame = locationButton.frame;
        [self.view addSubview:roomView];
    }

    for (int i = 0; i<4; i++) {
            RoomView * roomView = [[NSBundle mainBundle] loadNibNamed:@"RoomView" owner:nil options:nil].firstObject;
        
        int randomEvent = arc4random()%8;
        if (randomEvent<5) {
            randomEvent =1;
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
