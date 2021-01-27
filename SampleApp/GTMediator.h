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

//target action
+(__kindof UIViewController *)detailViewCOntrollerWithUrl:(NSString *)datailUrl;

//urlscheme
typedef void(^GTMediatorProcessBlock)(NSDictionary *params);
+ (void)registerScheme:(NSString *)scheme processBlock:(GTMediatorProcessBlock)processBlock;
+ (void)openUrl: (NSString *)url params:(NSDictionary *)params;

@end

NS_ASSUME_NONNULL_END
