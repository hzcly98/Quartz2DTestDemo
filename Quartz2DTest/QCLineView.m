//
//  QCLineView.m
//  Quartz2DTest
//
//  Created by 黄章成 on 2017/8/15.
//  Copyright © 2017年 黄章成. All rights reserved.
//

#import "QCLineView.h"

@implementation QCLineView

- (void)drawRect:(CGRect)rect {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(ctx);   // 保存一份默认的绘图样式
    
    CGContextMoveToPoint(ctx, 5, 5);
    
    CGContextAddLineToPoint(ctx, self.bounds.size.width - 5, self.bounds.size.height - 5);
    
    CGContextSetRGBStrokeColor(ctx, 1, 0, 0, 1); //  [[UIColor cyanColor] set]; 这种方式设置也行
    
    CGContextSetLineWidth(ctx, 4);
    
    CGContextSetLineCap(ctx, kCGLineCapRound);
    
    CGContextStrokePath(ctx); //    CGContextFillPath(ctx);    //注意线条不能渲染为实心的
    
    
    CGContextRestoreGState(ctx); // 启用一开始保存的绘图样式
    
    CGContextMoveToPoint(ctx, 5, self.bounds.size.height - 5);
    
    CGContextAddLineToPoint(ctx, self.bounds.size.width - 5, 5);
    
//    CGContextSetRGBStrokeColor(ctx, 0.5, 1, 0.5, 1);
    
//    CGContextSetLineWidth(ctx, 4);
    
//    CGContextSetLineCap(ctx, kCGLineCapButt);
    
    CGContextStrokePath(ctx);
    
    
//    CGContextRestoreGState(ctx);  // 这里不能再调用一次，保存和开启应该一一对应（实际上由于上面画第二线的时候已经恢复到默认的样式了，所以这里画第三根线时也是默认的样式）
    
    CGContextMoveToPoint(ctx, 5, self.bounds.size.height - 5);
    
    CGContextAddLineToPoint(ctx, self.bounds.size.width - 5, 55);
    
    CGContextStrokePath(ctx);
    
}


@end
