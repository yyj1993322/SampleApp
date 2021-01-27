//
//  GTMediator.h
//  SampleApp
//
//  Created by 南继云 on 2021/1/27.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTMediator : NSObject

+(__kindof UIViewController *)detailViewCOntrollerWithUrl:(NSString *)datailUrl;

@end

NS_ASSUME_NONNULL_END
