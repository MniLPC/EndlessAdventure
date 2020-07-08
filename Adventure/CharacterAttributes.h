//
//  CharacterAttributes.h
//  Adventure
//
//  Created by admin on 2020/7/7.
//  Copyright © 2020 adv. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CharacterAttributes : NSObject<NSCoding>
@property (nonatomic,strong) NSNumber* STR;
@property (nonatomic,strong) NSNumber* DEX;
@property (nonatomic,strong) NSNumber* INT;
@property (nonatomic,strong) NSNumber* PIE;
@property (nonatomic,strong) NSNumber* MaxHp;
@property (nonatomic,strong) NSNumber * HP;
@property (nonatomic,strong) NSNumber * Shield;
@property (nonatomic,strong) NSNumber * Avoid;
@property (nonatomic,strong) NSNumber * Critical;
@property (nonatomic,strong) NSNumber * Rest;
@property (nonatomic,strong) NSNumber * Experience;
@property (nonatomic,strong) NSNumber * Level;
@end

NS_ASSUME_NONNULL_END
