//
//  RSTableViewKit.h
//  service
//
//  Created by zhongsheng on 12-11-27.
//  Copyright (c) 2012年 x2. All rights reserved.
//

#import "UIWindow+RscExt.h"
#import "SVPullToRefresh.h"

#import "RSSearchDisplayController.h"
#import "RSTableViewController.h"
#import "RSTableViewDataSource.h"
#import "RSTableViewItem.h"
#import "RSTableViewCell.h"
#import "RSTableViewLoadMoreItem.h"
#import "RSTableViewLoadMoreCell.h"

#import "RSBaseTableView.h"
#import "RSErrorView.h"
#import "RSTableViewSectionedDataSource.h"
#import "RSTableViewSectionObject.h"


//声音类型定义
typedef enum {
    SoundEffectType_None = 0,
    // 推送消息
    SoundEffectType_PushMessage,
    // 当前对话人消息
    SoundEffectType_CurrentMessage,
    // 发送消息
    SoundEffectType_SendMessage,
    // 刷新下拉消息
    SoundEffectType_RefreshPress,
    // 刷新松手消息
    SoundEffectType_RefreshRelease,
    // 刷新完毕消息
    SoundEffectType_RefreshFinish
} soundEffectType;



