//
//  RSBaseViewController.h
//  RenrenSixin
//
//  Created by feng zijie on 12-6-5.
//  Copyright (c) 2012年 renren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController <PKResChangeStyleDelegate> {//LanguageManagerDelegate
    BOOL _canDragBack;
}

@property (nonatomic, strong) UIColor *navigationBarColor;
@property (nonatomic, assign) BOOL    canDragBack;
@property (nonatomic, assign) BOOL    loadingStep;

// 卸载界面，用于在收到内存警告时调用。子类中去具体实现。
// 此方法为兼容IOS5.x和IOS6.x添加的。
- (void)unLoadViews;

- (void)goBack;

+ (UIBarButtonItem *)navigationBackButtonItemWithTarget:(id)target action:(SEL)action;

- (void)setScrollsToTop:(UIScrollView *)view inSuperView:(UIView *)superView;

- (id)initWithDictionary:(NSDictionary *)dic;
- (void)parseDictionary:(NSDictionary *)dic;

- (void)cancelRequestIfNeed;

#pragma mark Navigation Text Button
- (void)setLeftBarButtonItem:(UIBarButtonItem *)barButtonItem;
- (void)setRightBarButtonItem:(UIBarButtonItem *)barButtonItem;

- (UIBarButtonItem *)leftBarButtonItem;
- (UIBarButtonItem *)rightBarButtonItem;

- (void)dragBackBegin;
- (CGFloat)getLoadingStep;

@end