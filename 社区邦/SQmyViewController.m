//
//  SQmyViewController.m
//  社区邦
//
//  Created by 韩先炜 on 15/5/19.
//  Copyright (c) 2015年 韩先炜. All rights reserved.
//
#define __kScreenHeight [UIScreen mainScreen].bounds.size.height
#define __kScreenWidth [UIScreen mainScreen].bounds.size.width

#import "SQmyViewController.h"

@interface SQmyViewController ()
{
    NSArray *_titleArray;
    NSArray *_titleImageArray;
}
@end

@implementation SQmyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithRed:0.94 green:0.93 blue:0.96 alpha:1.0];
    self.halfView=[[halfView alloc]initWithFrame:CGRectMake(0, 0, __kScreenWidth, 304) withController:self];
    //self.halfView.backgroundColor=[UIColor lightGrayColor];
    self.myScroller=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, __kScreenWidth,__kScreenHeight-49)];
   // self.myScroller.contentSize=CGSizeMake(__kScreenWidth, __kScreenHeight);

    self.myScroller.scrollEnabled=YES;
    
    [self.myScroller addSubview:self.halfView];

    self.myTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, self.halfView.frame.size.height+10, __kScreenWidth, 200) style:UITableViewStylePlain];
    _titleArray=[[NSArray alloc]initWithObjects:@"我的积分",@"我的消息",@"我的社区",@"我的积分历史",@"设置", nil];
    _titleImageArray=[[NSArray alloc]initWithObjects:@"-integral",@"message",@"community",@"story",@"setting",nil];
    self.myTableView.delegate=self;
    self.myTableView.dataSource=self;
    [self.myScroller addSubview:self.myTableView];
    self.myScroller.contentSize=CGSizeMake(__kScreenWidth, self.myTableView.frame.size.height+self.myTableView.frame.origin.y+10);
    [self.view addSubview:self.myScroller];
    //[self configureHalf];
}
//调整上半部分
//-(void)configureHalf
//{
//    //背景图片
//   // UIImage *im=[UIImage imageNamed:@"backgroundimage"];
//    self.bgImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, __kScreenWidth,160)];
//    self.bgImage.image=[UIImage imageNamed:@"backgroundimage"];
//    [self.view addSubview:self.bgImage];
//    //用户头像
//    self.headImage=[[UIImageView alloc]initWithFrame:CGRectMake(15, 130, 60, 60)];
//    self.headImage.image=[UIImage imageNamed:@"user"];
//    [self.view addSubview:self.headImage];
//    //用户名：
//    self.name=[[UITextField alloc]initWithFrame:CGRectMake(15, 230, 100, 40)];
//    self.name.borderStyle=UITextBorderStyleRoundedRect;
//    self.name.returnKeyType=UIReturnKeyDone;
//    self.name.delegate=self;
//    
//    [self.view addSubview:self.name];
//    
//    self.name1=[[UITextField alloc]initWithFrame:CGRectMake(15, 270, 100, 40)];
//    self.name1.borderStyle=UITextBorderStyleRoundedRect;
//    self.name1.returnKeyType=UIReturnKeyDone;
//    self.name1.delegate=self;
//    
//    [self.view addSubview:self.name1];
//    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame=CGRectMake(15, 340, 200, 40);
//    [btn setTitle:@"登陆" forState:UIControlStateNormal];
//    btn.backgroundColor=[UIColor redColor];
//    [btn addTarget:self action:@selector(btnPress) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
//}
//-(void)btnPress
//{
//    NSLog(@"fuck");
//    // 1.设置请求路径
//        NSURL *URL=[NSURL URLWithString:@"http://api.o2oha.com/user/login"];//不需要传递参数
//
//     //    2.创建请求对象
//         NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:URL];//默认为get请求
//         request.timeoutInterval=5.0;//设置请求超时为5秒
//         request.HTTPMethod=@"POST";//设置请求方法
//    
//         //设置请求体
//         NSString *param=[NSString stringWithFormat:@"user.name=%@&user.password=%@",self.name.text,self.name1.text];
//         //把拼接后的字符串转换为data，设置请求体
//         request.HTTPBody=[param dataUsingEncoding:NSUTF8StringEncoding];
//     NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
//}
//-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
//{
//    NSLog(@"success");
//}
#pragma tableDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titleArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellid=@"cellid";
    UITableViewCell *cell=(UITableViewCell *)[tableView  dequeueReusableCellWithIdentifier:cellid];
    if (cell==nil) {
        cell =[[UITableViewCell alloc]initWithFrame:CGRectZero];
    }
    [[cell imageView]setImage:[UIImage imageNamed:_titleImageArray[indexPath.row]]];
    [[cell textLabel] setText:_titleArray[indexPath.row]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"han ");
}
-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.name resignFirstResponder];

    [self.name1 resignFirstResponder];
    return YES;
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
