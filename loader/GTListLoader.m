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
    NSURLRequest *listRequest = [NSURLRequest requestWithURL:listURL];
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask * task = [session dataTaskWithRequest:listRequest];
    NSLog(@"");
    
}
@end
