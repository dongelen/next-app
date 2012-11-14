//
//  PushAPIClient.m
//  PushNotificationDemo
//
//  Created by Erik van der Wal on 14-11-12.
//  Copyright (c) 2012 Erik van der Wal. All rights reserved.
//

#import "PushAPIClient.h"
#import "AFJSONRequestOperation.h"

static NSString *kPushServerBaseURL = @"http://www.example.com/api";

@implementation PushAPIClient

+ (id)sharedInstance
{
    static PushAPIClient *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] initWithBaseURL:[NSURL URLWithString:kPushServerBaseURL]];
    });
    return sharedInstance;
}

- (id)initWithBaseURL:(NSURL *)url
{
    if ((self = [super initWithBaseURL:url]))
    {
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    }
    return self;
}

- (void)registerPushToken:(NSString *)token
{
    NSDictionary *params = @{ @"uuid" : self.deviceID, @"token" : token };
    
    [self postPath:@"/devices" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Token registered with server!");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", [error localizedDescription]);
    }];
}

- (void)sendMessage:(NSString *)message
{
    NSDictionary *params = @{ @"uuid" : self.deviceID, @"text" : message };
    
    [self postPath:@"/messages" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Message sent!");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", [error localizedDescription]);
    }];
}

- (NSString *)deviceID
{
    if (_deviceID == nil) {
        _deviceID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    }
    return _deviceID;
}

@end
