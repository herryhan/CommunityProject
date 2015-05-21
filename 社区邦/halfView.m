//
//  halfView.m
//  社区邦
//
//  Created by 韩先炜 on 15/5/20.
//  Copyright (c) 2015年 韩先炜. All rights reserved.
//

#import "halfView.h"
//#import <QuartzCore/QuartzCore.h>
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
                //self.userName.text=@"屈";
                self.bgImagevView.image=[UIImage imageNamed:@"backgroundimage"];
                self.headImageView.image=[UIImage imageNamed:@"user"];
                self.sexLab.image=[UIImage imageNamed:@"sex"];
                [self initHalfView];
                break;
            }
        }
    }
    return self;
}
-(void)initHalfView
{
    self.motionLab.numberOfLines =0;
    UIFont * tfont = [UIFont systemFontOfSize:14];
    self.motionLab.adjustsFontSizeToFitWidth=YES;
    self.motionLab.textAlignment=NSTextAlignmentJustified;
    self.motionLab.lineBreakMode =NSLineBreakByWordWrapping ;
    
    NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
    [paragrahStyle setLineSpacing: 4];
    [paragrahStyle setParagraphSpacing: 0];
    [paragrahStyle setParagraphSpacingBefore: 4];
    CGSize size =CGSizeMake(320,1000);
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:tfont,NSFontAttributeName,paragrahStyle,NSParagraphStyleAttributeName, nil];
    CGSize  actualsize =[self.motionLab.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading  attributes:tdic context:nil].size;
    self.newHeight=actualsize.height;
    if (self.CellHeight!= Nil)
        [self.motionLab removeConstraint: self.CellHeight];
    self.CellHeight = [NSLayoutConstraint constraintWithItem: self.motionLab attribute: NSLayoutAttributeHeight relatedBy: NSLayoutRelationEqual toItem: Nil attribute: NSLayoutAttributeHeight multiplier: 1 constant: self.newHeight];
    [self.motionLab addConstraint: self.CellHeight];
   self.frame =CGRectMake(0,0, self.frame.size.width, self.integralLab.frame.origin.y+self.integralLab.frame.size.height+actualsize.height);
}


@end
