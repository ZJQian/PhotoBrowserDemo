//
//  ZoomingScrollView.h
//  PhotoBrowserDemo
//
//  Created by ZJQ on 2017/2/8.
//  Copyright © 2017年 ZJQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZoomingScrollView;
@protocol ZoomingScrollViewDelegate <NSObject>


/**
 单击图像是调用

 @param zoomingScrollView 图片缩放视图
 @param singleTap 用户单击的UITouch对象
 */
- (void)zoomingScrollView:(ZoomingScrollView *)zoomingScrollView singleTapDetected:(UITapGestureRecognizer *)singleTap;


/**
 图片加载进度

 @param zoomingScrollView 图片缩放视图
 @param progress 加载进度
 */
- (void)zoomingScrollView:(ZoomingScrollView *)zoomingScrollView imageLoadProgress:(CGFloat)progress;

@end

@interface ZoomingScrollView : UIScrollView


/**
 ZoomingScrollViewDelegate,要和UIScrollView的delegate区分开
 */
@property (nonatomic, assign)id<ZoomingScrollViewDelegate>zoomingScrollViewdelegate;

/**
 图片加载进度
 */
@property (nonatomic, assign) CGFloat progress;

/**
 是否已经加载过图片
 */
@property (nonatomic, assign) BOOL hasLoadImage;

/**
 展示的图片
 */
@property (nonatomic, strong, readonly) UIImage *currentImage;

/**
 展示图片的imageView视图，回缩的动画
 */
@property (nonatomic, strong, readonly) UIImageView *imageView;



/**
 显示图片

 @param url 图片的高清url地址
 @param placeholderImage 占位图
 */
- (void)setShowHighQualityImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholderImage;

/**
 显示图片

 @param image 图片
 */
- (void)setShowImage:(UIImage *)image;

/**
 调整尺寸
 */
- (void)setMaxAndMinZoomScales;

/**
 重用，清理资源
 */
- (void)prepareForReuse;

@end
