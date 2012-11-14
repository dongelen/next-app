//
//  PushAPIClient.h
//  PushNotificationDemo
//
//  Created by Erik van der Wal on 14-11-12.
//  Copyright (c) 2012 Erik van der Wal. All rights reserved.
//

#import "AFHTTPClient.h"

@interface PushAPIClient : AFHTTPClient

@property (nonatomic) NSString *deviceID;

+ (id)sharedInstance;
- (void)registerPushToken:(NSString *)token;
- (void)sendMessage:(NSString *)message;

@end
