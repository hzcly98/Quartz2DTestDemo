//
//  QCRectView.m
//  Quartz2DTest
//
//  Created by 黄章成 on 2017/8/15.
//  Copyright © 2017年 黄章成. All rights reserved.
//

#import "QCRectView.h"

@implementation QCRectView

- (void)drawRect:(CGRect)rect {
    
    //1.获得图形上下文
     CGContextRef ctx = UIGraphicsGetCurrentContext();

     //2.绘制三角形
     //设置起点
     CGContextMoveToPoint(ctx, self.bounds.size.width / 2 , 5);
     //设置第二个点
     CGContextAddLineToPoint(ctx, 5, self.bounds.size.height - 5);
     //设置第三个点
     CGContextAddLineToPoint(ctx, self.bounds.size.width - 5, self.bounds.size.height - 5);

    CGContextSetLineWidth(ctx, 5);
    
//    CGContextSetRGBStrokeColor(ctx, 1, 0, 0, 1);
//    [[UIColor cyanColor] set];          // 同时设置了实心和空心
    [[UIColor blackColor] setStroke];  // 设置空心
    [[UIColor cyanColor] setFill];    // 设置实心
    
    
//    CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);
    //关闭起点和终点
    CGContextClosePath(ctx);
    
     // 3.渲染图形到layer上 CGContextStrokePath 和 CGContextFillPath 这两种方式不能同时渲染stroke和fill，要想实现同时渲染，需要通过CGContextDrawPath(ctx, kCGPathFillStroke)方式实现！
//     CGContextStrokePath(ctx);
//    CGContextFillPath(ctx);
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
}


@end
