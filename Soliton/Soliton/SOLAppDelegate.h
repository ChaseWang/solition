//
//  SOLAppDelegate.h
//  Soliton
//
//  Created by wangtao on 14-5-22.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Configuration.h"

@interface SOLAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) DDFileLogger             *fileLogger;
@end
