//
//  RoomView.m
//  Adventure
//
//  Created by admin on 2020/7/16.
//  Copyright © 2020 adv. All rights reserved.
//

#import "RoomView.h"

@implementation RoomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setRoomWithEventIndex:(NSInteger)eventIndex EnvirIndex:(NSInteger)envirIndex{
    
    switch (eventIndex) {
        case 0:
            {
                self.eventName.text = @"Enemy";
                self.eventImageView.image = [UIImage imageNamed:@"eventIcon1"];
            }
            break;
        case 1:
        {
            self.eventName.text = @"Treasure";
            self.eventImageView.image = [UIImage imageNamed:@"eventIcon2"];
            
        }
            break;
            case 2:
        {
            self.eventName.text = @"Event";
            self.eventImageView.image = [UIImage imageNamed:@"eventIcon3"];
        }
            break;
        case 3:
               {
                   self.eventName.text = @"Rest";
                   self.eventImageView.image = [UIImage imageNamed:@"eventIcon4"];
               }
                   break;
        default:
            break;
    }
    
}
@end
