//
//  UICollectionViewCutter.m
//  CutterTest
//
//  Created by 张雷 on 16/4/5.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#import "UICollectionViewCutter.h"

@interface UICollectionViewCutter ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *collectionView;
@end

@implementation UICollectionViewCutter

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
    
    UICollectionViewFlowLayout *collectionLayout = [[UICollectionViewFlowLayout alloc] init];
    collectionLayout.itemSize = CGSizeMake(([[UIScreen mainScreen] bounds].size.width-20)/3.0, ([[UIScreen mainScreen] bounds].size.width-20)/3.0);
    
    // UITableView
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:collectionLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}

#pragma mark - 导航按钮
- (void)rightButton:(UIButton *)sender
{
    ShowImageViewController *vc = [[ShowImageViewController alloc] init];
    vc.image = [self.collectionView scrollViewCutter];
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    vc.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - collection delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    
    for (UIView *v in cell.contentView.subviews)
    {
        [v removeFromSuperview];
    }
    
    UILabel *label = [[UILabel alloc] initWithFrame:cell.bounds];
    label.text = @(indexPath.row).stringValue;
    label.textAlignment = NSTextAlignmentCenter;
    [cell.contentView addSubview:label];

    return cell;
}

@end
