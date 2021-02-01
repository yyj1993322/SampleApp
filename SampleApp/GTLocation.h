//
//  GTLocation.h
//  SampleApp
//
//  Created by 南继云 on 2021/1/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTLocation : NSObject
+(GTLocation *) locationManager;
-(void)checkLocationAutherization;

@end

NS_ASSUME_NONNULL_END
