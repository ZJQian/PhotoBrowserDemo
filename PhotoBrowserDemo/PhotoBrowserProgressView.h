//
//  PhotoBrowserProgressView.h
//  PhotoBrowserDemo
//
//  Created by ZJQ on 2017/2/8.
//  Copyright © 2017年 ZJQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoBrowserConfig.h"
@interface PhotoBrowserProgressView : UIView


/**
 进度
 */
@property (nonatomic, assign) CGFloat progress;

/**
 进度类型
 */
@property (nonatomic, assign) ProgressViewMode mode;


@end
