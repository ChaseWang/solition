//
//  RSBaseViewController.m
//  RenrenSixin
//
//  Created by feng zijie on 12-6-5.
//  Copyright (c) 2012年 renren. All rights reserved.
//

#import "BaseViewController.h"


@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if (self) {
//        [APPCONTEXT.languageManager addChangeLanguegeObject:self];
        [[PKResManager getInstance] addChangeStyleObject:self];
        self.canDragBack = YES;
    }

    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
//        [APPCONTEXT.languageManager addChangeLanguegeObject:self];
        [[PKResManager getInstance] addChangeStyleObject:self];
        self.canDragBack = YES;
    }

    return self;
}

- (id)init
{
    if (self = [super init]) {
//        [APPCONTEXT.languageManager addChangeLanguegeObject:self];
        [[PKResManager getInstance] addChangeStyleObject:self];
        self.canDragBack = YES;
    }

    return self;
}

- (void)dealloc
{
//    [APPCONTEXT.languageManager removeChangeLanguegeObject:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[PKResManager getInstance] removeChangeStyleObject:self];
}

- (id)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];

    if (self != nil) {
        [self parseDictionary:dic];
    }

    return self;
}

- (void)parseDictionary:(NSDictionary *)dic
{
}

// 卸载界面，用于在收到内存警告时调用
// 此方法为兼容IOS5.x和IOS6.x添加的。
- (void)unLoadViews
{
    // 子类中去实现
//    [APPCONTEXT.languageManager removeChangeLanguegeObject:self];
}

// IOS6.x 不再会调到此方法
- (void)viewDidUnload
{
    [super viewDidUnload];

    [self unLoadViews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

    // 此处做兼容处理需要加上ios6.0的宏开关，保证是在6.0下使用的,6.0以前屏蔽以下代码，否则会在下面使用self.view时自动加载viewDidLoad
    if (![self isViewLoaded]) {
        return;
    }
//
//    if ([[UIDevice currentDevice] systemVersionNotLowerThan:@"6.0"]) {
//        if (self.view.window == nil) { // 是否是正在使用的视图
//            [self unLoadViews];
//            self.view = nil;
//        }
//    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    // iOS 7 导航问题修改
    // http://stackoverflow.com/questions/18867248/restore-pre-ios7-uinavigationcontroller-pushviewcontroller-animation
    self.view.backgroundColor = self.view.backgroundColor;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        if (self.canDragBack) {
            self.navigationController.interactivePopGestureRecognizer.enabled = YES;
        }
    }
    
    // iOS 7 导航问题修改
    // http://stackoverflow.com/questions/18867248/restore-pre-ios7-uinavigationcontroller-pushviewcontroller-animation
    self.view.backgroundColor = self.view.backgroundColor;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeTop;
    }

    // 背景色
    self.view.backgroundColor = RGBCOLOR(0xfb, 0xfc, 0xfd);

    // 导航栏
    self.navigationController.navigationBarHidden = NO;

    // 返回按钮
    NSInteger x = [self.navigationController.viewControllers count];

    if (x > 1) {
        // 多余一级的时候，再创建返回按钮
        [self setLeftBarButtonItem:[BaseViewController navigationBackButtonItemWithTarget:self action:@selector(goBack)]];
    }
}

+ (UIBarButtonItem *)navigationBackButtonItemWithTarget:(id)target action:(SEL)action
{
    UIImage         *normalImage = [UIImage imageForKey:@"common_btn_back"];
    UIBarButtonItem *buttonItem = [UIBarButtonItem rsBarButtonItemWithTitle:nil
                                                                      image:normalImage
                                                           heightLightImage:nil
                                                               disableImage:nil
                                                                     target:target
                                                                     action:action];

    return buttonItem;
}

- (void)goBack
{
    [self cancelRequestIfNeed];
    [self.navigationController popViewControllerAnimated:YES];
}

//  ios6以下
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return interfaceOrientation == UIInterfaceOrientationPortrait;
}

// ios6以上
- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

- (void)setScrollsToTop:(UIScrollView *)view inSuperView:(UIView *)superView
{
    view.scrollsToTop = YES;
}

- (void)cancelRequestIfNeed
{
    // 子类中去实现
}

// 支持多语言
- (void)changeLanguageStyle:(id)sender
{
}

// 支持换肤
- (void)changeSkinStyle:(id)sender
{
}

#pragma mark NavigationColor
- (void)setNavigationBarColor:(UIColor *)navigationBarColor
{
    _navigationBarColor = navigationBarColor;
    UIImage *colorImage = [UIImage imageWithColor:_navigationBarColor];
    // 重新构造navigationBar的纯色图片
    [self.navigationController.navigationBar setNavigationBarWithImage:colorImage];
}

#pragma mark Navigation Text Button
- (void)setLeftBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    if (!barButtonItem) {
        if ([self.navigationController.viewControllers count] > 1) {
            self.navigationItem.hidesBackButton = YES;
        }
        self.navigationItem.leftBarButtonItems = nil;
        return;
    }

    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
        initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                             target:nil action:nil];

    // ios7适配
    if ([UIDevice isHigherIOS7]) {
        negativeSpacer.width = -20;
    } else {
        negativeSpacer.width = -5;
    }

    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, barButtonItem, nil];
}

- (void)setRightBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
        initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                             target:nil action:nil];

    // ios7适配
    if ([UIDevice isHigherIOS7]) {
        negativeSpacer.width = -20;
    } else {
        negativeSpacer.width = -5;
    }

    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, barButtonItem, nil];
}

- (UIBarButtonItem *)leftBarButtonItem
{
    if ((self.navigationItem.leftBarButtonItems != nil) && (self.navigationItem.leftBarButtonItems.count == 0)) {
        return nil;
    }

    return self.navigationItem.leftBarButtonItems.lastObject;
}

- (UIBarButtonItem *)rightBarButtonItem
{
    if ((self.navigationItem.rightBarButtonItem != nil) && (self.navigationItem.rightBarButtonItems.count == 0)) {
        return nil;
    }

    return self.navigationItem.rightBarButtonItems.lastObject;
}

- (void)dragBackBegin
{
}

//  根据不同设备设置不同的加载参数
- (CGFloat)getLoadingStep
{
    NSString *device = [[UIDevice machineModel] lowercaseString];

    // 4s
    if ([device rangeOfString:@"iphone4,1"].length > 0) {
        return 1;
    }

    if ([device rangeOfString:@"iphone5"].length > 0) {
        return 1;
    }

    if ([device rangeOfString:@"iphone6"].length > 0) {
        return 1;
    }

    if ([device rangeOfString:@"iphone5,2"].length > 0) {
        return 1;
    }
    if ([device rangeOfString:@"ipod5"].length > 0) {
        return 1;
    }

    return 0.4;
}

@end
