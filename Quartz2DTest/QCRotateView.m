//
//  QCRotateView.m
//  Quartz2DTest
//
//  Created by 黄章成 on 2017/8/15.
//  Copyright © 2017年 黄章成. All rights reserved.
//

#import "QCRotateView.h"

@implementation QCRotateView

- (void)drawRect:(CGRect)rect {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //矩阵操作
    //注意点：设置矩阵操作必须要在添加绘图信息之前
    //提示：旋转的时候，是整个layer都旋转了
    CGContextRotateCTM(ctx, M_PI_4 / 2);
    
    CGContextAddRect(ctx, CGRectMake(self.bounds.size.width / 2 - 25, self.bounds.size.height / 2 - 25, 50, 50));
    
    CGContextStrokePath(ctx);
    
    CGContextAddEllipseInRect(ctx, CGRectMake(self.bounds.size.width / 2 - 25, self.bounds.size.height / 2 + 25, 50, 50));
    
    CGContextStrokePath(ctx);
    
}


@end
