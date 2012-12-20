//
//  dictionary_use_demo.m
//  learn-IOS
//
//  Created by mrj on 12-12-17.
//  Copyright (c) 2012年 mrj. All rights reserved.
//

#import "dictionary_use_demo.h"
#import "SFHFKeychainUtils.h"
#import <Security/Security.h>
@implementation dictionary_use_demo
static NSString *serviceName = @"demo";
+ (NSMutableDictionary *)newSearchDictionary:(NSString *)identifier {
    
    NSMutableDictionary *searchDictionary = [[NSMutableDictionary alloc] init];
    
    [searchDictionary setObject:(id)kSecClassGenericPassword forKey:(id)kSecClass];
    
    NSData *encodedIdentifier = [identifier dataUsingEncoding:NSUTF8StringEncoding];
    [searchDictionary setObject:encodedIdentifier forKey:(id)kSecAttrGeneric];
    [searchDictionary setObject:encodedIdentifier forKey:(id)kSecAttrAccount];
    [searchDictionary setObject:serviceName forKey:(id)kSecAttrService];
    
    return searchDictionary;
}
+ (NSString *)searchKeychainCopyMatching:(NSString *)identifier {
    NSMutableDictionary *searchDictionary = [self newSearchDictionary:identifier];
    
    // Add search attributes
    [searchDictionary setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    
    // Add search return types
    [searchDictionary setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    
    NSData *result = nil;
    OSStatus status = SecItemCopyMatching((CFDictionaryRef)searchDictionary,
                                          (CFTypeRef *)&result);
    [searchDictionary release];
    NSString *password = [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
    return password;
}
+ (BOOL)createKeychainValue:(NSString *)password forIdentifier:(NSString *)identifier {
    NSMutableDictionary *dictionary = [self newSearchDictionary:identifier];
    
    NSData *passwordData = [password dataUsingEncoding:NSUTF8StringEncoding];
    [dictionary setObject:passwordData forKey:(id)kSecValueData];
    
    OSStatus status = SecItemAdd((CFDictionaryRef)dictionary, NULL);
    [dictionary release];
    
    if (status == errSecSuccess) {
        return YES;
    }
    return NO;
}
+ (BOOL)updateKeychainValue:(NSString *)password forIdentifier:(NSString *)identifier {
    
    NSMutableDictionary *searchDictionary = [self newSearchDictionary:identifier];
    NSMutableDictionary *updateDictionary = [[NSMutableDictionary alloc] init];
    NSData *passwordData = [password dataUsingEncoding:NSUTF8StringEncoding];
    [updateDictionary setObject:passwordData forKey:(id)kSecValueData];
    
    OSStatus status = SecItemUpdate((CFDictionaryRef)searchDictionary,
                                    (CFDictionaryRef)updateDictionary);
    
    [searchDictionary release];
    [updateDictionary release];
    
    if (status == errSecSuccess) {
        return YES;
    }
    return NO;
}
+ (void)deleteKeychainValue:(NSString *)identifier {
    
    NSMutableDictionary *searchDictionary = [self newSearchDictionary:identifier];
    SecItemDelete((CFDictionaryRef)searchDictionary);
    [searchDictionary release];
}
+(void)test{
//    使用第三方类的方式
//    添加用户
    [SFHFKeychainUtils storeUsername:@"dd"
                         andPassword:@"aa"
                      forServiceName:serviceName
                      updateExisting:1
                               error:nil];
//    取得用户密码
    NSString *passWord =  [SFHFKeychainUtils getPasswordForUsername:@"dd"
                                                     andServiceName:serviceName
                                                              error:nil];
    NSLog(@"%@",passWord);
    
//   删除用户：
    [SFHFKeychainUtils deleteItemForUsername:@"dd" andServiceName:serviceName error:nil];
    
//    直接操作Security类
    NSString *userName=@"abc";
    [self createKeychainValue:@"345" forIdentifier:userName];//新建用户
    passWord=[self searchKeychainCopyMatching:userName];//根据用户名查询密码
    NSLog(@"passWord: %@",passWord);
    [self updateKeychainValue:@"678" forIdentifier:userName];//更新用户的密码
    passWord=[self searchKeychainCopyMatching:userName];
    NSLog(@"passWord: %@",passWord);
    [self deleteKeychainValue:userName];//删除一个用户
    passWord=[self searchKeychainCopyMatching:userName];
    NSLog(@"passWord: %@",passWord);
}

@end
