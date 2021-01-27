//
//  GTDetailViewController.h
//  SampleApp
//
//  Created by 南继云 on 2021/1/11.
//

#import <UIKit/UIKit.h>
#import "GTMediator.h"

NS_ASSUME_NONNULL_BEGIN

/// 文章底层页
@interface GTDetailViewController : UIViewController<GTDetailViewControllerProtocol>

-(instancetype)initWithUrlString:(NSString *)urlString;

@end

NS_ASSUME_NONNULL_END
