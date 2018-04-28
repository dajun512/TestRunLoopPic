//
//  TUYBottomView.h
//  TestRunLoopPic
//
//  Created by pro on 2018/4/27.
//  Copyright © 2018年 ChenXiaoJun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TUYBottomView;
@protocol TUYBottomViewDelegate <NSObject>
//画笔粗细被改变
-(void)tuyBottomView:(TUYBottomView *)bottomView didSliderChange:(UISlider *)slider;
//点击不同颜色的画笔
-(void)tuyBottomView:(TUYBottomView *)bottomView didYellowPen:(UIButton *)Btn;
-(void)tuyBottomView:(TUYBottomView *)bottomView didGreenPen:(UIButton *)Btn;
-(void)tuyBottomView:(TUYBottomView *)bottomView didBluePen:(UIButton *)Btn;
@end

@interface TUYBottomView : UIView

/** id */
@property (nonatomic,weak) id<TUYBottomViewDelegate> delegate;

@end
