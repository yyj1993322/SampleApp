//
//  GTNotifiaction.h
//  SampleApp
//
//  Created by 南继云 on 2021/2/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/// APP推送管理
@interface GTNotifiaction : NSObject

+(GTNotifiaction *) manager;
-(void)checkNotifiactionAutherization;

@end

NS_ASSUME_NONNULL_END
