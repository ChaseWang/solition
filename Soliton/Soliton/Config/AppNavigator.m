//
//  AppNavigator.m
//  finder
//
//  Created by jianjie Wu on 4/1/13.
//  Copyright (c) 2013 jianjie Wu. All rights reserved.
//

#import "AppNavigator.h"

#import "SOLAppDelegate.h"
#import "AppNavigationController.h"

@implementation AppNavigator

@synthesize mainNav = _mainNav;

#pragma mark - instance method

+ (instancetype)navigator
{
    static AppNavigator    *navigator = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
            navigator = [[AppNavigator alloc] init];
        });

    return navigator;
}

+ (void)showModalViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSAssert([[NSThread currentThread] isEqual:[NSThread mainThread]], @"PUSH can only be started from the main thread.");
    if ([AppNavigator navigator].mainNav != nil) {
        if ([[AppNavigator navigator].mainNav presentedViewController]) {
            [[AppNavigator navigator].mainNav.presentedViewController presentViewController:viewController animated:animated completion:nil];
        } else {
            [[AppNavigator navigator].mainNav presentViewController:viewController animated:animated completion:nil];
        }
    }
}

+ (void)showModalNavigationController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSAssert([[NSThread currentThread] isEqual:[NSThread mainThread]], @"PUSH can only be started from the main thread.");
    AppNavigationController *nav = [[AppNavigationController alloc] initWithRootViewController:viewController];
    [AppNavigator showModalViewController:nav animated:animated];
}

+ (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSAssert([[NSThread currentThread] isEqual:[NSThread mainThread]], @"PUSH can only be started from the main thread.");
    UIViewController *presentCon = [[AppNavigator navigator].mainNav presentedViewController];

    if (presentCon && [presentCon isKindOfClass:[AppNavigationController class]]) {
        [(AppNavigationController *)presentCon pushViewController : viewController animated : animated];
    } else {
        [[AppNavigator navigator].mainNav pushViewController:viewController animated:animated];
    }

    [[AppNavigator navigator].mainNav.navigationBar setHidden:NO];
}

+ (void)pushViewControllerWhenClickNamecardOnCommentPage:(UIViewController *)viewController animated:(BOOL)animated
{
    NSAssert([[NSThread currentThread] isEqual:[NSThread mainThread]], @"PUSH can only be started from the main thread.");
    [[AppNavigator navigator].mainNav.visibleViewController.navigationController pushViewController:viewController animated:animated];
}

+ (void)popViewControllerAnimated:(BOOL)animated
{
    NSAssert([[NSThread currentThread] isEqual:[NSThread mainThread]], @"PUSH can only be started from the main thread.");
    UIViewController *presentCon = [[AppNavigator navigator].mainNav presentedViewController];

    if (presentCon && [presentCon isKindOfClass:[AppNavigationController class]]) {
        [(AppNavigationController *)presentCon popViewControllerAnimated : animated];
    } else {
        [[AppNavigator navigator].mainNav popViewControllerAnimated:animated];
    }
}

+ (void)popToRootViewControllerAnimated:(BOOL)animated
{
    NSAssert([[NSThread currentThread] isEqual:[NSThread mainThread]], @"PUSH can only be started from the main thread.");
    [[AppNavigator navigator].mainNav dismissViewControllerAnimated:animated completion:nil];
    [[AppNavigator navigator].mainNav popToRootViewControllerAnimated:animated];
    [[AppNavigator navigator].mainNav setNavigationBarHidden:YES animated:animated];
}

+ (void)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSAssert([[NSThread currentThread] isEqual:[NSThread mainThread]], @"PUSH can only be started from the main thread.");
    [[AppNavigator navigator].mainNav popToViewController:viewController animated:animated];
}

+ (void)openMainViewController
{
    NSAssert([[NSThread currentThread] isEqual:[NSThread mainThread]], @"PUSH can only be started from the main thread.");
//    RSTabbarViewController *vc = [[RSTabbarViewController alloc] init];
//    [AppNavigator openMainNavControllerWithRoot:vc];
}

+ (void)openLoginViewController
{
//    NSAssert([[NSThread currentThread] isEqual:[NSThread mainThread]], @"PUSH can only be started from the main thread.");
//    RHCLoginViewController *viewController = [[RHCLoginViewController alloc] init];
//    [AppNavigator openMainNavControllerWithRoot:viewController];
}

+ (void)openMainNavControllerWithRoot:(UIViewController *)rootViewController
{
//    NSAssert([[NSThread currentThread] isEqual:[NSThread mainThread]], @"PUSH can only be started from the main thread.");
//    RHCAppDelegate        *delegate = (RHCAppDelegate *)[[UIApplication sharedApplication] delegate];
//    RootNavViewController *nav = [[RootNavViewController alloc] initWithRootViewController:rootViewController];
//    delegate.window.rootViewController = nav;
//    [AppNavigator navigator].mainNav = nav;
}

+ (UIWindow *)getFirstFullScreenWindow
{
    UIWindow *onWindow = nil;
    NSArray  *windows = [UIApplication sharedApplication].windows;

    for (int i = 0; i < windows.count; i++) {
        UIWindow *window = windows[i];

        if (window.size.height == SCREEN_HEIGHT) {
            onWindow = window;
            break;
        }
    }

    return onWindow;
}

+ (void)popFromViewController:(UIViewController *)destinationViewController backToViewController:(UIViewController *)sourceViewController animated:(BOOL)animated
{
    if ([destinationViewController.navigationController.viewControllers containsObject:sourceViewController]) {
        [destinationViewController.navigationController popToViewController:sourceViewController animated:animated];
    } else {
        [destinationViewController.navigationController popToViewController:destinationViewController animated:NO];
        [destinationViewController.navigationController popViewControllerAnimated:animated];
    }
}
@end