//
//  AppDelegate.m
//  SampleApp
//
//  Created by 南继云 on 2021/1/5.
//

#import "AppDelegate.h"
#import "GTStaticTest.h"
#import <execinfo.h>
#import "GTNotification.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	// Override point for customization after application launch.
//    static
//    [[GTStaticTest alloc] init];
	[self _caughtException];
//	[ @[].mutableCopy addObject: nil];
    [[GTNotification notificationManager] checkNotificationAuthorization];
	return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
	// Called when a new scene session is being created.
	// Use this method to select a configuration to create the new scene with.
	return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
	// Called when the user discards a scene session.
	// If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
	// Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}

#pragma mark -crash
-(void)_caughtException {
    //Exception
	NSSetUncaughtExceptionHandler(HandleNSException);
    
    //signal
    signal(SIGABRT, SignalExceptionHandler);
    signal(SIGILL, SignalExceptionHandler);
    signal(SIGSEGV, SignalExceptionHandler);
    signal(SIGFPE, SignalExceptionHandler);
    signal(SIGBUS, SignalExceptionHandler);
    signal(SIGPIPE, SignalExceptionHandler);
}

void HandleNSException(NSException *exception){
	__unused NSString *reason = [exception reason];
	__unused NSString *name = [exception name];
    //存储crash信息
}

void SignalExceptionHandler(int signal){
    void* callstack[128];
    int frames = backtrace(callstack, 128);
    char **strs = backtrace_symbols(callstack, 128);
    NSMutableArray *backtrace = [NSMutableArray arrayWithCapacity:frames];
    for (int i = 0; i < frames; i++) {
        [backtrace addObject: [NSString stringWithUTF8String:strs[i]]];
    }
    free(strs);
    //存储crash信息
}

#pragma mark -

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    //GTNOtification中实现
    NSLog(@"");
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    
}

@end
