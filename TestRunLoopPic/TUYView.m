//
//  TUYView.m
//  TestRunLoopPic
//
//  Created by pro on 2018/4/27.
//  Copyright © 2018年 ChenXiaoJun. All rights reserved.
//

#import "TUYView.h"
#import "TUYContentView.h"
#import "TUYBottomView.h"
@interface TUYView()<TUYBottomViewDelegate>

/** BottomView */
@property (nonatomic,weak) TUYBottomView *bottomView;

@end

@implementation TUYView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}


/**
 初始化
 */
-(void)setUp
{
    self.backgroundColor = [UIColor whiteColor];
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 20, self.bounds.size.width, 44)];
    
    UIBarButtonItem *clearItem = [[UIBarButtonItem alloc] initWithTitle:@"清屏" style:UIBarButtonItemStylePlain target:self action:@selector(clear:)];
    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"撤销" style:UIBarButtonItemStylePlain target:self action:@selector(cancel:)];
    UIBarButtonItem *undoItem = [[UIBarButtonItem alloc] initWithTitle:@"橡皮擦" style:UIBarButtonItemStylePlain target:self action:@selector(undo:)];
    UIBarButtonItem *photoItem = [[UIBarButtonItem alloc] initWithTitle:@"照片" style:UIBarButtonItemStylePlain target:self action:@selector(photo:)];
    UIBarButtonItem *springItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *saveItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(save:)];

    toolBar.items = @[clearItem,cancelItem,undoItem,photoItem,springItem,saveItem];
    [self addSubview:toolBar];
    
    //主画布
    TUYContentView *contentView = [[TUYContentView alloc] initWithFrame:CGRectMake(0, 64, self.bounds.size.width, 450)];
    contentView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.contentView = contentView];
    
    //底部view
    CGFloat maxY = CGRectGetMaxY(contentView.frame);
    TUYBottomView *bottomView = [[TUYBottomView alloc] initWithFrame:CGRectMake(0, maxY, self.bounds.size.width, self.bounds.size.height - maxY)];
    bottomView.delegate = self;
    bottomView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.bottomView = bottomView];
    
}




#pragma mark - 事件处理

/** 清屏 */
-(void)clear:(UIBarButtonItem *)item
{
    if ([self.delegate respondsToSelector:@selector(tuyView:didTapClear:)]) {
        [self.delegate tuyView:self didTapClear:item];
    }
}
/** 撤销 */
-(void)cancel:(UIBarButtonItem *)item
{
    if ([self.delegate respondsToSelector:@selector(tuyView:didTapCancel:)]) {
        [self.delegate tuyView:self didTapCancel:item];
    }
}
/** 橡皮擦 */
-(void)undo:(UIBarButtonItem *)item
{
    if ([self.delegate respondsToSelector:@selector(tuyView:didTapUndo:)]) {
        [self.delegate tuyView:self didTapUndo:item];
    }
}
/** 照片 */
-(void)photo:(UIBarButtonItem *)item
{
    if ([self.delegate respondsToSelector:@selector(tuyView:didTapPhoto:)]) {
        [self.delegate tuyView:self didTapPhoto:item];
    }
}
/** 保存 */
-(void)save:(UIBarButtonItem *)item
{
    if ([self.delegate respondsToSelector:@selector(tuyView:didTapSave:)]) {
        [self.delegate tuyView:self didTapSave:item];
    }
}

#pragma mark - TUYBottomViewDelegate
//画笔粗细被改变
-(void)tuyBottomView:(TUYBottomView *)bottomView didSliderChange:(UISlider *)slider
{
    if ([self.delegate respondsToSelector:@selector(tuyView:didSliderChange:)]) {
        [self.delegate tuyView:self didSliderChange:slider];
    }
}
//点击不同颜色的画笔
-(void)tuyBottomView:(TUYBottomView *)bottomView didYellowPen:(UIButton *)Btn
{
    if ([self.delegate respondsToSelector:@selector(tuyView:didYellowPen:)]) {
        [self.delegate tuyView:self didYellowPen:Btn];
    }
}
-(void)tuyBottomView:(TUYBottomView *)bottomView didGreenPen:(UIButton *)Btn
{
    if ([self.delegate respondsToSelector:@selector(tuyView:didGreenPen:)]) {
        [self.delegate tuyView:self didGreenPen:Btn];
    }
}
-(void)tuyBottomView:(TUYBottomView *)bottomView didBluePen:(UIButton *)Btn
{
    if ([self.delegate respondsToSelector:@selector(tuyView:didBluePen:)]) {
        [self.delegate tuyView:self didBluePen:Btn];
    }
}



#pragma mark - 子控件布局

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    
    
    
}


@end
