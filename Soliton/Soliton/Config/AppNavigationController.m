//
//  RHCNavigationController.m
//  RenrenOfficial-iOS-Concept
//
//  Created by Will Lee on 8/29/13.
//  Copyright (c) 2013 renren. All rights reserved.
//

#import "AppNavigationController.h"

#define KEY_WINDOW [[UIApplication sharedApplication] keyWindow]
@interface AppNavigationController () {
    CGPoint startTouch;
    
    UIView *lastScreenShotView;
    UIView *blackMask;
}

@property (nonatomic, assign) BOOL isMoving;

@end

@implementation AppNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
//        NSDictionary *titleTextAttributes = @{UITextAttributeFont: [UIFont boldSystemFontOfSize:20.0f],
//                                              UITextAttributeTextColor: [UIColor whiteColor],
//                                              UITextAttributeTextShadowColor: [UIColor clearColor],
//                                              UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetMake(0.0f, 0.0f)]};
//        self.navigationBar.titleTextAttributes = titleTextAttributes;
        self.delegate = self;
        self.navPanGestureEnabled = YES;
        [[PKResManager getInstance] addChangeStyleObject:self];
    }
    
    return self;
}

- (void)dealloc
{
    [[PKResManager getInstance] removeChangeStyleObject:self];
    self.panGesture = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([UIDevice isHigherIOS7] && [self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = self;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// 卸载界面，用于在收到内存警告时调用
// 此方法为兼容IOS5.x和IOS6.x添加的。
- (void)unLoadViews {
    // 子类中去实现
//    [APPCONTEXT.languageManager removeChangeLanguegeObject:self];
}

// IOS6.x 不再会调到此方法
- (void)viewDidUnload {
    [super viewDidUnload];
    
    [self unLoadViews];
}

- (void)setNavigationBarColor:(UIColor *)navigationBarColor
{
    _navigationBarColor = navigationBarColor;
    UIImage *colorImage = [UIImage imageWithColor:_navigationBarColor];
    // 重新构造navigationBar的纯色图片
    [self.navigationBar setNavigationBarWithImage:colorImage];
}

#pragma mark PKResChangeStyleDelegate
- (void)changeSkinStyle:(id)sender
{
}

#pragma mark - Gesture Recognizer -

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([UIDevice isHigherIOS7] && self.navPanGestureEnabled &&
        [self respondsToSelector:@selector(interactivePopGestureRecognizer)] &&
        gestureRecognizer == self.interactivePopGestureRecognizer) {
        return YES;
    }
    return NO;
}

@end