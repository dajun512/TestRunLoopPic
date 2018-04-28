//
//  TUVCoverView.h
//  TestRunLoopPic
//
//  Created by pro on 2018/4/28.
//  Copyright © 2018年 ChenXiaoJun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TUYCoverView;
@protocol TUYCoverViewDelegate <NSObject>


/**
 长按后生成图片回调
 */
-(void)tuyCoverView:(TUYCoverView *)coverView didCreateNewImage:(UIImage *)newImage;

@end

@interface TUYCoverView : UIView

/** image */
@property (nonatomic,weak) UIImage *image;


/** id */
@property (nonatomic,weak) id<TUYCoverViewDelegate> delegate;

@end
