//
//  BasePhotoBrowserController.h
//  PhotoBrowserDemo
//
//  Created by ZJQ on 2017/2/8.
//  Copyright © 2017年 ZJQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasePhotoBrowserController : UIViewController


/**
 collectionView
 */
@property (nonatomic, strong) UICollectionView *collectionView;

/**
 图片数组
 */
@property (nonatomic, strong) NSMutableArray *images;

/**
 图片URL数组
 */
@property (nonatomic, strong) NSMutableArray *imageURLStrings;

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end
