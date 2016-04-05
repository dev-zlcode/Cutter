//
//  ViewController.m
//  CutterTest
//
//  Created by 张雷 on 16/4/5.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *titleArray;
@property(nonatomic,strong)NSArray *vcArray;

@end

@implementation ViewController

- (NSArray *)titleArray
{
    return @[@"UIViewController截屏-无导航",
             @"UIViewController截屏-有导航",
             @"UITableview截屏",
             @"UICollectionView截屏",
             @"UIWebView截屏"];
}

- (NSArray *)vcArray
{
    return @[@"UIViewControllerCutter",
             @"UIViewControllerCutter2",
             @"UITableviewCutter",
             @"UICollectionViewCutter",
             @"UIWebViewCutter"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    self.title = @"截屏";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
}

#pragma mark - 表代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.titleArray[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *vc = [[NSClassFromString(self.vcArray[indexPath.row]) alloc] init];
    vc.title = self.titleArray[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
