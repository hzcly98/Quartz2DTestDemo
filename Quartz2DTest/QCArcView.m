
//
//  QCArcView.m
//  Quartz2DTest
//
//  Created by 黄章成 on 2017/8/15.
//  Copyright © 2017年 黄章成. All rights reserved.
//

#import "QCArcView.h"

@implementation QCArcView

- (void)drawRect:(CGRect)rect {
    
    CGFloat radio = MIN(self.bounds.size.width, self.bounds.size.height) / 2 - 5;
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 画 圆/圆弧 的方式，通过控制角度去控制是圆还是圆弧
    CGContextAddArc(ctx, self.bounds.size.width / 2, self.bounds.size.height / 2, radio, 0, M_PI_2, 0);
    
    CGContextClosePath(ctx);
    
    [[UIColor blueColor] set]; // 颜色到底是fill还是stroke取决于后面画上去的时候是fill还是stork
    
    CGContextStrokePath(ctx);
    
//    CGContextFillPath(ctx);
    
    
    // 另一种画 圆/椭圆 的方式，取决于后面rect是正方形还是长方形
    CGContextAddEllipseInRect(ctx, CGRectMake(self.bounds.size.width / 2 - 25, self.bounds.size.height / 2 - 25, 50, 50));
    
    CGContextFillPath(ctx);
    
}


@end
