//
//  NewSkillViewController.h
//  Adventure
//
//  Created by admin on 2020/7/21.
//  Copyright © 2020 adv. All rights reserved.
//

#import "CommonViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewSkillViewController : CommonViewController
@property (nonatomic,assign) NSInteger skillIndex;
@property (nonatomic,strong) CharacterSave * save;
@end

NS_ASSUME_NONNULL_END
