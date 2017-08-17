//
//  ViewController.m
//  Quartz2DTest
//
//  Created by 黄章成 on 2017/8/15.
//  Copyright © 2017年 黄章成. All rights reserved.
//

#import "ViewController.h"
#import "QCLineView.h"
#import "QCRectView.h"
#import "QCArcView.h"
#import "QCPiechartView.h"
#import "QCRotateView.h"
#import "QCDrawImageView.h"
#import "QCImageClipView.h"
#import "QCPathView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = self.view.bounds.size.width / 2;
    CGFloat height = (self.view.bounds.size.height - 49) / 4;
    
    QCLineView *lineView = [[QCLineView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    lineView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.2];
    [self.view addSubview:lineView];
    
    QCRectView *rectView = [[QCRectView alloc] initWithFrame:CGRectMake(width, 0, width, height)];
    rectView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:rectView];
    
    QCArcView *arcView = [[QCArcView alloc] initWithFrame:CGRectMake(0, height, width, height)];
    arcView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:arcView];
    
    QCPiechartView *pieView = [[QCPiechartView alloc] initWithFrame:CGRectMake(width, height, width, height)];
    pieView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.2];
    [self.view addSubview:pieView];
    
    QCRotateView *rotateView = [[QCRotateView alloc] initWithFrame:CGRectMake(0, height * 2, width, height)];
    rotateView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.2];
    [self.view addSubview:rotateView];
    
    QCDrawImageView *drawImageView = [[QCDrawImageView alloc] initWithFrame:CGRectMake(width, height * 2, width, height)];
    drawImageView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:drawImageView];
    
    QCImageClipView *imageClipView = [[QCImageClipView alloc] initWithFrame:CGRectMake(0, height * 3, width, height)];
    imageClipView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:imageClipView];
    
    QCPathView *pathView = [[QCPathView alloc] initWithFrame:CGRectMake(width, height * 3, width, height)];
    pathView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.2];
    [self.view addSubview:pathView];
    
    

}

#pragma mark - 点击屏幕截屏，并保存到系统相册中
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 开启图形上下文
    UIGraphicsBeginImageContext(self.view.bounds.size);
    
    // 将view绘制到上下文中
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    // 生成图片
    UIImage *screenShotImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 将图片保存到相册中
//    UIImageWriteToSavedPhotosAlbum(screenShotImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    // 将图片保存到沙盒中
    NSData *data = UIImagePNGRepresentation(screenShotImage);
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"abc.png"];
    NSLog(@"%@", path);
    [data writeToFile:path atomically:YES];
}

// 保存到系统相册的方法
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
 {
     if (error) {
         NSLog(@"保存图片失败!");
     }else{
         NSLog(@"图片保存成功!");
     }
     
 }
@end
