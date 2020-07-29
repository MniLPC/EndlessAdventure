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
        self.characterSkills = [coder decodeObjectForKey:@"characterSkills"];
        self.characterIndex = [coder decodeObjectForKey:@"characterIndex"];
        self.floor = [coder decodeObjectForKey:@"floor"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:_characterAttributes forKey:@"characterAttributes"];
    [coder encodeObject:_characterItems forKey:@"characterItems"];
    [coder encodeObject:_characterSkills forKey:@"characterSkills"];
    [coder encodeObject:_characterIndex forKey:@"characterIndex"];
    [coder encodeObject:_floor forKey:@"floor"];

}

+ (CharacterSave*)newSaveWithIndex:(NSInteger)index{
    
    CharacterSave * save = [[CharacterSave alloc]init];
    save.floor = @1;
    CharacterSkills * skills = [CharacterSkills new];
    skills.skill1 = @(index*3);
    skills.skill2 = @(index*3+1);
    skills.skill3 = @(index*3+2);
    
    CharacterAttributes * attributes = [CharacterAttributes new];
    CharacterItems * items = [CharacterItems new];
    switch (index) {
        case 0:
            {
                attributes.STR = @35;
                attributes.DEX = @25;
                attributes.INT = @5;
                attributes.PIE = @5;
                attributes.MaxHp = @120;
                attributes.HP = @120;
                attributes.Shield = @0;
                attributes.Avoid = @20;
                attributes.Critical = @10;
                
                ItemAttributes * itemAtt0 = [ItemAttributes new];
                itemAtt0.STR = @11;
                itemAtt0.DEX = @9;
                itemAtt0.Critical = @5;
                itemAtt0.Type = @0;
                itemAtt0.Image = @"Weapon_STR7";
                
                
                ItemAttributes * itemAtt1 = [ItemAttributes new];
                itemAtt1.STR = @12;
                itemAtt1.MaxHp = @10;
                itemAtt1.Rest = @5;
                itemAtt1.Type = @1;
                itemAtt1.Image = @"Armor_STR2";
                
                items.Weapon = itemAtt0;
                items.Armor = itemAtt1;

            }
            break;
        case 1:
                {
                    attributes.STR = @10;
                    attributes.DEX = @30;
                    attributes.INT = @25;
                    attributes.PIE = @5;
                    attributes.MaxHp = @90;
                    attributes.HP = @100;
                    attributes.Shield = @0;
                    attributes.Avoid = @30;
                    attributes.Critical = @20;
                    
                    ItemAttributes * itemAtt0 = [ItemAttributes new];
                    itemAtt0.STR = @11;
                    itemAtt0.DEX = @9;
                    itemAtt0.Critical = @5;
                    itemAtt0.Type = @0;
                    itemAtt0.Image = @"Weapon_DEX1";
                    
                    
                    ItemAttributes * itemAtt1 = [ItemAttributes new];
                    itemAtt1.STR = @12;
                    itemAtt1.MaxHp = @10;
                    itemAtt1.Rest = @5;
                    itemAtt1.Type = @1;
                    itemAtt1.Image = @"Armor_DEX1";
                    
                    items.Weapon = itemAtt0;
                    items.Armor = itemAtt1;
                }
                break;
        case 2:
                {
                    attributes.STR = @15;
                    attributes.DEX = @15;
                    attributes.INT = @40;
                    attributes.PIE = @30;
                    attributes.MaxHp = @90;
                    attributes.HP = @90;
                    attributes.Shield = @0;
                    attributes.Avoid = @20;
                    attributes.Critical = @10;
                    
                    ItemAttributes * itemAtt0 = [ItemAttributes new];
                    itemAtt0.STR = @11;
                    itemAtt0.DEX = @9;
                    itemAtt0.Critical = @5;
                    itemAtt0.Type = @0;
                    itemAtt0.Image = @"Weapon_INT1";
                    
                    
                    ItemAttributes * itemAtt1 = [ItemAttributes new];
                    itemAtt1.STR = @12;
                    itemAtt1.MaxHp = @10;
                    itemAtt1.Rest = @5;
                    itemAtt1.Type = @1;
                    itemAtt1.Image = @"Armor_INT1";
                    
                    items.Weapon = itemAtt0;
                    items.Armor = itemAtt1;
                }
                break;
        case 3:
                {
                    attributes.STR = @30;
                    attributes.DEX = @15;
                    attributes.INT = @15;
                    attributes.PIE = @40;
                    attributes.MaxHp = @110;
                    attributes.HP = @110;
                    attributes.Shield = @0;
                    attributes.Avoid = @20;
                    attributes.Critical = @10;
                    
                    ItemAttributes * itemAtt0 = [ItemAttributes new];
                    itemAtt0.STR = @11;
                    itemAtt0.DEX = @9;
                    itemAtt0.Critical = @5;
                    itemAtt0.Type = @0;
                    itemAtt0.Image = @"Weapon_PIE1";
                    
                    
                    ItemAttributes * itemAtt1 = [ItemAttributes new];
                    itemAtt1.STR = @12;
                    itemAtt1.MaxHp = @10;
                    itemAtt1.Rest = @5;
                    itemAtt1.Type = @1;
                    itemAtt1.Image = @"Armor_PIE1";
                    
                    items.Weapon = itemAtt0;
                    items.Armor = itemAtt1;
                }
                break;
        case 4:
                {
                    attributes.STR = @50;
                    attributes.DEX = @15;
                    attributes.INT = @15;
                    attributes.PIE = @15;
                    attributes.MaxHp = @120;
                    attributes.HP = @120;
                    attributes.Shield = @0;
                    attributes.Avoid = @20;
                    attributes.Critical = @10;
                    ItemAttributes * itemAtt0 = [ItemAttributes new];
                    itemAtt0.STR = @11;
                    itemAtt0.DEX = @9;
                    itemAtt0.Critical = @5;
                    itemAtt0.Type = @0;
                    itemAtt0.Image = @"Weapon_STR9";
                    
                    
                    ItemAttributes * itemAtt1 = [ItemAttributes new];
                    itemAtt1.STR = @12;
                    itemAtt1.MaxHp = @10;
                    itemAtt1.Rest = @5;
                    itemAtt1.Type = @1;
                    itemAtt1.Image = @"Armor_STR3";
                    
                    items.Weapon = itemAtt0;
                    items.Armor = itemAtt1;
                }
                break;
        case 5:
                {
                    attributes.STR = @30;
                    attributes.DEX = @15;
                    attributes.INT = @30;
                    attributes.PIE = @15;
                    attributes.MaxHp = @110;
                    attributes.HP = @110;
                    attributes.Shield = @0;
                    attributes.Avoid = @20;
                    attributes.Critical = @10;
                    ItemAttributes * itemAtt0 = [ItemAttributes new];
                    itemAtt0.STR = @11;
                    itemAtt0.DEX = @9;
                    itemAtt0.Critical = @5;
                    itemAtt0.Type = @0;
                    itemAtt0.Image = @"Weapon_STR8";
                    
                    
                    ItemAttributes * itemAtt1 = [ItemAttributes new];
                    itemAtt1.STR = @12;
                    itemAtt1.MaxHp = @10;
                    itemAtt1.Rest = @5;
                    itemAtt1.Type = @1;
                    itemAtt1.Image = @"Armor_STR2";
                    
                    items.Weapon = itemAtt0;
                    items.Armor = itemAtt1;
                }
                break;
        case 6:
                {
                    attributes.STR = @15;
                    attributes.DEX = @35;
                    attributes.INT = @35;
                    attributes.PIE = @15;
                    attributes.MaxHp = @90;
                    attributes.HP = @90;
                    attributes.Shield = @0;
                    attributes.Avoid = @30;
                    attributes.Critical = @20;
                    ItemAttributes * itemAtt0 = [ItemAttributes new];
                    itemAtt0.STR = @11;
                    itemAtt0.DEX = @9;
                    itemAtt0.Critical = @5;
                    itemAtt0.Type = @0;
                    itemAtt0.Image = @"Weapon_DEX2";
                    
                    
                    ItemAttributes * itemAtt1 = [ItemAttributes new];
                    itemAtt1.STR = @12;
                    itemAtt1.MaxHp = @10;
                    itemAtt1.Rest = @5;
                    itemAtt1.Type = @1;
                    itemAtt1.Image = @"Armor_DEX2";
                    
                    items.Weapon = itemAtt0;
                    items.Armor = itemAtt1;
                }
                break;
        default:
        {
            attributes.STR = @35;
            attributes.DEX = @15;
            attributes.INT = @15;
            attributes.PIE = @35;
            attributes.MaxHp = @120;
            attributes.HP = @120;
            attributes.Shield = @0;
            attributes.Avoid = @20;
            attributes.Critical = @10;
            
            ItemAttributes * itemAtt0 = [ItemAttributes new];
            itemAtt0.STR = @11;
            itemAtt0.DEX = @9;
            itemAtt0.Critical = @5;
            itemAtt0.Type = @0;
            itemAtt0.Image = @"Weapon_STR1";
            
            
            ItemAttributes * itemAtt1 = [ItemAttributes new];
            itemAtt1.STR = @12;
            itemAtt1.MaxHp = @10;
            itemAtt1.Rest = @5;
            itemAtt1.Type = @1;
            itemAtt1.Image = @"Armor_PIE1";
            
            items.Weapon = itemAtt0;
            items.Armor = itemAtt1;
        }
            break;
    }
    
    attributes.Rest = @10;
    attributes.Experience = @0;
    attributes.Level = @1;
    
    save.characterAttributes = attributes;
    save.characterItems = items;
    save.characterSkills = skills;
    save.characterIndex = [NSNumber numberWithInteger:index];
    
    
    
    
    return save;
    
    
    
    
}

@end
