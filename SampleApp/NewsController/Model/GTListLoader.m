//
//  GTListLoader.m
//  SampleApp
//
//  Created by 南继云 on 2021/1/14.
//

#import "GTListLoader.h"
#import <AFNetworking.h>
#import "GTListItem.h"

@implementation GTListLoader
-(void)loadListDataWithFinishBlock:(GTListLoaderFinishBlock)finishBlock {


//    [[AFHTTPSessionManager manager] GET:@"http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e" parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"");
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"");
//    }];


	NSString *urlString = @"http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";
	NSURL *listURL = [NSURL URLWithString:urlString];
//    NSURLRequest *listRequest = [NSURLRequest requestWithURL:listURL];
	NSURLSession *session = [NSURLSession sharedSession];

//    NSURLSessionDataTask * task = [session dataTaskWithRequest:listRequest];
	NSURLSessionDataTask *datatask = [session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
	                                          NSError *jsonError;
	                                          id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
	                                          NSDictionary *result = [((NSDictionary *)jsonObj) objectForKey:@"result"];
#warning 类型的检查
	                                          NSArray *dataArray = [((NSDictionary *) result) objectForKey:@"data"];
	                                          NSMutableArray *listItemArray = @[].mutableCopy;
	                                          for(NSDictionary *info in dataArray) {
							  GTListItem *listItem = [[GTListItem alloc] init];
							  [listItem configWithDictionary:info];
							  [listItemArray addObject:listItem];
						  }
	                                          dispatch_async(dispatch_get_main_queue(), ^{
									 if(finishBlock) {
										 finishBlock(error == nil, listItemArray.copy);
									 }
								 });
					  }];

	[datatask resume];
    [self _getSandBoxPath];
}

-(void)_getSandBoxPath{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePatch = [pathArray firstObject];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //创建文件夹
    NSString *dataPath = [cachePatch stringByAppendingPathComponent:@"GTData"];
    NSError *createError;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&createError];
    //创建文件
    NSString *listDataPath = [dataPath stringByAppendingPathComponent:@"list"];
    NSData *listData = [@"abc" dataUsingEncoding:(NSUTF8StringEncoding)];
    [fileManager createFileAtPath:listDataPath contents:listData attributes:nil];
    //查询文件
    BOOL fileExist = [fileManager fileExistsAtPath:listDataPath];
    //删除文件
//    if (fileExist) {
//        [fileManager removeItemAtPath:listDataPath error:nil];
//    }
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingURL:listDataPath error:nil];
    [fileHandle seekToEndOfFile];//将光标移动到元素末尾
    [fileHandle writeData:[@"abc" dataUsingEncoding:(NSUTF8StringEncoding)]];
    [fileHandle synchronizeFile];//立即io写入磁盘
    [fileHandle closeFile];
    NSLog(@"");
    
    
}
@end
