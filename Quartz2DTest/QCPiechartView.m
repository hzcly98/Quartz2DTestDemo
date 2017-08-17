
//
//  QCPiechartView.m
//  Quartz2DTest
//
//  Created by 黄章成 on 2017/8/15.
//  Copyright © 2017年 黄章成. All rights reserved.
//

#import "QCPiechartView.h"

@implementation QCPiechartView

- (void)drawRect:(CGRect)rect {
    
    CGFloat radio = MIN(self.bounds.size.width, self.bounds.size.height) / 2 - 5;
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(ctx, self.bounds.size.width / 2 - radio, self.bounds.size.height / 2);
    
    CGContextAddLineToPoint(ctx, self.bounds.size.width / 2, self.bounds.size.height / 2);
    
    CGContextAddLineToPoint(ctx, self.bounds.size.width / 2, self.bounds.size.height / 2 + radio);
    
    CGContextAddArc(ctx, self.bounds.size.width / 2, self.bounds.size.height / 2, radio, M_PI_2, M_PI, 0);
    
//    CGContextStrokePath(ctx);
    
    CGContextFillPath(ctx);
    
}


@end
