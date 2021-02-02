//
//  GTNotifiaction.h
//  SampleApp
//
//  Created by 南继云 on 2021/2/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/// APP推送管理
@interface GTNotification : NSObject

+(GTNotification *) notificationManager;
-(void)checkNotificationAuthorization;

@end

NS_ASSUME_NONNULL_END
