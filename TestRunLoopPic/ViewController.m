//
//  ViewController.m
//  TestRunLoopPic
//
//  Created by pro on 2018/4/17.
//  Copyright © 2018年 ChenXiaoJun. All rights reserved.
//

#import "ViewController.h"
#import "TUYView.h"
#import "TUYContentView.h"
#import "TUYCoverView.h"
@interface ViewController ()<TUYViewDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate,TUYCoverViewDelegate>

/** TUYCoverView */
@property (nonatomic,weak) TUYCoverView *coverView;

@end

@implementation ViewController

-(void)loadView
{
    TUYView *view = [[TUYView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.delegate = self;
    self.view = view;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}



#pragma mark - TUYViewDelegate
//点击清屏
-(void)tuyView:(TUYView *)view didTapClear:(UIBarButtonItem *)item
{
    [view.contentView clear];
}
//点击撤销
-(void)tuyView:(TUYView *)view didTapCancel:(UIBarButtonItem *)item
{
    [view.contentView cancel];
}
//点击橡皮擦
-(void)tuyView:(TUYView *)view didTapUndo:(UIBarButtonItem *)item
{
    [view.contentView setPenColor:[UIColor whiteColor]];
}
//点击照片
-(void)tuyView:(TUYView *)view didTapPhoto:(UIBarButtonItem *)item
{
    if (self.coverView) {
        //删除掉原有的图片
        [self.coverView removeFromSuperview];
    }
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}


//点击保存
-(void)tuyView:(TUYView *)view didTapSave:(UIBarButtonItem *)item
{
    TUYContentView *contentView = view.contentView;
    UIGraphicsBeginImageContextWithOptions(contentView.bounds.size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [contentView.layer renderInContext:ctx];
    UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}
//存储文件后回调
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    NSLog(@"图片保存成功");
}
//画笔粗细被改变
-(void)tuyView:(TUYView *)view didSliderChange:(UISlider *)slider
{
    [view.contentView setPenWidth:slider.value];
}
//点击不同颜色的画笔
-(void)tuyView:(TUYView *)view didYellowPen:(UIButton *)Btn
{
    [view.contentView setPenColor:[UIColor yellowColor]];
}
-(void)tuyView:(TUYView *)view didGreenPen:(UIButton *)Btn
{
    [view.contentView setPenColor:[UIColor greenColor]];
}
-(void)tuyView:(TUYView *)view didBluePen:(UIButton *)Btn
{
    [view.contentView setPenColor:[UIColor blueColor]];
}


#pragma mark - 从相册获取照片代理
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo
{
    TUYView *view = (TUYView *)self.view;
    TUYCoverView *cover = [[TUYCoverView alloc] init];
    cover.frame = view.contentView.frame;
    cover.image = image;
    cover.delegate = self;
    self.coverView = cover;
    [self.view addSubview:cover];
    [picker dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - 将导入的图片绘制到画板代理-TUYCoverViewDelegate
-(void)tuyCoverView:(TUYCoverView *)coverView didCreateNewImage:(UIImage *)newImage
{
    TUYView *view = (TUYView *)self.view;
    view.contentView.image = newImage;
    [coverView removeFromSuperview];
}

@end
