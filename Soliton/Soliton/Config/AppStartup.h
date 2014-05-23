//
//  AppStartup.h
//  RenrenOfficial-iOS-Concept
//
//  
//  Created by Will Lee on 8/8/13.
//  Copyright (c) 2013 renren. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum _AppStartupType{
    APPSTARTUP_LAUNCH,  // 正常启动
    APPSTARTUP_BACKGROUND,  // 后台启动
    APPSTARTUP_AFTER_LOGIN,   // 登录后
    APPSTARTUP_VOIP,  // VOIP电话接入
    APPSTARTUP_AFTER_VOIP, // 接听VOIP电话之后
}AppStartupType;

/**
 *	管理程序启动项的类
 *
 *  使用方法: 在 .m 文件中定义启动项执行的 block 类方法，在 startupWithType 中添加到对应类型的 block 数组中。
 */
@interface AppStartup : NSObject

+ (void)startupWithType:(AppStartupType)type;

@end
