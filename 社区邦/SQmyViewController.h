//
//  SQmyViewController.h
//  社区邦
//
//  Created by 韩先炜 on 15/5/19.
//  Copyright (c) 2015年 韩先炜. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "halfView.h"

@interface SQmyViewController : UIViewController<UITextFieldDelegate,NSURLConnectionDataDelegate,NSURLConnectionDelegate,UITableViewDataSource,UITableViewDelegate>
@property UIImageView *bgImage;
@property UIImageView *headImage;
@property UITextField *name;
@property UITextField *name1;

@property UIScrollView *myScroller;
@property halfView *halfView;
@property UITableView *myTableView;
@end
