//
//  UserDefaults.h
//  MusicTherapist
//
//  Created by Berry on 2015/11/18.
//  Copyright © 2015年 Berry Shum. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDefaults : NSObject

+ (UserDefaults *)sharedUserDefaules;
+ (void)removeObjectForKey:(NSString *)key;
+ (void)removeAllObjects;

+ (void)setBool:(BOOL)boolValue forKey:(NSString *)key;
+ (BOOL)boolForKey:(NSString *)defaultName;

+ (id)objectForKey:(NSString *)key;
+ (NSString *)stringForKey:(NSString *)key;
+ (void)setObject:(id)value forKey:(NSString *)key;

+ (NSMutableArray *)arrayForKey:(NSString *)key;
+ (void)setArray:(NSMutableArray *)mutableArray forKey:(NSString *)key;

+ (NSMutableSet *)setForKey:(NSString *)key;
+ (void)setSet:(NSMutableSet *)mutableSet forKey:(NSString *)key;

+ (NSMutableDictionary *)dictionaryForKey:(NSString *)key;
+ (void)setDictionary:(NSMutableDictionary *)mutableDictionary forKey:(NSString *)key;

//+ (id)decryptObjectForKey:(NSString *)key;
//+ (void)setEncryptObject:(id)value forKey:(NSString *)key;

+ (NSMutableArray *)unArchiveArrayForKey:(NSString *)key;
+ (void)setArchivedArray:(NSMutableArray *)mutableArray forKey:(NSString *)key;

+ (id)unArchiveObjectForKey:(NSString *)key;
+ (void)setArchivedObject:(id)object forKey:(NSString *)key;

@end
