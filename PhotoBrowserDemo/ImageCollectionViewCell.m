//
//  ImageCollectionViewCell.m
//  PhotoBrowserDemo
//
//  Created by ZJQ on 2017/2/8.
//  Copyright © 2017年 ZJQ. All rights reserved.
//

#import "ImageCollectionViewCell.h"

@implementation ImageCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *image = [[UIImageView alloc]initWithFrame:self.contentView.frame];
        [self.contentView addSubview:image];
        self.imageView = image;
    }
    return self;
}


@end
