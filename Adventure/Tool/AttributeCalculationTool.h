//
//  AttributeCalculationTool.h
//  Adventure
//
//  Created by admin on 2020/7/7.
//  Copyright © 2020 adv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CharacterAttributes.h"
#import "CharacterSave.h"
NS_ASSUME_NONNULL_BEGIN

@interface AttributeCalculationTool : NSObject
+ (instancetype)shareInstance;
- (CharacterAttributes*)getCharacterAttributes:(CharacterSave*)save;
@end

NS_ASSUME_NONNULL_END
