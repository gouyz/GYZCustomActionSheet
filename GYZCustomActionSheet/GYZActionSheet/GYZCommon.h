//
//  GYZCommon.h
//  GYZCustomActionSheet
//
//  Created by Mac on 16/6/20.
//  Copyright © 2016年 GYZ. All rights reserved.
//

#ifndef GYZCommon_h
#define GYZCommon_h

#define kLineHeight  0.5

#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

// View 坐标(x,y)和宽高(width,height)
#define X(v)               (v).frame.origin.x
#define Y(v)               (v).frame.origin.y
#define WIDTH(v)           (v).frame.size.width
#define HEIGHT(v)          (v).frame.size.height

#define MinX(v)            CGRectGetMinX((v).frame) // 获得控件屏幕的x坐标
#define MinY(v)            CGRectGetMinY((v).frame) // 获得控件屏幕的Y坐标

#define MidX(v)            CGRectGetMidX((v).frame) //横坐标加上到控件中点坐标
#define MidY(v)            CGRectGetMidY((v).frame) //纵坐标加上到控件中点坐标

#define MaxX(v)            CGRectGetMaxX((v).frame) //横坐标加上控件的宽度
#define MaxY(v)            CGRectGetMaxY((v).frame) //纵坐标加上控件的高度

/********颜色相关宏***********/
//十六进制颜色
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define kColor(R,G,B,A) [UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]

#define kGrayLineColor UIColorFromRGB(0xe5e5e5)

/// View 圆角
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

///  View加边框
#define ViewBorder(View, BorderColor, BorderWidth )\
\
View.layer.borderColor = BorderColor.CGColor;\
View.layer.borderWidth = BorderWidth;

///  View加圆角和阴影
#define ViewShadow(View)\
\
View.layer.cornerRadius = kViewCornerRadios;\
View.layer.shadowOffset = CGSizeMake(1, 1.2);\
View.layer.shadowOpacity = 0.2;\
View.layer.shadowColor = [UIColor blackColor].CGColor;

#endif /* GYZCommon_h */
