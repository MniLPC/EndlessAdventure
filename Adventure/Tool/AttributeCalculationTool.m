//
//  AttributeCalculationTool.m
//  Adventure
//
//  Created by admin on 2020/7/7.
//  Copyright © 2020 adv. All rights reserved.
//

#import "AttributeCalculationTool.h"

@implementation AttributeCalculationTool
static AttributeCalculationTool *_instance = nil;

+ (instancetype)shareInstance{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return  _instance;
}
- (CharacterAttributes*)getCharacterAttributes:(CharacterSave *)save{
    
    CharacterAttributes * calculatedAttributes = [[CharacterAttributes alloc]init];
    CharacterAttributes * baseAttributes = save.characterAttributes;
    CharacterItems * items = save.characterItems;
    NSInteger str = baseAttributes.STR.integerValue;
    str = baseAttributes.STR.integerValue + items.Weapon.STR.integerValue+items.Armor.STR.integerValue+items.Jewelry.STR.integerValue;
    calculatedAttributes.STR = [NSNumber numberWithInteger:str];
    
    NSInteger DEX = baseAttributes.DEX.integerValue;
    DEX = baseAttributes.DEX.integerValue + items.Weapon.DEX.integerValue+items.Armor.DEX.integerValue+items.Jewelry.DEX.integerValue;
    calculatedAttributes.DEX = [NSNumber numberWithInteger:DEX];
    
    NSInteger INT = baseAttributes.INT.integerValue;
    INT = baseAttributes.INT.integerValue + items.Weapon.INT.integerValue+items.Armor.INT.integerValue+items.Jewelry.INT.integerValue;
    calculatedAttributes.INT = [NSNumber numberWithInteger:INT];
    
    NSInteger PIE = baseAttributes.PIE.integerValue;
    PIE = baseAttributes.PIE.integerValue + items.Weapon.PIE.integerValue+items.Armor.PIE.integerValue+items.Jewelry.PIE.integerValue;
    calculatedAttributes.PIE = [NSNumber numberWithInteger:PIE];
    
    NSInteger MaxHp = baseAttributes.MaxHp.integerValue;
    MaxHp = baseAttributes.MaxHp.integerValue + items.Weapon.MaxHp.integerValue+items.Armor.MaxHp.integerValue+items.Jewelry.MaxHp.integerValue;
    calculatedAttributes.MaxHp = [NSNumber numberWithInteger:MaxHp];
    
    NSInteger Shield = baseAttributes.Shield.integerValue;
    Shield = baseAttributes.Shield.integerValue + items.Weapon.Shield.integerValue+items.Armor.Shield.integerValue+items.Jewelry.Shield.integerValue;
    calculatedAttributes.Shield = [NSNumber numberWithInteger:Shield];
    
    NSInteger Avoid = baseAttributes.Avoid.integerValue;
    Avoid = baseAttributes.Avoid.integerValue + items.Weapon.Avoid.integerValue+items.Armor.Avoid.integerValue+items.Jewelry.Avoid.integerValue;
    calculatedAttributes.Avoid = [NSNumber numberWithInteger:Avoid];
    
    NSInteger Critical = baseAttributes.Critical.integerValue;
    Critical = baseAttributes.Critical.integerValue + items.Weapon.Critical.integerValue+items.Armor.Critical.integerValue+items.Jewelry.Critical.integerValue;
    calculatedAttributes.Critical = [NSNumber numberWithInteger:Critical];
    
    NSInteger Rest = baseAttributes.Rest.integerValue;
    Rest = baseAttributes.Rest.integerValue + items.Weapon.Rest.integerValue+items.Armor.Rest.integerValue+items.Jewelry.Rest.integerValue;
    calculatedAttributes.Rest = [NSNumber numberWithInteger:Rest];
    
    calculatedAttributes.Experience = baseAttributes.Experience;
    calculatedAttributes.Level = baseAttributes.Level;
    
    return calculatedAttributes;
}

@end
