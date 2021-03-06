//
//  GTRecommendViewController.m
//  SampleApp
//
//  Created by 南继云 on 2021/1/8.
//

#import "GTRecommendViewController.h"

@interface GTRecommendViewController ()<UIScrollViewDelegate, UIGestureRecognizerDelegate>

@end

@implementation GTRecommendViewController

-(instancetype) init {
	self = [super init];
	if (self) {
        self.tabBarItem.title = @"推荐";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/like@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/like_selected@2x.png"];
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
	scrollView.delegate = self;
	scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 5, self.view.bounds.size.height);
	scrollView.backgroundColor = [UIColor lightGrayColor];
	NSArray *colorArray = @[[UIColor blackColor],[UIColor blueColor],[UIColor systemPinkColor],[UIColor yellowColor],[UIColor lightGrayColor]];

	for (int i = 0; i < 5; i++) {
		[scrollView addSubview:({
			UIView *view = [[UIView alloc]  initWithFrame: CGRectMake(self.view.bounds.size.width * i, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
			[view addSubview: ({
				UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
//                UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(viewClick)];
				UITapGestureRecognizer *gz = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClick)];
				gz.delegate = self;
				[view addGestureRecognizer: gz];
				view.backgroundColor = [UIColor yellowColor];
				view;
			})];
			view.backgroundColor = [colorArray objectAtIndex:i];
			view;
		})];
	}

//    scrollView.showsHorizontalScrollIndicator = NO;
//    scrollView.showsVerticalScrollIndicator = NO;
	scrollView.pagingEnabled = YES;
	[self.view addSubview:scrollView];

}

/*
 #pragma mark - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
   - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
   }
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
	NSLog(@"scrollViewDidScroll %@",@(scrollView.contentOffset.x));
}

//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
//    NSLog(@"scrollViewWillBeginDragging %@",@(scrollView.contentOffset.x));
//}
//
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    NSLog(@"scrollViewDidEndDecelerating %@",@(scrollView.contentOffset.x));
//}
- (void)viewClick {
    
    NSURL *urlScheme = [NSURL URLWithString:@"testScheme://"];
    
    BOOL canOpenURL = [[UIApplication sharedApplication] canOpenURL:urlScheme];
    
    [[UIApplication sharedApplication] openURL:urlScheme options:nil completionHandler:^(BOOL success) {
            NSLog(@"");
    }];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
	return YES;
}

@end
