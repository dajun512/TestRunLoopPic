//
//  TUYView.h
//  TestRunLoopPic
//
//  Created by pro on 2018/4/27.
//  Copyright © 2018年 ChenXiaoJun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TUYContentView,TUYView;

@protocol TUYViewDelegate <NSObject>


//点击清屏
-(void)tuyView:(TUYView *)view didTapClear:(UIBarButtonItem *)item;
//点击撤销
-(void)tuyView:(TUYView *)view didTapCancel:(UIBarButtonItem *)item;
//点击橡皮擦
-(void)tuyView:(TUYView *)view didTapUndo:(UIBarButtonItem *)item;
//点击照片
-(void)tuyView:(TUYView *)view didTapPhoto:(UIBarButtonItem *)item;
//点击保存
-(void)tuyView:(TUYView *)view didTapSave:(UIBarButtonItem *)item;


//画笔粗细被改变
-(void)tuyView:(TUYView *)view didSliderChange:(UISlider *)slider;
//点击不同颜色的画笔
-(void)tuyView:(TUYView *)view didYellowPen:(UIButton *)Btn;
-(void)tuyView:(TUYView *)view didGreenPen:(UIButton *)Btn;
-(void)tuyView:(TUYView *)view didBluePen:(UIButton *)Btn;

@end

@interface TUYView : UIView


/** delegate */
@property (nonatomic,weak) id<TUYViewDelegate> delegate;

/** contentView */
@property (nonatomic,weak) TUYContentView *contentView;



@end
