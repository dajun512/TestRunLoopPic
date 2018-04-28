//
//  TUYContentView.m
//  TestRunLoopPic
//
//  Created by pro on 2018/4/27.
//  Copyright © 2018年 ChenXiaoJun. All rights reserved.
//


#import "TUYContentView.h"
#import "TUYBezierPath.h"

static NSInteger const cDefault_Pen_Widht = 1; //默认画笔宽度
@interface TUYContentView()

/** 所有路径 */
@property (nonatomic,strong) NSMutableArray *pathArray;

/** 当前路径 */
@property (nonatomic,strong) TUYBezierPath *bezierPath;


@end

@implementation TUYContentView{
    UIColor *_currentColor;
    CGFloat _currentPenWidth;
}
#pragma mark - lazy
-(NSMutableArray *)pathArray
{
    if (!_pathArray) {
        _pathArray = [NSMutableArray array];
    }
    return _pathArray;
}




- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _currentPenWidth = cDefault_Pen_Widht;
        _currentColor = [UIColor blackColor];
        
    }
    return self;
}


/**
 传入要绘制到画板的图片
 */
-(void)setImage:(UIImage *)image
{
    _image = image;
    
    [self.pathArray addObject:image];
    [self setNeedsDisplay];
}


/**
 开始移动
 */
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchP = [touch locationInView:self];
    TUYBezierPath *path = [TUYBezierPath bezierPath];
    path.color = _currentColor;
    path.lineWidth = _currentPenWidth;
    path.lineJoinStyle = kCGLineJoinRound;
    [self.pathArray addObject:self.bezierPath = path];
    [self.bezierPath moveToPoint:touchP];
}
/**
 移动中
 */
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchP = [touch locationInView:self];
    [self.bezierPath addLineToPoint:touchP];
    [self setNeedsDisplay];
}
/**
 移动结束
 */
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.bezierPath = nil;
}

#pragma mark - 设置画笔属性
//设置画笔颜色
-(void)setPenColor:(UIColor *)color
{
    _currentColor = color;
}
//设置画笔粗细0~1
-(void)setPenWidth:(CGFloat)width
{
    _currentPenWidth = width * 10 / 1 + cDefault_Pen_Widht;
}

//清屏
-(void)clear
{
    [self.pathArray removeAllObjects];
    [self setNeedsDisplay];
}
//撤销
-(void)cancel
{
    [self.pathArray removeLastObject];
    [self setNeedsDisplay];
}


/** 绘图 */
- (void)drawRect:(CGRect)rect {
    if (self.pathArray.count) {
        for (TUYBezierPath *path in self.pathArray) {
            if ([path isKindOfClass:[UIImage class]]) {
                UIImage *image = (UIImage *)path;
                [image drawInRect:self.bounds];
            }else{
                [path.color set];
                [path stroke];
            }
            
        }
    }
    
}


@end
