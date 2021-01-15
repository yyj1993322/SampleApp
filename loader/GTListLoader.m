//
//  GTListLoader.m
//  SampleApp
//
//  Created by 南继云 on 2021/1/14.
//

#import "GTListLoader.h"

@implementation GTListLoader
-(void)loadData{
    
    NSString *urlString = @"https://www.runoob.com/ios/ios-action-outlet.html";
    NSURL *listURL = [NSURL URLWithString:urlString];
//    NSURLRequest *listRequest = [NSURLRequest requestWithURL:listURL];
    NSURLSession *session = [NSURLSession sharedSession];
    
//    NSURLSessionDataTask * task = [session dataTaskWithRequest:listRequest];
    NSURLSessionDataTask *datatask = [session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"");
    }];
    
    [datatask resume];
    
    NSLog(@"");
    
}
@end
