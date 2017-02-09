//
//  PhotoBrowser.h
//  PhotoBrowserDemo
//
//  Created by ZJQ on 2017/2/8.
//  Copyright © 2017年 ZJQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

/**
 浏览器的样式
 */
typedef NS_ENUM(NSUInteger, PhotoBrowserStyle){

    
    PhotoBrowserStylePageControl = 1,/**长按图片弹出组件，底部有pageControl*/
    
    PhotoBrowserStyleIndexLabel = 2,/**长按图片弹出组件，顶部有索引label*/
    
    PhotoBrowserStyleSimple = 3/**没有功能组件，顶部有索引label，底部有保存按钮*/
};


/**
 pageControl 的位置
 */
typedef NS_ENUM(NSUInteger,PhotoBrowserPageControlAliment){

    PhotoBrowserPageControlAlimentRight = 1,/**在右边*/
    
    PhotoBrowserPageControlAlimentCenter = 2/**在中间*/

};


/**
 pageControl的样式
 */
typedef NS_ENUM(NSUInteger, PageControlStyle) {
    
    PageControlStyleClassic = 1,/**经典样式，系统自带*/
    
    PageControlStyleAnimation = 2,/**带动画效果的pageControl*/
    
    PageControlStyleNone/**不显示pageControl*/
};


@class PhotoBrowser;
@protocol PhotoBrowserDelegate <NSObject>

@optional


/**
 点击底部的功能组件的回调

 @param photoBrowser 浏览器
 @param actionSheetIndex 底部组件的索引
 @param currentImageIndex 当前图片的索引
 */
- (void)photoBrowser:(PhotoBrowser *)photoBrowser clickedActionSheetIndex:(NSInteger)actionSheetIndex currentImageIndex:(NSInteger)currentImageIndex;

@end

@protocol PhotoBrowserDataSource <NSObject>

@optional


/**
 返回这个位置的占位图片，也可以是原图(如果不实现此方法,会默认使用placeholderImage)

 @param browser 浏览器
 @param index 位置索引
 @return <#return value description#>
 */
- (UIImage *)photoBrowser:(PhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index;

/**
 返回指定位置的高清图片URL

 @param browser 浏览器
 @param index 位置索引
 @return <#return value description#>
 */
- (NSURL *)photoBrowser:(PhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index;

/**
 返回指定位置的ALAsset对象，从其中获取图片

 @param browser 浏览器
 @param index 位置索引
 @return <#return value description#>
 */
- (ALAsset *)photoBrowser:(PhotoBrowser *)browser assetForIndex:(NSInteger)index;

/**
 返回指定位置图片的UIImageView,用于做图片浏览器弹出放大和消失回缩动画等
 如果没有实现这个方法,没有回缩动画,如果传过来的view不正确,可能会影响回缩动画

 @param browser 浏览器
 @param index 位置索引
 @return <#return value description#>
 */
- (UIImageView *)photoBrowser:(PhotoBrowser *)browser sourceImageViewForIndex:(NSInteger)index;

@end
@interface PhotoBrowser : UIView


/**
 用户点击的图片视图,用于做图片浏览器弹出的放大动画,不给次属性赋值会通过代理方法photoBrowser: sourceImageViewForIndex:尝试获取,如果还是获取不到则没有弹出放大动画
 */
@property (nonatomic, strong) UIView *sourceImageView;

/**
 当前显示的图片的位置索引，默认值是0
 */
@property (nonatomic, assign)NSInteger currentImageIndex;

/**
 图片数量，大于0
 */
@property (nonatomic, assign)NSInteger imageCount;

/**
 浏览器样式
 */
@property (nonatomic, assign)PhotoBrowserStyle browserStyle;

/**
 delegate
 */
@property (nonatomic, assign)id<PhotoBrowserDelegate>delegate;

/**
 dataSource
 */
@property (nonatomic, assign)id<PhotoBrowserDataSource>dataSource;

/**
 占位图片,可选(默认是一张灰色的100*100像素图片)
 当没有实现数据源中placeholderImageForIndex方法时,默认会使用这个占位图片
 */
@property(nonatomic, strong) UIImage *placeholderImage;


/**
 是否显示分页控件，默认是YES
 */
@property (nonatomic, assign) BOOL showPageControl;

/**
 是否在只有一张图时隐藏PageControl，默认是YES
 */
@property (nonatomic, assign) BOOL hidePageControlOnSingleImage;

/**
 pageControl 样式，默认是PageControlStyleAnimation
 */
@property (nonatomic, assign)PageControlStyle pageControlStyle;

/**
 pageControl 位置，默认是PhotoBrowserPageControlAlimentCenter
 */
@property (nonatomic, assign)PhotoBrowserPageControlAliment pageControlAliment;

/**
 当前pageControl的图标颜色
 */
@property (nonatomic, strong) UIColor *currentPageControlColor;

/**
 其他pageControl的图标颜色
 */
@property (nonatomic, strong) UIColor *otherPageControlColor;

/**
 当前pageControl的图标图片
 */
@property (nonatomic, strong) UIImage *currentPageControlImage;

/**
 其他pageControl的图标图片
 */
@property (nonatomic, strong) UIImage *otherPageControlImage;



/**
 快速创建并进入图片浏览器，同时传入数据源

 @param currentImageIndex 展示的图片索引
 @param imageCount 图片数量
 @param datasource 数据源
 @return <#return value description#>
 */
+ (instancetype)showPhotoBrowserWithCurrentImageIndex:(NSInteger)currentImageIndex imageCount:(NSUInteger)imageCount datasource:(id<PhotoBrowserDataSource>)datasource;


/**
 简单场景下的图片浏览器

 @param images 图片数组(数组内部可以是UIImage/NSURL网络图片地址/ALAsset,但只能是其中一种)
 @param currentImageIndex 展示的图片索引
 @return <#return value description#>
 */
+ (instancetype)showPhotoBrowserWithImages:(NSArray *)images currentImageIndex:(NSInteger)currentImageIndex;

/**
 创建底部组件

 @param title 标题
 @param delegate 代理
 @param cancelButtonTitle 取消按钮
 @param deleteButtonTitle 删除按钮
 @param otherButtonTitle 其他按钮
 */
- (void)setActionSheetWithTitle:(NSString *)title delegate:(id<PhotoBrowserDelegate>)delegate cancelButtonTitle:(NSString *)cancelButtonTitle deleteButtonTitle:( NSString *)deleteButtonTitle otherButtonTitles:( NSString *)otherButtonTitle, ... NS_REQUIRES_NIL_TERMINATION;
/**
 保存当前图片
 */
- (void)saveCurrentImage;

/**
 展示图片
 */
- (void)show;

/**
 退出展示
 */
- (void)dismiss;

@end
