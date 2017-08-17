//
//  QCImageClipView.m
//  Quartz2DTest
//
//  Created by 黄章成 on 2017/8/15.
//  Copyright © 2017年 黄章成. All rights reserved.
//

#import "QCImageClipView.h"

@implementation QCImageClipView

- (void)drawRect:(CGRect)rect {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 指定上下文中可以显示内容的范围(在绘图前先指定)
    // 显示范围是一个圆形
    CGContextAddEllipseInRect(ctx, CGRectMake(self.bounds.size.width / 2 - 25,self.bounds.size.height / 2 - 25, 50, 50));
    
    // 显示范围是一个三角形
//    CGContextMoveToPoint(ctx, self.bounds.size.width / 2, self.bounds.size.height / 2 - 25);
//    CGContextAddLineToPoint(ctx, self.bounds.size.width / 2 - 22, self.bounds.size.height / 2 + 20);
//    CGContextAddLineToPoint(ctx, self.bounds.size.width / 2, self.bounds.size.height / 2 + 20);
//    CGContextClosePath(ctx);
    
    CGContextClip(ctx);
    
    UIImage *image = [UIImage imageNamed:@"file_p"];
    
    [image drawAtPoint:CGPointMake(self.bounds.size.width / 2 - image.size.width / 2, self.bounds.size.height / 2 - image.size.height / 2)];
//    [image drawAsPatternInRect:self.bounds];
    
}


@end
