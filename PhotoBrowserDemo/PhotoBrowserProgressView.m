//
//  PhotoBrowserProgressView.m
//  PhotoBrowserDemo
//
//  Created by ZJQ on 2017/2/8.
//  Copyright © 2017年 ZJQ. All rights reserved.
//

#import "PhotoBrowserProgressView.h"

@implementation PhotoBrowserProgressView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = ProgressViewBackgroundColor;
        self.layer.cornerRadius = 5;
        self.clipsToBounds = YES;
        self.mode = ProgressViewProgressMode;
    }
    return self;
}

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    [self setNeedsDisplay];
    if (progress >= 1) {
        [self removeFromSuperview];
    }
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat xCenter = rect.size.width * 0.5;
    CGFloat yCenter = rect.size.height * 0.5;
    [self.backgroundColor setFill];
    [ProgressViewStrokeColor setStroke];
    
    switch (self.mode) {
        case ProgressViewModePieDiagram:
        {
            CGFloat radius = MIN(rect.size.width * 0.5, rect.size.height * 0.5) - ProgressViewItemMargin;
            
            CGFloat w = radius * 2 + ProgressViewItemMargin;
            CGFloat h = w;
            CGFloat x = (rect.size.width - w) * 0.5;
            CGFloat y = (rect.size.height - h) * 0.5;
            CGContextAddEllipseInRect(ctx, CGRectMake(x, y, w, h));
            CGContextSetLineWidth(ctx, ProgressViewLoopDiagramLineWidth * 0.5);
            CGContextStrokePath(ctx);
            
            [ProgressViewStrokeColor setFill];
            CGContextMoveToPoint(ctx, xCenter, yCenter);
            CGContextAddLineToPoint(ctx, xCenter, 0);
            CGFloat to = - M_PI * 0.5 + self.progress * M_PI * 2 + 0.001; // 初始值
            CGContextAddArc(ctx, xCenter, yCenter, radius, - M_PI * 0.5, to, 0);
            CGContextClosePath(ctx);
            CGContextFillPath(ctx);
        }
            break;
            
        default:
        {
            CGContextSetLineWidth(ctx, ProgressViewLoopDiagramLineWidth);
            CGContextSetLineCap(ctx, kCGLineCapRound);
            [ProgressViewStrokeColor setStroke];
            CGFloat to = - M_PI * 0.5 + self.progress * M_PI * 2 + 0.05; // 初始值0.05
            CGFloat radius = MIN(rect.size.width, rect.size.height) * 0.5 - ProgressViewItemMargin;
            CGContextAddArc(ctx, xCenter, yCenter, radius, - M_PI * 0.5, to, 0);
            CGContextStrokePath(ctx);
        }
            break;
    }
}


@end
