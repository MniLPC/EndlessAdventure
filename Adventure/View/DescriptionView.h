//
//  DescriptionView.h
//  Adventure
//
//  Created by admin on 2020/7/9.
//  Copyright © 2020 adv. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DescriptionView : UIView
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
+ (void)ShowDescriptionWithType:(NSInteger)type index:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END
