//
//  QCPathView.m
//  Quartz2DTest
//
//  Created by 黄章成 on 2017/8/16.
//  Copyright © 2017年 黄章成. All rights reserved.
//

#import "QCPathView.h"

@implementation QCPathView

- (void)drawRect:(CGRect)rect {
    
    // 取出上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 创建一条路径用来画直线
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, 5, 5);
    
    CGPathAddLineToPoint(path, NULL, 150,150);
    
    // 把直线了路径添加到上下文中
    CGContextAddPath(ctx, path);
    
    // 创建另一条路径用来画圆
    CGMutablePathRef path1 = CGPathCreateMutable();
    
    CGPathAddArc(path1, NULL, 100, 100, 40, 0, M_PI * 3 / 2, 0);
    
    // 把圆的路径添加到上下文中
    CGContextAddPath(ctx, path1);
    
    // 渲染
    CGContextStrokePath(ctx);
    
    
    // 释放之前创建的两条路径
    CGPathRelease(path);
    CGPathRelease(path1);   // 另一种释放方法：CFRelease(path);
    
}


@end
