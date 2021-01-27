//
//  GTMediator.m
//  SampleApp
//
//  Created by 南继云 on 2021/1/27.
//

#import "GTMediator.h"
//#import "GTDetailViewController.h"

@implementation GTMediator

//target action
+(__kindof UIViewController *)detailViewCOntrollerWithUrl:(NSString *)datailUrl{
//    GTDetailViewController *controller = [[GTDetailViewController alloc] initithUrlString:datailUrl];
    Class detailCls = NSClassFromString(@"GTDetailViewController");
    UIViewController *controller = [[detailCls alloc] performSelector:NSSelectorFromString(@"initWithUrlString:") withObject:datailUrl];
    return controller;
}

//urlscheme
#pragma mark -

+ (NSMutableDictionary *)mediatorCache{
    static NSMutableDictionary *cache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = @{}.mutableCopy;
    });
    return cache;
}

+ (void)registerScheme:(NSString *)scheme processBlock:(GTMediatorProcessBlock)processBlock{
    if(scheme && processBlock){
        [[[self class] mediatorCache] setObject:processBlock forKey:scheme];
    }
    
}
+ (void)openUrl: (NSString *)url params:(NSDictionary *)params{
   GTMediatorProcessBlock block = [[[self class] mediatorCache] objectForKey:url];
    if (block) {
        block(params);
    }
    
}


@end
