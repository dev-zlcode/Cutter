//
//  UIWebViewCutter.m
//  CutterTest
//
//  Created by 张雷 on 16/4/5.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#import "UIWebViewCutter.h"

@interface UIWebViewCutter ()
@property (nonatomic,strong) UIWebView *webView;
@end

@implementation UIWebViewCutter

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
    
    // WebView
    self.webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.webView];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://www.baidu.com"]];
    [self.webView loadRequest:request];
}

#pragma mark - 导航按钮
- (void)rightButton:(UIButton *)sender
{
    ShowImageViewController *vc = [[ShowImageViewController alloc] init];
    vc.image = [self.webView.scrollView scrollViewCutter];
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    vc.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:vc animated:YES completion:nil];
}

@end
