//
//  PathViewController.h
//  Adventure
//
//  Created by admin on 2020/7/16.
//  Copyright © 2020 adv. All rights reserved.
//

#import "CommonViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PathViewController : CommonViewController
@property (nonatomic,strong) CharacterSave * save;
@property (nonatomic,assign) NSInteger saveIndex;
@end

NS_ASSUME_NONNULL_END
