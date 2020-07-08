//
//  CharacterSave.h
//  Adventure
//
//  Created by admin on 2020/7/8.
//  Copyright © 2020 adv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CharacterItems.h"

NS_ASSUME_NONNULL_BEGIN

@interface CharacterSave : NSObject<NSCoding>
@property (nonatomic,strong) CharacterAttributes * characterAttributes;
@property (nonatomic,strong) CharacterItems * characterItems;
@end

NS_ASSUME_NONNULL_END
