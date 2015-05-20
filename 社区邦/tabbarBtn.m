//
//  tabbarBtn.m
//  手艺人
//
//  Created by 韩先炜 on 15/4/27.
//  Copyright (c) 2015年 韩先炜. All rights reserved.
//

#import "tabbarBtn.h"

@implementation tabbarBtn

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    }
    return self;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
        return CGRectMake(1.8, 28, contentRect.size.width, 22);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
      return CGRectMake((contentRect.size.width - 29) / 2, 2, 33, 33);
}

@end
