//
//  SecurityProViewController.m
//  路由管理
//
//  Created by zhaoyuan on 15/9/10.
//  Copyright (c) 2015年 赵远. All rights reserved.
//

#import "SecurityProViewController2.h"

#import "NetViewController.h"


#import "DropMuneView.h"

#import "MBProgressHUD.h"
#import "Utils.h"
#import "Config.h"

@interface SecurityProViewController2 ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UITextViewDelegate,UITextFieldDelegate>
{
    NSMutableArray *_dataSourceArray;
    UITextField *input;
    NSString *question;

}

@property (nonatomic,strong) UITableView *rightTableView;


@end

static NSString *cellIdent = @"cellIdent";

@implementation SecurityProViewController2


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = navigationBarColor;
    
    
    
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    //tintColor
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

    self.navigationItem.rightBarButtonItem = nil;
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self initView];
    [self initData];
}


-(void)initView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 110, screen_width, screen_height-64) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    
    DropMuneView  *dropMenuView = [[DropMuneView alloc] initWithFrame:CGRectMake(0, 70, self.view.frame.size.width, 40)];
    dropMenuView.backgroundColor=white;
    question=[dropMenuView getAnswer];

    
    [self.view addSubview:dropMenuView];
    
}

-(void)initData{
    
    
}


#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 15;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_height, 75)];
    footerView.backgroundColor = RGB(239, 239, 244);
    return footerView;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 5)];
    headerView.backgroundColor = RGB(239, 239, 244);
    return headerView;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndentifier = @"mineCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    
    if(indexPath.section == 0) {
        cell.textLabel.text = @"答案";
        
        
        
        input = [[UITextField alloc] initWithFrame:CGRectMake(50, 0, cell.frame.size.width - 55, 44)];
        input.placeholder = @"不少于十个字";
        input.keyboardType=UIKeyboardTypeDefault;
        input.delegate=self;
        input.clearButtonMode= UITextFieldViewModeWhileEditing;
        input.font = [UIFont systemFontOfSize:14];
        input.returnKeyType=UIReturnKeyGo;
        [cell addSubview:input];
        
        
        cell.textLabel.font = [UIFont systemFontOfSize:15];
    }else if (indexPath.section == 1){
        cell.textLabel.text = @"确定";
        cell.textLabel.textAlignment=1;
        cell.textLabel.textColor=fontBlue;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)_showRightTableView{
    
    CGFloat height = 100;
    
    self.rightTableView.frame = CGRectMake(self.rightTableView.frame.origin.x, self.rightTableView.frame.origin.y, self.rightTableView.frame.size.width, height);
}

- (void)_HiddenRightTableView{
    
    
    self.rightTableView.frame = CGRectMake(self.rightTableView.frame.origin.x, self.rightTableView.frame.origin.y, self.rightTableView.frame.size.width, 0);
}


- (UITableView *)rightTableView{
    
    if (!_rightTableView) {
        
        _rightTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _rightTableView.delegate = self;
        _rightTableView.dataSource = self;
        [_rightTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdent];
        _rightTableView.frame = CGRectMake(0, 0 , 200, 0);
        
        
    }
    
    return _rightTableView;
    
    
}

-(void)submit{
    
//    NSArray *info=[Config getQuestionAnswer];
//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//    NSString *question = [userDefaults objectForKey:@"question"];
    
//    if (![info[1] isEqualToString:input.text]||![info[0] isEqualToString:question]) {
//        return;
//    }
    
    
//    [CLLockVC showSettingLockVCInVC:self successBlock:^(CLLockVC *lockVC, NSString *pwd) {
//        
//        NSLog(@"密码设置成功");
//        [lockVC dismiss:1.0f];
//        NetViewController* VC  = [[NetViewController alloc] init];
//        VC.isIn=@"ok";
//
//        [self.navigationController pushViewController:VC animated:YES];
////        [self dismissViewControllerAnimated:YES completion:nil];
//
//    }];

    
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == input){
        [input becomeFirstResponder];
        [self submit];
    }
    
    
    return YES;
}
#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==1) {
        [self submit];
        
        
        
    }
    
    
}



//响应事件
-(void)backBtnTap:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
    
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
