//
//  TUVCoverView.m
//  TestRunLoopPic
//
//  Created by pro on 2018/4/28.
//  Copyright © 2018年 ChenXiaoJun. All rights reserved.
//

#import "TUYCoverView.h"

@interface TUYCoverView()<UIGestureRecognizerDelegate>

/** imageView */
@property (nonatomic,strong) UIImageView *imageView;


@end

@implementation TUYCoverView
#pragma mark - lazy
-(UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imageView.userInteractionEnabled = YES;
        [self addGesture]; //添加手势
        [self addSubview:_imageView];
    }
    return _imageView;
}


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.clipsToBounds = YES;
    }
    return self;
}

/**
 设置数据

 @param image 图片
 */
-(void)setImage:(UIImage *)image
{
    _image = image;
    
    self.imageView.image = image;
}



#pragma mark - 添加手势
-(void)addGesture
{
    //拖动
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panHandle:)];
    [self.imageView addGestureRecognizer:pan];
    //旋转
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationHandle:)];
    rotation.delegate = self;
    [self.imageView addGestureRecognizer:rotation];
    //缩放
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchHandle:)];
    pinch.delegate = self;
    [self.imageView addGestureRecognizer:pinch];
    //长按
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressHandle:)];
    longPress.delegate = self;
    [self.imageView addGestureRecognizer:longPress];
}


//拖动
-(void)panHandle:(UIPanGestureRecognizer *)handle
{
    CGPoint locationP = [handle translationInView:self];
    handle.view.transform = CGAffineTransformTranslate(handle.view.transform,locationP.x, locationP.y);
    
    [handle setTranslation:CGPointZero inView:self];
    
}

//旋转
-(void)rotationHandle:(UIRotationGestureRecognizer *)handle
{
    handle.view.transform = CGAffineTransformRotate(handle.view.transform, handle.rotation);
    handle.rotation = 0;
}

//缩放
-(void)pinchHandle:(UIPinchGestureRecognizer *)handle
{

    handle.view.transform = CGAffineTransformScale(handle.view.transform, handle.scale, handle.scale);
    handle.scale = 1.0;
}

//长按
-(void)longPressHandle:(UILongPressGestureRecognizer *)handle
{
    if ([self.delegate respondsToSelector:@selector(tuyCoverView:didCreateNewImage:)]) {

        [UIView animateWithDuration:0.2 animations:^{
            handle.view.alpha = 0;
        } completion:^(BOOL finished) {
            handle.view.alpha = 1;
            
            UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
            CGContextRef ctx = UIGraphicsGetCurrentContext();
            [self.layer renderInContext:ctx];
            UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            [self.delegate tuyCoverView:self didCreateNewImage:image];
        }];
        
    }
}



/**
 支持多手势
 */
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}
@end
