//
//  RoomView.h
//  Adventure
//
//  Created by admin on 2020/7/16.
//  Copyright © 2020 adv. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RoomView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *eventImageView;
@property (weak, nonatomic) IBOutlet UILabel *eventName;
@property (weak, nonatomic) IBOutlet UIImageView *EnvironmentImageView;
@property (weak, nonatomic) IBOutlet UILabel *EnvironmentName;
@property (nonatomic,assign) NSInteger eventIndex;
@property (nonatomic,assign) NSInteger effectIndex;
@property (weak, nonatomic) IBOutlet UIButton *clickButton;
- (void)setRoomWithEventIndex:(NSInteger)eventIndex EnvirIndex:(NSInteger)envirIndex;
@end

NS_ASSUME_NONNULL_END
