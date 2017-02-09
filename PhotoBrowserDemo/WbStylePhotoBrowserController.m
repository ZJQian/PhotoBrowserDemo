//
//  WbStylePhotoBrowserController.m
//  PhotoBrowserDemo
//
//  Created by ZJQ on 2017/2/8.
//  Copyright © 2017年 ZJQ. All rights reserved.
//

#import "WbStylePhotoBrowserController.h"
#import "PhotoBrowser.h"
@interface WbStylePhotoBrowserController ()<PhotoBrowserDataSource>

@end

@implementation WbStylePhotoBrowserController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    PhotoBrowser *photoBrowser = [PhotoBrowser showPhotoBrowserWithCurrentImageIndex:indexPath.item imageCount:self.images.count datasource:self];
    
    photoBrowser.browserStyle = PhotoBrowserStyleIndexLabel;

}
- (UIImage *)photoBrowser:(PhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index {
    
    return self.images[index];
}

- (UIView *)photoBrowser:(PhotoBrowser *)browser sourceImageViewForIndex:(NSInteger)index {
    
    return self.collectionView.visibleCells[index];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
