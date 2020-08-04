//
//  CharacterCollectionViewCell.h
//  Adventure
//
//  Created by admin on 2020/7/15.
//  Copyright © 2020 adv. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CharacterCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *charactorImageVIew;
- (void)setCellWithSave:(CharacterSave*)save;
@end

NS_ASSUME_NONNULL_END
