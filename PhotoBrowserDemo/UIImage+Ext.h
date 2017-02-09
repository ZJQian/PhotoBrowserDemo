//
//  UIImage+Ext.h
//  PhotoBrowserDemo
//
//  Created by ZJQ on 2017/2/8.
//  Copyright © 2017年 ZJQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Ext)


/**
 *  返回一张指定size的指定颜色的纯色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end
