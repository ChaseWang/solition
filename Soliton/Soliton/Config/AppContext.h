//uto-merging RenrenOfficial-iOS-Concept.xcodeproj/project.pbxproj
//  AppContext.h
//  finder
//
//  Created by jianjie Wu on 4/1/13.
//  Copyright (c) 2013 jianjie Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SOLAppDelegate.h"

//应用相关
#import "AppNavigator.h"
#import "AppConfig.h"
#import "AppUser.h"
#import "HudHelper.h"

#define APPCONTEXT  [AppContext getInstance]


extern NSString * const kClearCacheNotification;

@interface AppContext : NSObject

@property (nonatomic, strong) AppUser *currentUser;
@property (nonatomic, readonly) AppConfig * config;
@property (nonatomic, readonly) HudHelper * hudHelper;
@property (nonatomic, readonly) PKResManager *skinManager;
//service
+ (AppContext *)getInstance;

- (void)resetForUserLogIn;
- (void)logout;

@end

