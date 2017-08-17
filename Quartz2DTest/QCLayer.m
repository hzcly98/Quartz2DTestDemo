//
//  QCLayer.m
//  Quartz2DTest
//
//  Created by 黄章成 on 2017/8/16.
//  Copyright © 2017年 黄章成. All rights reserved.
//

#import "QCLayer.h"

@implementation QCLayer

- (void)drawInContext:(CGContextRef)ctx {
   
    CGContextAddEllipseInRect(ctx, CGRectMake(10, 10, 50, 50));
    
    CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);
    
    CGContextFillPath(ctx);
    
}

@end
