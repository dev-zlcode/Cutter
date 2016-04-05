//
//  UIViewControllerCutter.m
//  CutterTest
//
//  Created by 张雷 on 16/4/5.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#import "UIViewControllerCutter.h"

@interface UIViewControllerCutter ()

@end

@implementation UIViewControllerCutter

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initView];
}

#pragma mark - 初始化视图
- (void)initView
{
    self.view.backgroundColor = [UIColor redColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 0, 60, 44);
    [button setTitle:@"截屏" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(rightButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = btnItem;
}

#pragma mark - 导航按钮
- (void)rightButton:(UIButton *)sender
{
    ShowImageViewController *vc = [[ShowImageViewController alloc] init];
    vc.image = [self.view viewCutter];
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    vc.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:vc animated:YES completion:nil];
}

@end
