//
//  GTMediator.m
//  SampleApp
//
//  Created by 南继云 on 2021/1/27.
//

#import "GTMediator.h"
//#import "GTDetailViewController.h"

@implementation GTMediator

+(__kindof UIViewController *)detailViewCOntrollerWithUrl:(NSString *)datailUrl{
    
//    GTDetailViewController *controller = [[GTDetailViewController alloc] initWithUrlString:datailUrl];
    
    Class detailCls = NSClassFromString(@"GTDetailViewController");
    UIViewController *controller = [[detailCls alloc] performSelector:NSSelectorFromString(@"initWithUrlString:") withObject:datailUrl];
    return controller;
}

@end
