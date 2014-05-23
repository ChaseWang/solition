//
//  RHCNavigationController.h
//  RenrenOfficial-iOS-Concept
//
//  Created by Will Lee on 8/29/13.
//  Copyright (c) 2013 renren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppNavigationController : UINavigationController <PKResChangeStyleDelegate, UIGestureRecognizerDelegate,UINavigationControllerDelegate>

@property (nonatomic, strong) UIColor *navigationBarColor;

@property (nonatomic, strong) UIPanGestureRecognizer *panGesture;

@property (nonatomic, assign) BOOL navPanGestureEnabled;

// 卸载界面，用于在收到内存警告时调用。子类中去具体实现。
// 此方法为兼容IOS5.x和IOS6.x添加的。
- (void)unLoadViews;

@end