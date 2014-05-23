//
//  AppStartup.m
//  RenrenOfficial-iOS-Concept
//
//  Created by Will Lee on 8/8/13.
//  Copyright (c) 2013 renren. All rights reserved.
//

#import "AppStartup.h"

typedef void (^ startupBlock)(void);

@implementation AppStartup

+ (void)startupWithType:(AppStartupType)type
{
    NSArray *startupBlocks = nil;

    switch (type) {
        case APPSTARTUP_LAUNCH:
                startupBlocks = [NSArray arrayWithObjects:
                                 [[AppStartup autoLoginBlock] copy],
                                 [[AppStartup loadUserInfo] copy],
                                 nil];
            break;

        case APPSTARTUP_BACKGROUND:
                startupBlocks = [NSArray arrayWithObjects:
                                 [[AppStartup autoLoginBlock] copy],
                                 nil];
            break;

        case APPSTARTUP_AFTER_LOGIN:
            startupBlocks = [NSArray arrayWithObjects:
                             nil];
            break;
            
        case APPSTARTUP_VOIP:
            startupBlocks = [NSArray arrayWithObjects:
                             [[AppStartup autoLoginBlock] copy],
                             nil];
            break;
            
        case APPSTARTUP_AFTER_VOIP:
            startupBlocks = [NSArray arrayWithObjects:
                             [[AppStartup autoLoginBlock] copy],
                             nil];

            break;

        default:
            break;
    }

    dispatch_queue_t startupQueue = dispatch_queue_create("com.renren.concept.startup", NULL);

    for (startupBlock startupBlock in startupBlocks) {
        dispatch_async(startupQueue, startupBlock);
    }
}

// autoLogin
+ (startupBlock)autoLoginBlock
{
    startupBlock autoLoginBlock = ^{
        NSLog(@"autoLoginBlock");
    };
    
    return autoLoginBlock;
}

//  LoadUserInfo
+ (startupBlock)loadUserInfo
{
    startupBlock loadUserInfoBlock = ^{
        NSLog(@"loadUserInfo");
    };

    return loadUserInfoBlock;
}
@end
