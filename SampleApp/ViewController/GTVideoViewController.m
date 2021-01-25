//
//  GTVideoViewController.m
//  SampleApp
//
//  Created by 南继云 on 2021/1/7.
//

#import "GTVideoViewController.h"
#import "GTVideoCoverView.h"
#import "GTVideoToolbar.h"

@interface GTVideoViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation GTVideoViewController

-(instancetype) init{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"视频";
        self.tabBarItem.image = [UIImage systemImageNamed:@"play"];
        self.tabBarItem.selectedImage = [UIImage systemImageNamed:@"stop"];
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.minimumLineSpacing = 10;
//    flowLayout.itemSize = CGSizeMake((self.view.frame.size.width - 10)/2, 300);
    flowLayout.itemSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.width / 16 * 9 + GTVideoToolbarHeight);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout: flowLayout];
    collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [collectionView registerClass:[GTVideoCoverView class] forCellWithReuseIdentifier:@"GTVideoCoverView"];
    
    [self.view addSubview:collectionView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GTVideoCoverView" forIndexPath:indexPath];
    if ([cell isKindOfClass:[GTVideoCoverView class]]) {
        [((GTVideoCoverView *)cell) layoutWithVideoCoverUrl:@"awm" videoUrl:@"http://vfx.mtime.cn/Video/2019/03/18/mp4/190318231014076505.mp4"];
    }
    return cell;
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.item % 3 == 0) {
//        return CGSizeMake(self.view.frame.size.width, 100);
//    }else {
//        return CGSizeMake((self.view.frame.size.width - 10)/2, 300);
//    }
//}


@end
