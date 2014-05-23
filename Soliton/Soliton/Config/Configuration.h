//
//  Configuration.h
//  RenrenOfficial-iOS-Concept
//
//  Created by Lee on 13-11-26.
//  Copyright (c) 2013年 renren. All rights reserved .
//
#ifndef RenrenOfficial_iOS_Concept_Configuration_h
#define RenrenOfficial_iOS_Concept_Configuration_h

#import "DDLog.h"
#import "DDFileLogger.h"
#import "DDASLLogger.h"
#import "DDTTYLogger.h"

extern int ddLogLevel;

// 是否是发布版本
#define DISTRIBUTION_PACKAGE 0

#if DISTRIBUTION_PACKAGE


// 是否输出文件log
#define FILE_LOG_MODE 0
// 设置中可以修改 MCS 等服务地址
#define TEST_MCP_MODE 0

// 是否显示 Debug 内存监控git
#define DEBUG_MEMORY_MONITOR 0

// 是否显示CPU监测
#define DEBUG_CPU_MONITOR 0

// 是否显示冗余的版本信息，打包日期及commit 版本
#define DEBUG_VERBOSE_VERSION 0

#else

// 是否输出文件log
#define FILE_LOG_MODE 1
// 设置中可以修改 MCS 等服务地址
#define TEST_MCP_MODE 1

// 是否显示 Debug 内存监控git
#define DEBUG_MEMORY_MONITOR 0

// 是否显示冗余的版本信息，打包日期及commit 版本
#define DEBUG_VERBOSE_VERSION 1

//是否关闭游戏中心
#define DEBUG_CLOSE_GAME_CENTER 0

//客户端是否显示log窗口
#define DEBUG_LOG_WINDOW 1

// 是否显示CPU监测
#define DEBUG_CPU_MONITOR 0

#endif

#endif
