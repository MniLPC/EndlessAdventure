//
//  NewItemViewController.h
//  Adventure
//
//  Created by admin on 2020/7/21.
//  Copyright © 2020 adv. All rights reserved.
//

#import "CommonViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewItemViewController : CommonViewController
@property (nonatomic,strong) CharacterSave * save;
@property (nonatomic,strong) ItemAttributes * NewItem;
- (void)setUpUI;
@end

NS_ASSUME_NONNULL_END
