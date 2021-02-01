//
//  SceneDelegate.m
//  SampleApp
//
//  Created by 南继云 on 2021/1/5.
//

#import "SceneDelegate.h"
#import "GTNewsViewController.h"
#import "GTVideoViewController.h"
#import "GTRecommendViewController.h"
#import "GTSplashView.h"
#import "GTMineViewController.h"
#import "GTLocation.h"
#import "GTNotifiaction.h"

@interface SceneDelegate ()<UITabBarControllerDelegate>

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
	// Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
	// If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
	// This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

	self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
	UITabBarController *tabbarController = [[UITabBarController alloc] init];


	GTNewsViewController *newsViewController = [[GTNewsViewController alloc] init];


//	newsViewController.tabBarItem.title = @"新闻";
//	newsViewController.tabBarItem.image = [UIImage systemImageNamed:@"play"];
//	newsViewController.tabBarItem.selectedImage = [UIImage systemImageNamed:@"stop"];

//    UIViewController *controller1 = [[UIViewController alloc] init];
//    controller1.view.backgroundColor = [UIColor redColor];
//    controller1.tabBarItem.title = @"新闻";
//    controller1.tabBarItem.image = [UIImage systemImageNamed: @"bookmarks"];

//    UIViewController *controller2 = [[UIViewController alloc] init];
//    controller2.view.backgroundColor = [UIColor yellowColor];
//    controller2.tabBarItem.title = @"视频";
//    controller2.tabBarItem.image = [UIImage systemImageNamed: @"play"];

	GTVideoViewController *videoController = [[GTVideoViewController alloc] init];


//    UIViewController *controller3 = [[UIViewController alloc] init];
//    controller3.view.backgroundColor = [UIColor greenColor];
//    controller3.tabBarItem.title = @"推荐";
//    controller3.tabBarItem.image = [UIImage systemImageNamed: @"stop"];

	GTRecommendViewController *recommendView = [[GTRecommendViewController alloc] init];
//    recommendView.view.backgroundColor = [UIColor greenColor];
//    recommendView.tabBarItem.title = @"推荐";
//    recommendView.tabBarItem.image = [UIImage systemImageNamed:@"play"];
//    recommendView.tabBarItem.selectedImage = [UIImage systemImageNamed:@"stop"];


    GTMineViewController *mineController = [[GTMineViewController alloc] init];
//	mineController.view.backgroundColor = [UIColor lightGrayColor];
//	mineController.tabBarItem.title = @"我的";
//	mineController.tabBarItem.image = [UIImage systemImageNamed: @"home"];


	[tabbarController setViewControllers: @[newsViewController,videoController,recommendView,mineController]];
	tabbarController.delegate = self;
	UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController: tabbarController];

	// MainTabBarController 是 CYLTabBarController 的子类
	self.window.rootViewController = navigationController;
	[self.window makeKeyAndVisible];
//    [self.window addSubview: ({
//        GTSplashView *splashView = [[GTSplashView alloc] initWithFrame:self.window.bounds];
//        splashView;
//    })];
    [[GTLocation locationManager] checkLocationAutherization];
    [[GTNotifiaction manager] checkNotifiactionAutherization];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
	NSLog(@"did select");
}


- (void)sceneDidDisconnect:(UIScene *)scene {
	// Called as the scene is being released by the system.
	// This occurs shortly after the scene enters the background, or when its session is discarded.
	// Release any resources associated with this scene that can be re-created the next time the scene connects.
	// The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
	// Called when the scene has moved from an inactive state to an active state.
	// Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
	// Called when the scene will move from an active state to an inactive state.
	// This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
	// Called as the scene transitions from the background to the foreground.
	// Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
	// Called as the scene transitions from the foreground to the background.
	// Use this method to save data, release shared resources, and store enough scene-specific state information
	// to restore the scene back to its current state.
}


@end
