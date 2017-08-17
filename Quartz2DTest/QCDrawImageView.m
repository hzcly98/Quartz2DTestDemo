//
//  QCImageClipView.m
//  Quartz2DTest
//
//  Created by 黄章成 on 2017/8/15.
//  Copyright © 2017年 黄章成. All rights reserved.
//

#import "QCDrawImageView.h"

@implementation QCDrawImageView

- (void)drawRect:(CGRect)rect {
    
    UIImage *image = [UIImage imageNamed:@"BILIBILI_LOGO"];
    
    // 1.平铺的方式
    [image drawAsPatternInRect:self.bounds];
    
    // 2.拉伸方式
//    [image drawInRect:self.bounds];
    
    // 3.定点方式（保存图片大小,这个定点是图片的左上角而不是中心点）
//    [image drawAtPoint:CGPointMake(self.bounds.size.width / 2 - image.size.width / 2, self.bounds.size.height / 2 - image.size.height / 2)];
}


@end
