//
//  CharacterItems.m
//  Adventure
//
//  Created by admin on 2020/7/7.
//  Copyright © 2020 adv. All rights reserved.
//

#import "CharacterItems.h"

@implementation CharacterItems
- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super init])
    {
        self.Weapon = [coder decodeObjectForKey:@"Weapon"];
        self.Armor = [coder decodeObjectForKey:@"Armor"];
        self.Jewelry = [coder decodeObjectForKey:@"Jewelry"];
       
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:_Weapon forKey:@"Weapon"];
    [coder encodeObject:_Armor forKey:@"Armor"];
    [coder encodeObject:_Jewelry forKey:@"Jewelry"];
  
}
@end
