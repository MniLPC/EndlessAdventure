//
//  CharacterSkills.m
//  Adventure
//
//  Created by admin on 2020/7/21.
//  Copyright © 2020 adv. All rights reserved.
//

#import "CharacterSkills.h"

@implementation CharacterSkills
- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super init])
    {
        self.skill1 = [coder decodeObjectForKey:@"skill1"];
        self.skill2 = [coder decodeObjectForKey:@"skill2"];

        self.skill3 = [coder decodeObjectForKey:@"skill3"];

        self.skill4 = [coder decodeObjectForKey:@"skill4"];

 
       
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:_skill1 forKey:@"skill1"];
    [coder encodeObject:_skill2 forKey:@"skill2"];
    [coder encodeObject:_skill3 forKey:@"skill3"];
    [coder encodeObject:_skill4 forKey:@"skill4"];

}
@end
