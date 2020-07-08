//
//  CharacterSave.m
//  Adventure
//
//  Created by admin on 2020/7/8.
//  Copyright © 2020 adv. All rights reserved.
//

#import "CharacterSave.h"

@implementation CharacterSave
- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super init])
    {
        self.characterAttributes = [coder decodeObjectForKey:@"characterAttributes"];
        self.characterItems = [coder decodeObjectForKey:@"characterItems"];
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:_characterAttributes forKey:@"characterAttributes"];
    [coder encodeObject:_characterItems forKey:@"characterItems"];
    
}
@end
