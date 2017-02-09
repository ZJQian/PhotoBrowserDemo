//
//  BasePhotoBrowserController.m
//  PhotoBrowserDemo
//
//  Created by ZJQ on 2017/2/8.
//  Copyright © 2017年 ZJQ. All rights reserved.
//



#import "BasePhotoBrowserController.h"
#import "ImageCollectionViewCell.h"
#import "PhotoBrowserConfig.h"

static NSString * const cellID = @"cell";


@interface BasePhotoBrowserController ()<UICollectionViewDelegate,UICollectionViewDataSource>




@end

@implementation BasePhotoBrowserController


- (NSMutableArray *)images {

    if (!_images) {
        _images = [NSMutableArray array];
        for (int i=1; i<7; i++) {
            [_images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%d",i]]];
        }
    }
    return _images;
}

- (NSMutableArray *)imageURLStrings {
    if (!_imageURLStrings) {
        _imageURLStrings = [NSMutableArray arrayWithArray:@[
                                                            @"http://img4.duitang.com/uploads/item/201507/30/20150730163204_A24MX.thumb.700_0.jpeg",
                                                            @"http://t-1.tuzhan.com/64098acae587/c-2/l/2013/09/14/04/c4481aa3564c449f8793a13716419be1.jpg",
                                                            @"http://www.taopic.com/uploads/allimg/110914/8879-110914232H081.jpg",
                                                            @"http://img5.poco.cn/mypoco/myphoto/20080519/13/42623709200805191342213105319974796_011_640.jpg",
                                                            @"http://img4.ph.126.net/8jJ3hDL69RhUuwlnDNfZiw==/188306759436600394.jpg",
                                                            @"http://pet.ktcmemory.com/upload/1/5/4482.jpg"]];
        
    }
    return _imageURLStrings;
}


- (UICollectionView *)collectionView {

    if (!_collectionView) {
    
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake((SCREEN_WIDTH -60)/3, (SCREEN_WIDTH -60)/3);
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 0;
        layout.sectionInset = UIEdgeInsetsMake(10, 15, 10, 15);
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self.view addSubview:self.collectionView];
    [self.collectionView registerClass:[ImageCollectionViewCell class] forCellWithReuseIdentifier:cellID];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.images.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.imageView.image = self.images[indexPath.item];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
