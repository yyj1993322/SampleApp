//
//  GTNotifiaction.m
//  SampleApp
//
//  Created by 南继云 on 2021/2/1.
//

#import "GTNotifiaction.h"
#import <UserNotifications/UserNotifications.h>

@interface GTNotifiaction()



@end

@implementation GTNotifiaction

+(GTNotifiaction *) manager{
    static GTNotifiaction* manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[GTNotifiaction alloc] init];
    });
    return manager;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)checkNotifiactionAutherization{
    [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:UNAuthorizationOptionBadge completionHandler:^(BOOL granted, NSError * _Nullable error) {
            NSLog(@"");
    }];
}

@end
