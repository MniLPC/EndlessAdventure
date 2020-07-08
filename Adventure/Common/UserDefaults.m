//
//  UserDefaults.m
//  MusicTherapist
//
//  Created by Berry on 2015/11/18.
//  Copyright © 2015年 Berry Shum. All rights reserved.
//

#import "UserDefaults.h"

@implementation UserDefaults

+ (UserDefaults *)sharedUserDefaules
{
    static UserDefaults *_sharedUserDefaules = nil;
    @synchronized(self) {
        if (!_sharedUserDefaules) {
            _sharedUserDefaules = [[self alloc] init];
        }
    }
    return _sharedUserDefaules;
}


+ (void)removeObjectForKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:key];
    [userDefaults synchronize];
}


+ (void)removeAllObjects
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *appDomainString = [[NSBundle mainBundle] bundleIdentifier];
    [userDefaults removePersistentDomainForName:appDomainString];
    [userDefaults synchronize];
}


//*****************************************************************
//bool
+ (void)setBool:(BOOL)boolValue forKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults setBool:boolValue forKey:key];
}

+ (BOOL)boolForKey:(NSString *)defaultName
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults boolForKey:defaultName];
}

//*****************************************************************
//字符串和数字

+ (id)objectForKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:key];
}

+ (NSString *)stringForKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults stringForKey:key];
}


+ (void)setObject:(id)value forKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:value forKey:key];
    [userDefaults synchronize];
}


//*****************************************************************
//数组

+ (NSMutableArray *)arrayForKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *array = [userDefaults objectForKey:key];
    if (array && [array isKindOfClass:[NSArray class]]) {
        return [NSMutableArray arrayWithArray:array];
    } else {
        return [NSMutableArray array];
    }
}


+ (void)setArray:(NSMutableArray *)mutableArray forKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *array = [NSArray arrayWithArray:mutableArray];
    [userDefaults setObject:array forKey:key];
    [userDefaults synchronize];
}


//*****************************************************************
//集合

+ (NSMutableSet *)setForKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *array = [userDefaults objectForKey:key];
    if (array && [array isKindOfClass:[NSArray class]]) {
        return [NSMutableSet setWithArray:array];
    } else {
        return [NSMutableSet set];
    }
}


+ (void)setSet:(NSMutableSet *)mutableSet forKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *array = [mutableSet allObjects];
    [userDefaults setObject:array forKey:key];
    [userDefaults synchronize];
}


//*****************************************************************
//字典

+ (NSMutableDictionary *)dictionaryForKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dictionary = [userDefaults objectForKey:key];
    if (dictionary && [dictionary isKindOfClass:[NSDictionary class]]) {
        return [NSMutableDictionary dictionaryWithDictionary:dictionary];
    } else {
        return [NSMutableDictionary dictionary];
    }
}


+ (void)setDictionary:(NSMutableDictionary *)mutableDictionary forKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dictionary = [NSDictionary dictionaryWithDictionary:mutableDictionary];
    [userDefaults setObject:dictionary forKey:key];
    [userDefaults synchronize];
}


//*****************************************************************
//AES加密的字符串


/**
 *  返回AES解密后的对象
 *
 *  @param key key
 *
 *  @return 对象
 */
//+ (id)decryptObjectForKey:(NSString *)key
//{
//    id encryptString = [self objectForKey:key];
//    NSString *jsonString = [AESCrypt decrypt:encryptString];
//    id json = [CommonAPIs jsonObjectWithJsonString:jsonString];
//    return json;
//}


/**
 *  保存AES加密后的对象
 *
 *  @param value 值
 *  @param key   key
 */
//+ (void)setEncryptObject:(id)value forKey:(NSString *)key
//{
//    NSString *jsonString = [CommonAPIs jsonStringWithJsonObject:value];
//    NSString *encryptString = [AESCrypt encrypt:jsonString];
//    [self setObject:encryptString forKey:key];
//}


//*****************************************************************
//序列化后的数组


+ (NSMutableArray *)unArchiveArrayForKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *array = [userDefaults objectForKey:key];
    
    if (array && [array isKindOfClass:[NSArray class]]) {
        NSMutableArray *unArchiveArray = [NSMutableArray array];
        for (NSData *data in array) {
            id object = [NSKeyedUnarchiver unarchiveObjectWithData:data];
            [unArchiveArray addObject:object];
        }
        return [NSMutableArray arrayWithArray:unArchiveArray];
    } else {
        return [NSMutableArray array];
    }
}


+ (void)setArchivedArray:(NSMutableArray *)mutableArray forKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *archivedArray = [NSMutableArray array];
    for (id object in mutableArray) {
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:object];
        [archivedArray addObject:data];
    }
    NSArray *array = [NSArray arrayWithArray:archivedArray];
    [userDefaults setObject:array forKey:key];
    [userDefaults synchronize];
}


//*****************************************************************
//序列化后的对象

+ (id)unArchiveObjectForKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [userDefaults objectForKey:key];
    id object = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return object;
}


+ (void)setArchivedObject:(id)object forKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:object];
    [userDefaults setObject:data forKey:key];
    [userDefaults synchronize];
}


@end
