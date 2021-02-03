//
//  GTNotifiaction.m
//  SampleApp
//
//  Created by 南继云 on 2021/2/1.
//
#import <UIKit/UIKit.h>
#import "GTNotification.h"
#import <UserNotifications/UserNotifications.h>

@interface GTNotification()<UNUserNotificationCenterDelegate>



@end

@implementation GTNotification

+(GTNotification *) notificationManager{
    static GTNotification* manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[GTNotification alloc] init];
    });
    return manager;
}

#pragma mark -推送

-(void)checkNotificationAuthorization{
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    center.delegate = self;
    [center requestAuthorizationWithOptions:UNAuthorizationOptionBadge completionHandler:^(BOOL granted, NSError * _Nullable error) {
        [self _pushLocalNotification];
//        远程推送需要证书，调试使用pusher暂时注释
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [[UIApplication sharedApplication] registerForRemoteNotifications];
//        });
    }];
}

-(void)_pushLocalNotification{
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.badge = @(1);
    content.title = @"极客时间";
    content.body = @"从零开始开发一款iOS App";
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:10.f repeats:NO];
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"_pushLocalNotification" content:content trigger:trigger];

    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
            NSLog(@"");
    }];
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler{
    completionHandler(UNNotificationPresentationOptionAlert);
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler{
//    -1操作，避免重复通知
//    [UIApplication sharedApplication].applicationIconBadgeNumber = 100;
    //处理业务逻辑
    completionHandler();
}


@end
