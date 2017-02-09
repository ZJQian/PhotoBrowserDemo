//
//  PhotoBrowserConfig.h
//  PhotoBrowserDemo
//
//  Created by ZJQ on 2017/2/8.
//  Copyright © 2017年 ZJQ. All rights reserved.
//

#ifndef PhotoBrowserConfig_h
#define PhotoBrowserConfig_h



#define PhotoBrowserDebug 1
//是否开启断言调试模式
#define IsOpenAssertDebug 1


typedef enum : NSUInteger {
    
    ProgressViewModeLoopDiagram = 1,//圆环形
    
    ProgressViewModePieDiagram = 2//圆饼形
    
} ProgressViewMode;



#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height


// browser背景颜色
#define PhotoBrowserBackgrounColor [UIColor colorWithRed:0 green:0 blue:0 alpha:0.95]
// browser 图片间的margin
#define PhotoBrowserImageViewMargin 10
// browser中显示图片动画时长
#define PhotoBrowserShowImageAnimationDuration 0.4f
// browser中显示图片动画时长
#define PhotoBrowserHideImageAnimationDuration 0.4f




// 图片下载进度指示进度显示样式（ProgressViewModeLoopDiagram 环形，ProgressViewModePieDiagram 饼型）
#define ProgressViewProgressMode ProgressViewModeLoopDiagram
// 图片下载进度指示器背景色
#define ProgressViewBackgroundColor [UIColor clearColor]
// 图片下载进度指示器圆环/圆饼颜色
#define ProgressViewStrokeColor [UIColor whiteColor]
// 图片下载进度指示器内部控件间的间距
#define ProgressViewItemMargin 10
// 圆环形图片下载进度指示器 环线宽度
#define ProgressViewLoopDiagramLineWidth 8


// 图片保存成功提示文字
#define PhotoBrowserSaveImageSuccessText @" ^_^ 保存成功 ";
// 图片保存失败提示文字
#define PhotoBrowserSaveImageFailText @" >_< 保存失败 ";
// 网络图片加载失败的提示文字
#define PhotoBrowserLoadNetworkImageFail @">_< 图片加载失败"
#define PhotoBrowserLoadingImageText @" >_< 图片加载中,请稍后 ";

//开发的时候打印，但是发布的时候不打印的NSLog
#ifdef DEBUG
#define NSLog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define NSLog(...)
#endif


#endif /* PhotoBrowserConfig_h */
