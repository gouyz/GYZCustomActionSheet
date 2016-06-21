//
//  GYZAlertView.h
//  GYZCustomActionSheet
//
//  Created by GYZ on 16/6/21.
//  Copyright © 2016年 GYZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GYZAlertViewDelegate;

@interface GYZAlertView : UIView
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UIImage *icon;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *message;
@property (weak, nonatomic) id<GYZAlertViewDelegate> delegate;

/**
 *  点击按钮后是否隐藏弹出框,默认隐藏
 */
@property (nonatomic) BOOL afterClickIsHidden;
/**
 *  初始化
 *
 *  @param title        标题
 *  @param icon         标题icon
 *  @param message      内容描述
 *  @param delegate     代理
 *  @param buttonTitles 按钮title
 *
 *  @return
 */
- (instancetype)initWithTitle:(NSString *)title icon:(UIImage *)icon message:(NSString *)message delegate:(id<GYZAlertViewDelegate>)delegate buttonTitles:(NSString *)buttonTitles, ... NS_REQUIRES_NIL_TERMINATION;

// Show the alert view in current window
- (void)show;

// Hide the alert view
- (void)hide;

// Set the color and font size of title, if color is nil, default is black. if fontsize is 0, default is 14
- (void)setTitleColor:(UIColor *)color fontSize:(CGFloat)size;

// Set the color and font size of message, if color is nil, default is black. if fontsize is 0, default is 12
- (void)setMessageColor:(UIColor *)color fontSize:(CGFloat)size;

// Set the color and font size of button at the index, if color is nil, default is black. if fontsize is 0, default is 16
- (void)setButtonTitleColor:(UIColor *)color fontSize:(CGFloat)size atIndex:(NSInteger)index;

// Set the color and font size of headerLine, if color is nil, default is black.
- (void)setHeaderLineColor:(UIColor *)color ;

@end

@protocol GYZAlertViewDelegate <NSObject>

- (void)alertView:(GYZAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

@end
