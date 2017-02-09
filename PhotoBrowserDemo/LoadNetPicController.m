//
//  LoadNetPicController.m
//  PhotoBrowserDemo
//
//  Created by ZJQ on 2017/2/8.
//  Copyright © 2017年 ZJQ. All rights reserved.
//

#import "LoadNetPicController.h"
#import "PhotoBrowser.h"
#import "SDImageCache.h"
@interface LoadNetPicController ()<PhotoBrowserDataSource>

@end

@implementation LoadNetPicController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *rightBtnItem = [[UIBarButtonItem alloc]initWithTitle:@"cleanCache" style:UIBarButtonItemStylePlain target:self action:@selector(cleanCacheClicked)];
    self.navigationItem.rightBarButtonItem = rightBtnItem;
}


- (void)cleanCacheClicked {

    [[SDImageCache sharedImageCache] clearDisk];
    [[SDImageCache sharedImageCache] clearMemory];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

   [PhotoBrowser showPhotoBrowserWithCurrentImageIndex:indexPath.item imageCount:self.images.count datasource:self];
}

- (UIImage *)photoBrowser:(PhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index {
    
    return self.images[index];
}

- (UIView *)photoBrowser:(PhotoBrowser *)browser sourceImageViewForIndex:(NSInteger)index {

    return self.collectionView.visibleCells[index];
}

- (NSURL *)photoBrowser:(PhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index {

    return self.imageURLStrings[index];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
