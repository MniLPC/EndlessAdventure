//
//  CharacterAttributes.m
//  Adventure
//
//  Created by admin on 2020/7/7.
//  Copyright © 2020 adv. All rights reserved.
//

#import "CharacterAttributes.h"
static CharacterAttributes *_instance = nil;

@implementation CharacterAttributes
- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super init])
    {
        self.STR = [coder decodeObjectForKey:@"STR"];
        self.DEX = [coder decodeObjectForKey:@"DEX"];
        self.INT = [coder decodeObjectForKey:@"INT"];
        self.PIE = [coder decodeObjectForKey:@"PIE"];
        self.MaxHp = [coder decodeObjectForKey:@"MaxHp"];
        self.HP = [coder decodeObjectForKey:@"HP"];
        self.Shield = [coder decodeObjectForKey:@"Shield"];
        self.Avoid = [coder decodeObjectForKey:@"Avoid"];
        self.Critical = [coder decodeObjectForKey:@"Critical"];
        self.Rest = [coder decodeObjectForKey:@"Rest"];
        self.Experience = [coder decodeObjectForKey:@"Experience"];
        self.Level = [coder decodeObjectForKey:@"Level"];
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:_STR forKey:@"STR"];
    [coder encodeObject:_DEX forKey:@"DEX"];
    [coder encodeObject:_INT forKey:@"INT"];
    [coder encodeObject:_PIE forKey:@"PIE"];
    [coder encodeObject:_MaxHp forKey:@"MaxHp"];
    [coder encodeObject:_HP forKey:@"HP"];
    [coder encodeObject:_Shield forKey:@"Shield"];
    [coder encodeObject:_Avoid forKey:@"Avoid"];
    [coder encodeObject:_Critical forKey:@"Critical"];
    [coder encodeObject:_Rest forKey:@"Rest"];
    [coder encodeObject:_Experience forKey:@"Experience"];
    [coder encodeObject:_Level forKey:@"Level"];
  
}

@end
