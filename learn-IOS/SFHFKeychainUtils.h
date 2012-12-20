//
//  SFHFKeychainUtils.h
//  learn-IOS
//
//  Created by mrj on 12-12-17.
//  Copyright (c) 2012年 mrj. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SFHFKeychainUtils : NSObject {
    
}

+ (NSString *) getPasswordForUsername: (NSString *) username andServiceName: (NSString *) serviceName error: (NSError **) error;
+ (BOOL) storeUsername: (NSString *) username andPassword: (NSString *) password forServiceName: (NSString *) serviceName updateExisting: (BOOL) updateExisting error: (NSError **) error;
+ (BOOL) deleteItemForUsername: (NSString *) username andServiceName: (NSString *) serviceName error: (NSError **) error;

@end