//
//  CharacterItems.h
//  Adventure
//
//  Created by admin on 2020/7/7.
//  Copyright © 2020 adv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemAttributes.h"
NS_ASSUME_NONNULL_BEGIN

@interface CharacterItems : NSObject<NSCoding>
@property (nonatomic,strong) ItemAttributes * Weapon;
@property (nonatomic,strong) ItemAttributes * Armor;
@property (nonatomic,strong) ItemAttributes * Jewelry;
@end

NS_ASSUME_NONNULL_END
