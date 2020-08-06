//
//  CharacterCollectionViewCell.m
//  Adventure
//
//  Created by admin on 2020/7/15.
//  Copyright © 2020 adv. All rights reserved.
//

#import "CharacterCollectionViewCell.h"

@implementation CharacterCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setCellWithSave:(CharacterSave*)save{
    NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"ProfessionList"ofType:@"plist"];

            NSArray * professionArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
      NSDictionary * professionDict = professionArray[save.characterIndex.integerValue];
    NSString * nameSTR = professionDict[@"name"];
    self.nameLabel.text = [nameSTR stringByAppendingFormat:@" Lv%@ %@F",save.characterAttributes.Level,save.floor];
    self.charactorImageVIew.image = [UIImage imageNamed:[NSString stringWithFormat:@"character_%@",save.characterIndex]];
}
@end
