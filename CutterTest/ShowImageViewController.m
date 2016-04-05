//
//  ShowImageViewController.m
//  ScreenShotTest
//
//  Created by 张雷 on 14/10/26.
//  Copyright (c) 2014年 zhanglei. All rights reserved.
//

#import "ShowImageViewController.h"

@interface ShowImageViewController ()
@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)UIImageView *imageView;
@end

@implementation ShowImageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initView];
}

#pragma mark - 初始化视图
-(void)initView
{
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    
    //UIScrollView
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(20, 25, self.view.bounds.size.width - 40, self.view.bounds.size.height - 50)];
    _scrollView.contentSize = CGSizeMake(_scrollView.bounds.size.width, _image.size.height*_scrollView.bounds.size.width/_image.size.width);
    _scrollView.layer.cornerRadius = 8;
    _scrollView.layer.masksToBounds = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_scrollView];
    
    //UIImageView
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _scrollView.contentSize.width, _scrollView.contentSize.height)];
    _imageView.image = _image;
    _imageView.backgroundColor = [UIColor lightGrayColor];
    _imageView.layer.masksToBounds = YES;
    _imageView.layer.cornerRadius = 8;
    [_scrollView addSubview:_imageView];
    
    //UIButton
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [saveBtn setTitle:@"保存图片到相册" forState:UIControlStateNormal];
    saveBtn.frame = CGRectMake(40, _scrollView.bounds.size.height-50, (_scrollView.bounds.size.width - 40)/2.0-10, 35);
    saveBtn.backgroundColor = [UIColor grayColor];
    saveBtn.layer.cornerRadius = 5;
    saveBtn.alpha = 0.8;
    [saveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [saveBtn addTarget:self action:@selector(saveBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveBtn];
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    cancelBtn.frame = CGRectMake(_scrollView.bounds.size.width / 2.0+30, _scrollView.bounds.size.height-50, (_scrollView.bounds.size.width - 40)/2.0-10, 35);
    [cancelBtn addTarget:self action:@selector(cancelBtn) forControlEvents:UIControlEventTouchUpInside];
    cancelBtn.backgroundColor = [UIColor grayColor];
    cancelBtn.layer.cornerRadius = 5;
    cancelBtn.alpha = 0.8;
    [cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:cancelBtn];
}

#pragma mark - 保存图片到相册
-(void)saveBtn
{
    //1 保存照片到沙盒目录
    NSData *imageData = UIImagePNGRepresentation(_image);
    
    //创建文件夹  createIntermediates该参数bool类型,是否创建文件夹路径中没有的文件夹目录
    NSString *documentsDirectory = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"ScreenShot"];
    [[NSFileManager defaultManager] createDirectoryAtPath:documentsDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    
    NSInteger seconds = [[NSDate date] timeIntervalSince1970];
    NSString *pictureName= [NSString stringWithFormat:@"%ld.png",(long)seconds];
    NSString *savedImagePath = [documentsDirectory stringByAppendingPathComponent:pictureName];
    [imageData writeToFile:savedImagePath atomically:YES];
    
    //2 保存图片到照片库
    UIImageWriteToSavedPhotosAlbum(_image, nil, nil, nil);
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 取消
-(void)cancelBtn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
