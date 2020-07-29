//
//  CharacterSave.h
//  Adventure
//
//  Created by admin on 2020/7/8.
//  Copyright © 2020 adv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CharacterItems.h"
#import "CharacterSkills.h"
NS_ASSUME_NONNULL_BEGIN

@interface CharacterSave : NSObject<NSCoding>
@property (nonatomic,strong) NSNumber * floor;
@property (nonatomic,strong) NSNumber * characterIndex;
@property (nonatomic,strong) NSString * name;
@property (nonatomic,strong) NSNumber * PoisonedTurn;
@property (nonatomic,strong) CharacterAttributes * characterAttributes;
@property (nonatomic,strong) CharacterItems * characterItems;
@property (nonatomic,strong) CharacterSkills * characterSkills;
+ (CharacterSave*)newSaveWithIndex:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END
