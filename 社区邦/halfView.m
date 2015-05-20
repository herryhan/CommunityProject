//
//  halfView.m
//  社区邦
//
//  Created by 韩先炜 on 15/5/20.
//  Copyright (c) 2015年 韩先炜. All rights reserved.
//

#import "halfView.h"

@implementation halfView
@synthesize controller;
-(id)initWithFrame:(CGRect)frame withController:(id)_controller
{
    self=[super initWithFrame:frame];
    if (self) {
        NSArray *arrayOfViews=[[NSBundle mainBundle]loadNibNamed:@"halfOfView" owner:self options:nil];
        if (arrayOfViews.count<1) {
            return nil;
        }
        for (id obj in arrayOfViews) {
            if ([obj isKindOfClass:[halfView class]]) {
                self=obj;
                self.frame=frame;
                self.controller=_controller;
                self.bgImagevView.image=[UIImage imageNamed:@"backgroundimage"];
                self.headImageView.image=[UIImage imageNamed:@"user"];
                self.sexLab.image=[UIImage imageNamed:@"sex"];
                break;
            }
        }
    }
    return self;
}

@end
