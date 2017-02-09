//
//  WxStylePhotoBrowserController.m
//  PhotoBrowserDemo
//
//  Created by ZJQ on 2017/2/8.
//  Copyright © 2017年 ZJQ. All rights reserved.
//

#import "WxStylePhotoBrowserController.h"
#import "PhotoBrowser.h"
@interface WxStylePhotoBrowserController ()<PhotoBrowserDelegate,PhotoBrowserDataSource>

@end

@implementation WxStylePhotoBrowserController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    // 快速创建并进入浏览模式
    PhotoBrowser *browser = [PhotoBrowser showPhotoBrowserWithCurrentImageIndex:indexPath.item imageCount:self.images.count datasource:self];
    
    // 设置长按手势弹出的地步ActionSheet数据,不实现此方法则没有长按手势
    [browser setActionSheetWithTitle:@"这是一个类似微信/微博的图片浏览器组件" delegate:self cancelButtonTitle:nil deleteButtonTitle:@"删除" otherButtonTitles:@"发送给朋友",@"保存图片",@"收藏",@"投诉",nil];
    
    // 自定义pageControl的一些属性
    browser.otherPageControlColor = [UIColor purpleColor]; ///< 此属性针对动画样式的pagecontrol无效
    browser.currentPageControlColor = [UIColor greenColor];
    browser.pageControlStyle = PageControlStyleClassic;///< 修改底部pagecontrol的样式为系统样式,默认是弹性动画的样式

}

- (UIImage *)photoBrowser:(PhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index {

    return self.images[index];
}

- (UIView *)photoBrowser:(PhotoBrowser *)browser sourceImageViewForIndex:(NSInteger)index {

    return self.collectionView.visibleCells[index];
}

- (void)photoBrowser:(PhotoBrowser *)photoBrowser clickedActionSheetIndex:(NSInteger)actionSheetIndex currentImageIndex:(NSInteger)currentImageIndex {

    switch (actionSheetIndex) {
        case 1://保存
        {
            [photoBrowser saveCurrentImage];
        }
            break;
            
        default:
            break;
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
