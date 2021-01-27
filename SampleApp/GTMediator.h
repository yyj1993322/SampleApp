//
//  GTMediator.h
//  SampleApp
//
//  Created by 南继云 on 2021/1/27.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GTDetailViewControllerProtocol <NSObject>
- (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl;
@end

@interface GTMediator : NSObject

//target action
+(__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)datailUrl;

//urlscheme
typedef void (^GTMediatorProcessBlock)(NSDictionary *params);
+ (void)registerScheme:(NSString *)scheme processBlock:(GTMediatorProcessBlock)processBlock;
+ (void)openUrl: (NSString *)url params:(NSDictionary *)params;

//protocol class
+ (void)registerProtol:(Protocol *)proto class:(Class)cls;
+ (Class)classForProtol:(Protocol *)proto;


@end

NS_ASSUME_NONNULL_END
