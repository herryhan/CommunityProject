//
//  TabbarController.m
//  手艺人
//
//  Created by 韩先炜 on 15/4/27.
//  Copyright (c) 2015年 韩先炜. All rights reserved.
//

#import "TabbarController.h"
#import "SQhomeViewController.h"
#import "SQcommunityViewController.h"
#import "SQmyViewController.h"
#import "tabbarBtn.h"
#define __kScreenHeight [UIScreen mainScreen].bounds.size.height
#define __kScreenWidth [UIScreen mainScreen].bounds.size.width
@interface TabbarController ()
{
    UIView *_tabbar;
}
@end

@implementation TabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.hidden=YES;
    [self createTabBar];
}
-(void)createTabBar
{
    _tabbar = [[UIView alloc] initWithFrame:CGRectMake(0, __kScreenHeight-48.5, __kScreenWidth, 49)];
    //_tabbar.backgroundColor = [UIColor lightGrayColor];
    
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0, __kScreenHeight-48, __kScreenWidth, 0.5)];
    line.backgroundColor=[UIColor grayColor];
    [self.view addSubview:line];
    
    // 定制 Button
    
    NSArray *title = @[@"首页",@"社区",@"我的"];
    NSArray *normalImage = @[@"home_unselected"
                                ,@"community_unselected"
                                ,@"my_unselected"
                                ];
    NSArray *selectImage = @[@"home_selected"
                                  ,@"community_selected"
                                  ,@"my_selected"
                                  ];

    CGFloat width = __kScreenWidth / title.count;
    for (int i = 0; i < title.count; ++i) {
        tabbarBtn *btn = [tabbarBtn buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i * width, 0, width, 49);
        btn.tag = 100 + i;
        [btn setTitle:title[i] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:normalImage[i]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:selectImage[i]] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
        [_tabbar addSubview:btn];
        if (i == 0) {
            btn.selected = YES;
        }
    }
    //_tabbar.alpha=0.8;
    [self.view addSubview:_tabbar];
}
-(void)btnPress:(UIButton *)btn
{
        for (UIView *view in _tabbar.subviews) {
            if ([view isKindOfClass:[UIButton class]]) {
                ((UIButton *)view).selected = NO;
            }
        }
        btn.selected = YES;
        self.selectedIndex = btn.tag - 100;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
