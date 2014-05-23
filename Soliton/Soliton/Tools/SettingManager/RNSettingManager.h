//
//  RNSettingManager.h
//  RRSpring
//
//  Created by sheng siglea on 5/9/12.
//  Updated by Will Lee 10/31/13
//  Copyright (c) 2012 RenRen.com. All rights reserved.
//
typedef enum {
	RRClientUpdateTypeNone,
	RRClientUpdateTypeForce,
	RRClientUpdateTypeOption,
    RRClientUpdateTypeMark
} RRClientUpdateType;

typedef enum {
    RHCNewsFeedLargePhoto = 1,
    RHCNewsFeedSmallPhoto = 2,
    RHCNewsFeedSmartPhoto = 3,
    RHCNewsFeedNoPhoto = 4
} RHCNewsFeedPhotoMode;

typedef enum {
    RHCPhotoUploadHD = 1,
    RHCPhotoUploadNormal = 2,
} RHCPhotoUploadMode;

typedef enum {
    RHCFriendRequestPrivacySchoolComCity = 3,
    RHCFriendRequestPrivacyAll = 99,
}RHCFriendRequestPrivacyMode;

@interface RNSettingManager : NSObject{
    
}

// 清空设置，未实现
+ (void)clear;

// 初始化设置
+ (void)init;

// 注销登录
+ (void)logout;

//跨平台分享红点标示
+ (void)setShareThirdPartDefaultValue:(BOOL)enable;
+ (BOOL)shareThirdPartDefaultValue;
+ (void)setShareThirdPartFeedId:(NSNumber *)feedId;
+ (id)shareThirdPartFeedId;

// 屏蔽陌生人提醒
+(BOOL)forbidStrangerNotifiedValue;
+(void)setForbidStrangerNotifyValue:(BOOL)value;
// 屏蔽陌生人开关
+(BOOL)forbidStrangerValue;
+(void)setForbidStrangerValue:(BOOL)value;

// 上次登录
+(long long)lastLoginUserID;
+(void)setLastLoginUserID:(long long)userID;

// 上次登陆用户账号
+(NSString *)lastLoginUserAccountName;
+(void)setLastLoginUserAccountName:(NSString *)name;

// 曾经登录用户的帐号
+(NSArray *)loginedUserIDList;
+(void)addLoginedUserID:(long long)userID;
// 用户是否曾经登陆
+(BOOL)isUserLoginedWithID:(long long)userID;

// 是否初次安装 
+(BOOL)isFirstInstall;
+(void)setFirstInstall;


//// 图片设置
// 新鲜事图片模式
+(RHCNewsFeedPhotoMode)newsfeedPhotoMode;
+(void)setNewsfeedPhotoMode:(RHCNewsFeedPhotoMode)newsfeedPhotoMode;
// 是否显示过图片模式提示
+(BOOL)photoModeAlertShowed;
+(void)setPhotoModeAlertShowed:(BOOL)showed;
// 图片上传模式
+(RHCPhotoUploadMode)photoUploadMode;
+(void)setPhotoUploadMode:(RHCPhotoUploadMode)photoUploadMode;

//// 隐私设置
// 好友申请隐私
+(RHCFriendRequestPrivacyMode)friendRequestPrivacyMode;
+(void)setFriendRequestPrivacyMode:(RHCFriendRequestPrivacyMode)friendRequestPrivacyMode;
// 手机通讯录同步
+(BOOL)syncContactEnable;
+(void)setSyncContactEnable:(BOOL)enable;

// 手机通讯录同步完成
+(BOOL)syncContactCompleted;
+(void)setSyncContactCompleted:(BOOL)completed;

/// 消息设置
// 防打扰模式开关
+(BOOL)antiDisturbEnable;
+(void)setAntiDisturbEnable:(BOOL)enable;
// 防打扰时间段
+(NSArray *)antiDisturbTimeValue;
+(void)setAntiDisturbTimeValue:(NSArray *)value;
+(BOOL)isInAntiDisturbTime;
// 震动设置
+(BOOL)vibrationEnable;
+(void)setVibrationEnable:(BOOL)enable;
// 声音设置
+(BOOL)voiceEnable;
+(void)setVoiceEnable:(BOOL)enable;
// 特别关注新鲜事提醒开关
+(BOOL)focusFriendNoticeEnable;
+(void)setFocusFriendNoticeEnable:(BOOL)enable;
//照片提醒开关
+ (BOOL)photosUploadNoticeEnable;
+ (void)setPhotosUploadNoticeEnable:(BOOL)enable;

/// 插件系统
// 公共主页
+(BOOL)pagePlugEnable;
+(void)setPagePlugEnable:(BOOL)enable;
// DIY表情
+(BOOL)diyEmotionPlugEnable;
+(void)setDIYEmotionPlugEnable:(BOOL)enable;

// 手机号绑定
+(BOOL)bindMobileCompleted;
+(void)setBindMobileCompleted:(BOOL)isCompleted;
+(BOOL)bindMobileFirst;
+(void)setBindMobileFirst:(BOOL)isFirst;
+(NSString *)bindMobileNumber;
+(void)setBindMobileNumber:(NSString *)number;

//通讯录数据匹配
+(BOOL)addressBookMatchingEnable;
+(void)setAddressBookMatchingEnable:(BOOL)enable;

//设置通讯录导头像的导入项
+(BOOL)abHeadBirthdayEnable;
+(void)setABHeadBirthdayEnable:(BOOL)enable;

+(BOOL)abHeadSchoolEnable;
+(void)setABHeadSchoolEnable:(BOOL)enable;

+(BOOL)abHeadHometownEnable;
+(void)setABHeadHometownEnable:(BOOL)enable;

+(BOOL)abHeadQQEnable;
+(void)setABHeadQQEnable:(BOOL)enable;

+(BOOL)abHeadPersonalPageEnable;
+(void)setABHeadPersonalPageEnable:(BOOL)enable;

+(BOOL)abHeadShareEnable;
+(void)setABHeadShareEnable:(BOOL)enable;
//位置分享
+(BOOL)positionSharedEnbale;
+(void)setPositionSharedEnable:(BOOL)enable;

// 是否现实过皮肤提醒
+(BOOL)skinNoticeShowed;
+(void)setSkinNoticeShowed:(BOOL)showed;

// 是否开启语音通话功能
+(BOOL)openVoIPReceiverFeature;
+(void)setOpenVoIPReceiverFeature:(BOOL)open;

// 目前是否提示用户现在没使用wifi，会产生流量资费， for VOIP.
+(BOOL)needToNotifyUserNotUsingWifi;
+(void)setNeedToNotifyUserNotUsingWifi:(BOOL)need;

+(BOOL)nightMode;
+(void)setNightMode:(BOOL)nightMode;

//是否实现过好友提醒
+(BOOL)newFriendShowed;
+(void)setNewFriendShowed:(BOOL)showed;

// DIY表情escape codes
+(NSArray *)diyEmotionEscapeCodes;
+(void)setDIYEmotionEscapeCodes:(NSArray *)escapeCodes;
+ (BOOL)hasEnterNearby;
+ (void)setHasEnterNearby:(BOOL)isEnter;
+ (BOOL)hasEnterFindFriends;
+ (void)setHasEnterFindFriends:(BOOL)isEnter;
+ (BOOL)hasEnterSonicFriends;
+ (void)setHasEnterSonicFriends:(BOOL)isEnter;
+ (BOOL)hasEnterABHead;
+ (void)setHasEnterABHead:(BOOL)isEnter;

+ (void)setEnterTuangouTime:(NSDate *)date;
+ (NSDate *)getEnterTuangouTime;
+ (void)setEnterNearByGroupTime:(NSDate *)date;
+ (NSDate *)getEnterNearByGroupTime;

@end
