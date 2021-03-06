//
//  GTListLoader.h
//  SampleApp
//
//  Created by 南继云 on 2021/1/14.
//

#import <Foundation/Foundation.h>

@class GTListItem;
NS_ASSUME_NONNULL_BEGIN

typedef void(^GTListLoaderFinishBlock)(BOOL success, NSArray<GTListItem *> *dataArray);


/// 列表请求
@interface GTListLoader : NSObject

-(void)loadListDataWithFinishBlock:(GTListLoaderFinishBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
