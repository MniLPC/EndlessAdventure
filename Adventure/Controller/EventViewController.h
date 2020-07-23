//
//  EventViewController.h
//  Adventure
//
//  Created by admin on 2020/7/22.
//  Copyright © 2020 adv. All rights reserved.
//

#import "CommonViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface EventViewController : CommonViewController
@property (nonatomic,assign) NSInteger eventIndex;
@property (nonatomic,assign) CharacterSave * save;
@end

NS_ASSUME_NONNULL_END
