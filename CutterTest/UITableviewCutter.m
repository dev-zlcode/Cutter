//
//  UITableviewCutter.m
//  CutterTest
//
//  Created by 张雷 on 16/4/5.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#import "UITableviewCutter.h"

@interface UITableviewCutter ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation UITableviewCutter

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initView];
}

#pragma mark - 初始化视图
- (void)initView
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 截屏按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 0, 60, 44);
    [button setTitle:@"截屏" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(rightButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = btnItem;
    
    // UITableView
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView .delegate = self;
    self.tableView .dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark - 导航按钮
- (void)rightButton:(UIButton *)sender
{
    ShowImageViewController *vc = [[ShowImageViewController alloc] init];
    vc.image = [self.tableView scrollViewCutter];
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    vc.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - table delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = @(indexPath.row).stringValue;
    
    return cell;
}

@end
