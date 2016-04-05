//
//  UIView+Cutter.h
//  ScreenShotTest
//
//  Created by 张雷 on 16/4/5.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Cutter)

/**
 *  根据视图尺寸获取视图截屏
 *
 *  @return UIImage 截取的图片
 */
- (UIImage*)viewCutter;

@end
