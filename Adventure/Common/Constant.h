//
//  LPCUtilsConstant.h
//  paintColor
//
//  Created by qazx on 2019/1/10.
//  Copyright © 2019年 qazx. All rights reserved.
//

#import <UIKit/UIKit.h>


/// 是否为刘海屏
static bool NotchPhone(void){
    static BOOL isNotch;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (@available(iOS 11.0, *)) {
            UIEdgeInsets safeAreaInsets = [UIApplication sharedApplication].keyWindow.safeAreaInsets;
            isNotch = safeAreaInsets.bottom > 20;
        } else {
            isNotch = ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO);
        }
    });
    return isNotch;
}

/// StatusBar高度
static inline CGFloat StatusBarHeight(void){
    return NotchPhone()? 44.f : 20.f;
}

/// Tabbar高度
static inline CGFloat TabbarHeight(void){
    return NotchPhone()? 82.f : 49.f;
}

/// 底部安全区域高度
static inline CGFloat SafeAreaBottomHeight(void){
    return NotchPhone()? 34.f : 0.f;
}

/// 顶部安全区域高度
static inline CGFloat SafeAreaTopHeight(void){
    return NotchPhone()? 22.0f : 0.f;
}
#define  kScaleWidth            (kScreenWidth/375.0)
#define  kIsiPhoneX             NotchPhone()
#define  kStatusBarHeight       StatusBarHeight()
#define  kSafeAreaTopHeight     SafeAreaTopHeight()
#define  kNavigationBarHeight   44.0f
#define  kTabbarHeight          TabbarHeight()
#define  kSafeAreaBottomHeight  SafeAreaBottomHeight()
#define  kScreenWidth [UIScreen mainScreen].bounds.size.width
#define  kScreenHeight [UIScreen mainScreen].bounds.size.height
#define  kScreeenBounds [UIScreen mainScreen].bounds

#define Professions @[@"Warrior",@"Ranger",@"Mage",@"Priest",@"Paladin",@"Witch",@"Valkyrie"]

#define APPLICATION         [UIApplication sharedApplication]
#define APPDLE              (AppDelegate*)[APPLICATION delegate]
#define kKeyWindow          [UIApplication sharedApplication].keyWindow
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]
#define ContentHeight           (kScreenHeight - kSafeAreaTopHeight - kSafeAreaBottomHeight - kTabbarHeight)
#define DEVICE_APP_VERSION      (NSString *)[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
// app Build版本号
#define DEVICE_APP_BUILD        (NSString *)[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
// 系统版本号（string）
#define DEVICE_OS_VERSION       [[UIDevice currentDevice] systemVersion]
// 系统版本号（float）
#define DEVICE_OS_VERSION_VALUE [DEVICE_OS_VERSION floatValue]
#define kStringIsEmpty(str)     ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
#define kArrayIsEmpty(array)    (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
#define kDictIsEmpty(dic)       (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
/// @name weak&strong self
#define WeakSelf(type) __weak __typeof__(type) weakSelf = type;
#define StrongSelf(type) __strong __typeof__(type) strongSelf = type;
/// @name 字体、颜色相关
///=============================================================================
#define MonsterNamesArray         @[@"Killer wasp",@"Pumpkin head",@"Imp",@"War ghost",@"Undead hound",@"Cursed book",@"Goblin Raider",@"Goblin Lord",@"Hungry wolf",@"Wild boar",@"Mad bear",@"Ghoul",@"Harpy",@"Frankenstein",@"Dryad",@"Troll",@"vampire",@"Djinn",@"Evil dwarf",@"Monocular giant",@"Coyotes",@"Young dragon",@"Ghost rider",@"Devil boy",@"Atum",@"Scorpion Queen",@"Night Demon",@"Flash moth",@"Minotaur",@"Horror",@"Lich",@"Black widow",@"Parasite",@"Killer crab",@"Death claw",@"Khazra"]
#define BossNamesArray @[@"Demon Lord",@"Kirin",@"Headless Knight",@"Ancient creations",@"Synthetic Beast",@"Phoenix",@"Hydra",@"Destroyer"]
#define FONT_SIZE(f)            [UIFont systemFontOfSize:(f)]
#define FONT_BOLD_SIZE(f)       [UIFont boldSystemFontOfSize:(f)]
#define FONT_ITALIC_SIZE(f)     [UIFont italicSystemFontOfSize:(f)]
#define RGBCOLOR(r,g,b)         [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.f]
#define RGBACOLOR(r,g,b,a)      [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:(a)]
#define RandomColor             [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
#define ColorWithHex(rgbValue)  [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]



