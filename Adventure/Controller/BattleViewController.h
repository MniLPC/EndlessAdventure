//
//  BattleViewController.h
//  Adventure
//
//  Created by admin on 2020/7/9.
//  Copyright © 2020 adv. All rights reserved.
//

#import "CommonViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BattleViewController : CommonViewController
@property (nonatomic,strong) CharacterSave * save;
@property (nonatomic,assign) BOOL isBoss;
@property (nonatomic,assign) NSInteger effectIndex;
@end

NS_ASSUME_NONNULL_END
