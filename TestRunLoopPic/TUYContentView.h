//
//  TUYContentView.h
//  TestRunLoopPic
//
//  Created by pro on 2018/4/27.
//  Copyright © 2018年 ChenXiaoJun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TUYContentView : UIView

//设置画笔颜色
-(void)setPenColor:(UIColor *)color;
//设置画笔粗细0~1
-(void)setPenWidth:(CGFloat)width;

//清屏
-(void)clear;
//撤销
-(void)cancel;

/** image */
@property (nonatomic,strong) UIImage *image;


@end
