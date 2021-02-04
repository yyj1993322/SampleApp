//
//  GTNewsViewController.m
//  SampleApp
//
//  Created by 南继云 on 2021/1/5.
//

#import "GTNewsViewController.h"
#import "GTNormalTableViewCell.h"
#import "GTDetailViewController.h"
#import "GTDeleteCellView.h"
#import "GTListLoader.h"
#import "GTListItem.h"
#import "GTMediator.h"
#import "GTSearchBar.h"
#import "GTScreen.h"

@interface TestView : UIView

@end

//@implementation TestView
//
//- (instancetype)init{
//    self = [super init];
//    if (self) {
//
//    }
//    return self;
//}
//
//- (void)willMoveToSuperview:(nullable UIView *)newSuperview {
//    [super willMoveToSuperview: newSuperview];
//}
//- (void)didMoveToSuperview {
//    [super didMoveToSuperview];
//
//}
//- (void)willMoveToWindow:(nullable UIWindow *)newWindow {
//    [super willMoveToWindow: newWindow];
//
//}
//- (void)didMoveToWindow {
//    [super didMoveToWindow];
//
//}
//@end

@interface GTNewsViewController ()<UITableViewDataSource,UITableViewDelegate,GTNormalTableViewCellDelegate>
@property(nonatomic, strong, readwrite) UITableView *tableView;
@property(nonatomic, strong, readwrite) NSArray *dataArray;
@property(nonatomic, strong, readwrite) GTListLoader *listLoader;
@end

@implementation GTNewsViewController

#pragma mark - lefe cycle

-(instancetype)init {
	self = [super init];
	if (self) {
//		_dataArray = @[].mutableCopy;
//		for (int i = 0; i<20; i++) {
//			[_dataArray addObject:@(i)];
//		}
        self.tabBarItem.title = @"新闻";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/page@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/page_selected@2x.png"];

	}
	return self;
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
    self.navigationController.navigationBar.backgroundColor = [UIColor redColor];
    [self.tabBarController.navigationItem setTitleView:({
        GTSearchBar *searchBar = [[GTSearchBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - UI(20), self.navigationController.navigationBar.bounds.size.height)];
        searchBar;
    })];
}
- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
}    // Called when the view has been fully transitioned onto the screen. Default does nothing
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
} // Called when the view is dismissed, covered or otherwise hidden. Default does nothing
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}


- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
//    self.view.backgroundColor = [UIColor whiteColor];
	// Do any additional setup after loading the view.
//    [self.view addSubview:({
//            UILabel *lable = [[UILabel alloc] init];
//            lable.text = @"hello world";
//            [lable sizeToFit];
//            lable.center = CGPointMake(self.view.frame.size.width /2 , self.view.frame.size.height/2);
//            lable;
//    })];
//    self.view.backgroundColor = [UIColor whiteColor];
//    TestView *view2 = [[TestView alloc] init];
//    view2.backgroundColor = [UIColor greenColor];
//    view2.frame = CGRectMake(150, 150, 100, 100);
//    [self.view addSubview: view2];

//    UIView *view = [[UIView alloc] init];
//    view.backgroundColor = [UIColor redColor];
//    view.frame = CGRectMake(100, 100, 100, 100);
//    [self.view addSubview: view];
	//新建手势
//    UITapGestureRecognizer *tapGestuew = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushController)];
//    [view2 addGestureRecognizer:tapGestuew];


	_tableView = [[UITableView alloc] initWithFrame: self.view.bounds];
	_tableView.dataSource = self;
	_tableView.delegate = self;
	[self.view addSubview:_tableView];
	__weak typeof(self) wself = self;
	self.listLoader = [[GTListLoader alloc] init];
	[self.listLoader loadListDataWithFinishBlock:^(BOOL success, NSArray<GTListItem *> * _Nonnull dataArray) {
	         __strong typeof(wself) strongSelf = wself;
	         strongSelf.dataArray = dataArray;
	         [strongSelf.tableView reloadData];
	         NSLog(@"");
	 }];
}

//- (void)pushController{
//    UIViewController *viewController = [[UIViewController alloc] init];
//    viewController.view.backgroundColor = [UIColor whiteColor];
//    viewController.navigationItem.title = @"内容";
//    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"右侧标题" style:UIBarButtonItemStylePlain target:self action:nil];
//    [self.navigationController pushViewController:viewController  animated: YES];
//
//}

#pragma mark - UITableVIewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
//    if(!cell){
//        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
//    }
//
//    cell.textLabel.text = [NSString stringWithFormat: @"主标题 -%@",@(indexPath.row)];
//    cell.detailTextLabel.text = @"副标题";
//    cell.imageView.image = [UIImage systemImageNamed:@"play"];
	GTNormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
	if(!cell) {
		cell = [[GTNormalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
		cell.delegate = self;

	}
	[cell layoutTableViewCellWithItem:[_dataArray objectAtIndex:indexPath.row]];
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	GTListItem *item = [self.dataArray objectAtIndex:indexPath.row];
//    __kindof UIViewController *detailController = [GTMediator detailViewCOntrollerWithUrl:item.articleUrl];
//    detailController.view.backgroundColor = [UIColor whiteColor];
//	detailController.title = [NSString stringWithFormat:@"%@", @(indexPath.row)];
//    detailController.title = item.title;
//	[self.navigationController pushViewController:detailController animated:YES];
//    [GTMediator openUrl:@"detail://" params:@{@"url":item.articleUrl,@"controller":self.navigationController}];

	Class cls = [GTMediator classForProtol:@protocol(GTDetailViewControllerProtocol)];
//    [[cls alloc] detailViewControllerWithUrl: item.articleUrl];
	[self.navigationController pushViewController:[[cls alloc] detailViewControllerWithUrl: item.articleUrl] animated:YES];

	[[NSUserDefaults standardUserDefaults] setBool:YES forKey:item.uniquekey];
}

-(void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton {
//	GTDeleteCellView *deleteView = [[GTDeleteCellView alloc] initWithFrame:self.view.bounds];
//	CGRect rect = [tableViewCell convertRect:deleteButton.frame toView:nil];
//	__weak typeof(self) wself = self;//处理循环引用
//	[deleteView showDeleteView:rect.origin clickBlock:^{
//	         __strong typeof(wself) strongSelf = wself;
//	         [strongSelf.dataArray removeLastObject];
//	         [strongSelf.tableView deleteRowsAtIndexPaths:@[[strongSelf.tableView indexPathForCell:tableViewCell]] withRowAnimation:UITableViewRowAnimationAutomatic];
//	 }];
}


@end


