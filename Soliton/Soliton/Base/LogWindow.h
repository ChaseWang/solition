//
//  LogWindow.h
//  RHCCore
//
//  Created by boyang liu on 14-3-31.
//  Copyright (c) 2014年 sunyuping. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <SystemConfiguration/SCNetworkConnection.h>

@interface LogWindow : UIWindow

- (void)appendText:(NSString *)text;

@end
