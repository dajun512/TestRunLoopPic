//
//  TUYBezierPath.m
//  TestRunLoopPic
//
//  Created by pro on 2018/4/27.
//  Copyright © 2018年 ChenXiaoJun. All rights reserved.
//

#import "TUYBezierPath.h"

@implementation TUYBezierPath


-(id)copyWithZone:(NSZone *)zone
{
    TUYBezierPath *path = [super copyWithZone:zone];
    path.color = self.color;
    return path;
}




@end
