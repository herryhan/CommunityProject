//
//  halfView.h
//  社区邦
//
//  Created by 韩先炜 on 15/5/20.
//  Copyright (c) 2015年 韩先炜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface halfView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *bgImagevView;

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;

@property (weak, nonatomic) IBOutlet UILabel *userName;

@property (weak, nonatomic) IBOutlet UIImageView *sexLab;


@property (weak, nonatomic) IBOutlet UILabel *integralLab;

@property (weak, nonatomic) IBOutlet UILabel *motionLab;

@property id controller;
@property NSLayoutConstraint *CellHeight;
@property float newHeight;
-(id)initWithFrame:(CGRect)frame withController: (id )_controller;
@end
