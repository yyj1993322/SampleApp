//
//  GTDetailViewController.m
//  SampleApp
//
//  Created by 南继云 on 2021/1/11.
//

#import "GTDetailViewController.h"
#import "GTScreen.h"
#import <WebKit/WebKit.h>

@interface GTDetailViewController ()<WKNavigationDelegate>
@property(nonatomic, strong, readwrite) WKWebView *webView;
@property(nonatomic, strong, readwrite) UIProgressView *progressView;//加载进度条
@property(nonatomic, copy, readwrite) NSString *articleUrl;

@end

@implementation GTDetailViewController

-(instancetype)initWithUrlString:(NSString *)urlString {
	self = [super init];
	if (self) {
		self.articleUrl = urlString;
	}
	return self;
}

- (void)dealloc {
	[self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	[self.view addSubview:({
		self.webView = [[WKWebView alloc] initWithFrame: CGRectMake(0, STATUSBARHEIGHT + 44, self.view.frame.size.width, self.view.frame.size.height - STATUSBARHEIGHT + 44)];
		self.webView.navigationDelegate = self;
		self.webView;
	})];

	[self.view addSubview:({
		self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 65, self.view.bounds.size.width, 15)];
		self.progressView;
	})];

//    [self.webView loadRequest: [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://time.geekbang.org"]]];
	[self.webView loadRequest: [NSURLRequest requestWithURL:[NSURL URLWithString:self.articleUrl]]];
	[self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

/*
 #pragma mark - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
   - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
   }
 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
	decisionHandler(WKNavigationActionPolicyAllow);

}
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
	NSLog(@"");
}

- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context {
	self.progressView.progress = self.webView.estimatedProgress;
}

@end
