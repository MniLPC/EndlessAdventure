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

        self.skillCoolDown1 = [coder decodeObjectForKey:@"skillCoolDown1"];
        self.skillCoolDown2 = [coder decodeObjectForKey:@"skillCoolDown2"];
        self.skillCoolDown3 = [coder decodeObjectForKey:@"skillCoolDown3"];
        self.skillCoolDown4 = [coder decodeObjectForKey:@"skillCoolDown4"];
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:_skill1 forKey:@"skill1"];
    [coder encodeObject:_skill2 forKey:@"skill2"];
    [coder encodeObject:_skill3 forKey:@"skill3"];
    [coder encodeObject:_skill4 forKey:@"skill4"];
    [coder encodeObject:_skillCoolDown1 forKey:@"skillCoolDown1"];
      [coder encodeObject:_skillCoolDown2 forKey:@"skillCoolDown2"];
      [coder encodeObject:_skillCoolDown3 forKey:@"skillCoolDown3"];
      [coder encodeObject:_skillCoolDown4 forKey:@"skillCoolDown4"];
}
@end
