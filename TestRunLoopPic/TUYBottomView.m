//
//  TUYBottomView.m
//  TestRunLoopPic
//
//  Created by pro on 2018/4/27.
//  Copyright © 2018年 ChenXiaoJun. All rights reserved.
//

#import "TUYBottomView.h"

@interface TUYBottomView()

/** sliderView */
@property (nonatomic,weak) UISlider *sliderView;

@end

@implementation TUYBottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}


-(void)setUp
{
    UISlider *sliderView = [[UISlider alloc] initWithFrame:CGRectMake(10, 10, self.bounds.size.width - 20, 30)];
    [sliderView addTarget:self action:@selector(sliderChange:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:self.sliderView = sliderView];
    CGFloat maxY = CGRectGetMaxY(sliderView.frame)+20;
    
    UIStackView *stackView = [[UIStackView alloc] initWithFrame:CGRectMake(10, maxY, self.bounds.size.width - 20, self.bounds.size.height - maxY -20)];
    stackView.distribution = UIStackViewDistributionFillEqually;
    stackView.spacing = 10;
    
    UIButton *yellowBtn = [[UIButton alloc] init];
    yellowBtn.backgroundColor = [UIColor yellowColor];
    [yellowBtn addTarget:self action:@selector(didTapYellowBtn:) forControlEvents:UIControlEventTouchUpInside];
    [stackView addArrangedSubview:yellowBtn];
    
    UIButton *greenBtn = [[UIButton alloc] init];
    greenBtn.backgroundColor = [UIColor greenColor];
    [greenBtn addTarget:self action:@selector(didTapGreenBtn:) forControlEvents:UIControlEventTouchUpInside];
    [stackView addArrangedSubview:greenBtn];
    
    UIButton *blueBtn = [[UIButton alloc] init];
    blueBtn.backgroundColor = [UIColor blueColor];
    [blueBtn addTarget:self action:@selector(didTapBlueBtn:) forControlEvents:UIControlEventTouchUpInside];
    [stackView addArrangedSubview:blueBtn];
    
    [self addSubview:stackView];

}


#pragma mark - 事件处理

//画笔粗细改变
-(void)sliderChange:(UISlider *)slider
{
    if ([self.delegate respondsToSelector:@selector(tuyBottomView:didSliderChange:)]) {
        [self.delegate tuyBottomView:self didSliderChange:slider];
    }
}

//黄色
-(void)didTapYellowBtn:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(tuyBottomView:didYellowPen:)]) {
        [self.delegate tuyBottomView:self didYellowPen:btn];
    }
}

//绿色
-(void)didTapGreenBtn:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(tuyBottomView:didGreenPen:)]) {
        [self.delegate tuyBottomView:self didGreenPen:btn];
    }
}

//蓝色
-(void)didTapBlueBtn:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(tuyBottomView:didBluePen:)]) {
        [self.delegate tuyBottomView:self didBluePen:btn];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
