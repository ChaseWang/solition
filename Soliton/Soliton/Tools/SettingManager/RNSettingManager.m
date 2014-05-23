//
//  RNSettingManager.m
//  RRSpring
//
//  Created by sheng siglea on 5/9/12.
//  Copyright (c) 2012 RenRen.com. All rights reserved.
//

#import "RNSettingManager.h"

#define kNewsfeedFocusPushValue       @"kNewsfeedFocusPush_preference_private"
#define kforbidStrangerNotifyValue    @"kforbidStrangerNotifyValue"
#define kforbidStrangerValue          @"kforbidStrangerValue"
#define kLastUserAccount              @"lastUserAccount"
#define kLoginedUserAccountList       @"loginedUserAccountList"
// 是否展示过最新版本新功能介绍
#define kIsFirstInstallFeShowed       @"first_run_v%@"

#define kNewsfeedPhotoMode            @"kNewsfeedPhotoMode"
#define kPhotoModeAlertShowed         @"kPhotoModeAlertShowed"
#define kPhotoUploadMode              @"kPhotoUploadMode"
#define kFriendRequestPrivacyMode     @"kFriendRequestPrivacyMode"
#define kSyncContactEnable            @"kSyncContactEnable"
#define kSyncContactCompleted         @"kSyncContactCompleted"
#define kAntiDisturbEnable            @"kAntiDisturbEnable"
#define kAntiDisturbTimeValue         @"antiDisturbTimeValue_preference_pbulic"
#define kAntiDisturbTimeValueDefault  [NSArray arrayWithObjects:@"00:00", @"08:00", nil]
#define kVibrationEnable              @"kVibrationEnable"
#define kVoiceEnable                  @"kVoiceEnable"
#define kFocusFriendNoticeEnable      @"kFocusFriendNoticeEnable"
#define kPhotosUploadNoticeEnable     @"kPhotosUploadNoticeEnable"
#define kPagePlugEnable               @"kPagePlugEnable"
#define kDIYEmotionPluginEnable       @"kDIYEmotionPluginEnable"
#define kBindMobileCompleted          @"kBindMobileCompleted"
#define kBindMobileFirst              @"kBindMobileFirst"
#define kBindMobileNumber             @"kBindMobileNumber"
#define kAddressBookMatchingEnable    @"kAddressBookMatchingEnable"
#define kPositionSharedEnbale         @"kPositionSharedEnbale"
#define kSkinNoticeShowed             @"kSkinNoticeShowed"
#define kNewFriendShowed              @"kNewFriendShowed"
#define kLastLoginUserAccountName     @"kLastLoginUserAccountName"
#define kOpenVoIPReceiverFeature      @"kOpenVoIPReceiverFeature"
#define kNeedToNotifyUserNotUsingWifi @"kNeedToNotifyUserNotUsingWifi"
#define kNightModeON                  @"kNightModeON"
#define kDIYEmotionEscapeCodes        @"kDIYEmotionEscapeCodes"
#define kHaveEnterNearby              @"haveEnterNearby"
#define kHasEnterNearby               @"hasEnterNearby"
#define kEnterTuangouTime             @"kEnterTuangouTime"
#define kEnterNearByGroupTime         @"kEnterNearByGroupTime"
#define kABHeadBirthday               @"kABHeadBirthday"
#define kABHeadSchool                 @"kABHeadSchool"
#define kABHeadHometown               @"kABHeadHometown"
#define kABHeadQQ                     @"kABHeadQQ"
#define kABHeadPersonalPage           @"kABHeadPersonalPage"
#define kABHeadShare                  @"kABHeadShare"
#define kHasEnterFindFriends          @"kHasEnterFindFriends"
#define kHasEnterSonicFriends         @"kHasEnterSonicFriends"
#define kHasEnterABHead               @"kHasEnterABHead"
#define kShareThirdPartDefaultValue   @"kShareThirdPartDefaultValue"
#define kShareThirdPartFeedId         @"kShareThirdPartFeedId"

@interface RNSettingManager ()

+ (BOOL)boolForKey:(NSString *)key;
+ (void)setBool:(BOOL)value forKey:(NSString *)key;

+ (NSInteger)integerForKey:(NSString *)key;
+ (void)setInteger:(NSInteger)value forKey:(NSString *)key;

+ (NSString *)userPrivateKey:(NSString *)key;

+ (id)defaultValueForKey:(NSString *)key;

@end

@implementation RNSettingManager

+ (BOOL)boolForKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

    if ([userDefaults objectForKey:key] != nil) {
        return [userDefaults boolForKey:key];
    }

    return [[RNSettingManager defaultValueForKey:key] boolValue];
}

+ (void)setBool:(BOOL)value forKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

    [userDefaults setBool:value forKey:key];
    [userDefaults synchronize];
}

+ (NSInteger)integerForKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

    if ([userDefaults objectForKey:key] != nil) {
        return [userDefaults integerForKey:key];
    }

    return [[RNSettingManager defaultValueForKey:key] integerValue];
}

+ (void)setInteger:(NSInteger)value forKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

    [userDefaults setInteger:value forKey:key];
    [userDefaults synchronize];
}

+ (NSString *)userPrivateKey:(NSString *)key
{
    return  [NSString stringWithFormat:@"%@%lld", key, APPCONTEXT.currentUser.userID];
}

+ (id)defaultValueForKey:(NSString *)key
{
    const NSDictionary *defaultValue = [NSDictionary dictionaryWithObjectsAndKeys:
                                        [NSNumber numberWithInt:RHCNewsFeedSmartPhoto], kNewsfeedPhotoMode,
                                        [NSNumber numberWithInt:RHCPhotoUploadNormal], kPhotoUploadMode,
                                        [NSNumber numberWithBool:YES], kVoiceEnable,
                                        [NSNumber numberWithBool:YES], kVibrationEnable,
                                        [NSNumber numberWithBool:YES],kPhotosUploadNoticeEnable,
                                        [NSNumber numberWithBool:NO], kPagePlugEnable,
                                        [NSNumber numberWithBool:YES], kFocusFriendNoticeEnable,
                                        [NSNumber numberWithBool:NO], kAntiDisturbEnable,
                                        kAntiDisturbTimeValueDefault, kAntiDisturbTimeValue,
                                        [NSNumber numberWithBool:YES], kNeedToNotifyUserNotUsingWifi,
                                        [NSNumber numberWithBool:YES], kDIYEmotionPluginEnable,
                                        [NSNumber numberWithBool:YES], kABHeadShare,
                                        [NSNumber numberWithBool:YES], kABHeadBirthday,
                                        nil];

    NSRange userIDRange = [key rangeOfString:[NSString stringWithFormat:
                                              @"%lld",
                                              APPCONTEXT.currentUser.userID]];
    NSString *defaultKey = key;
    if (userIDRange.location != NSNotFound) {
        defaultKey = [key substringToIndex:userIDRange.location];
    }

    return [defaultValue objectForKey:defaultKey];
}

+ (void)init
{
    AppUser *appUser = APPCONTEXT.currentUser;

    if ([RNSettingManager isUserLoginedWithID:appUser.userID]) {
        return;
    }

    // 新登录用户设置userID
    [RNSettingManager setLastLoginUserID:appUser.userID];

    // NOTE:
    // 新添加的设置，默认值请存放在[RNSettingManager defaultValueForKey]方法中，
    // 此处只保留为新登录用户重新设置公共的settings
    // 这样能够避免“已登录用户升级完客户端并自动登录后，新添加的设置默认值无效”的问题
    [RNSettingManager setVoiceEnable:[[RNSettingManager defaultValueForKey:kVoiceEnable] boolValue]];
    [RNSettingManager setVibrationEnable:[[RNSettingManager defaultValueForKey:kVibrationEnable] boolValue]];
    [RNSettingManager setPhotosUploadNoticeEnable:[[RNSettingManager defaultValueForKey:kPhotosUploadNoticeEnable] boolValue]];
}

+ (void)logout
{
    // 清理远程通知
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    [[UIApplication sharedApplication] unregisterForRemoteNotifications];

    // 重置最后登陆用户ID
    [RNSettingManager setLastLoginUserID:0];
    // 停止音频播放
    // 与用户有关的设置
    [RNSettingManager clear];

    // 清理所有本地push
    [[UIApplication sharedApplication] cancelAllLocalNotifications];

    // 清除 cookie
    NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];

    for (NSHTTPCookie *cookie in [cookieJar cookies]) {
        [cookieJar deleteCookie:cookie];
    }
}

+ (BOOL)forbidStrangerNotifiedValue
{
    return [RNSettingManager boolForKey:[RNSettingManager userPrivateKey:kforbidStrangerNotifyValue]];
}

+ (void)setForbidStrangerNotifyValue:(BOOL)value
{
    [RNSettingManager setBool:value forKey:[RNSettingManager userPrivateKey:kforbidStrangerNotifyValue]];
}

+ (BOOL)forbidStrangerValue
{
    return [RNSettingManager boolForKey:[RNSettingManager userPrivateKey:kforbidStrangerValue]];
}

+ (void)setForbidStrangerValue:(BOOL)value
{
    [RNSettingManager setBool:value forKey:[RNSettingManager userPrivateKey:kforbidStrangerValue]];
}

+ (long long)lastLoginUserID
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

    return [[userDefaults stringForKey:kLastUserAccount] longLongValue];
}

+ (void)setLastLoginUserID:(long long)userID
{
    NSNumber       *uID = [NSNumber numberWithLongLong:userID];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

    [userDefaults setObject:uID forKey:kLastUserAccount];
    [userDefaults synchronize];
    [RNSettingManager addLoginedUserID:userID];
}

// 上次登陆用户账号
+ (NSString *)lastLoginUserAccountName
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

    return [userDefaults stringForKey:kLastLoginUserAccountName];
}

+ (void)setLastLoginUserAccountName:(NSString *)name
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

    [userDefaults setObject:name forKey:kLastLoginUserAccountName];
    [userDefaults synchronize];
}

+ (NSArray *)loginedUserIDList
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:kLoginedUserAccountList];
}

+ (void)addLoginedUserID:(long long)userID
{
    if (userID <= 0) {
        return;
    }

    NSNumber *uID = [NSNumber numberWithLongLong:userID];

    NSArray        *array = [RNSettingManager loginedUserIDList];
    NSMutableArray *arrays = [NSMutableArray array];

    if (array) {
        [arrays addObjectsFromArray:array];
    }

    if ([arrays containsObject:uID]) {
        return;
    } else {
        [arrays addObject:uID];
    }

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:arrays forKey:kLoginedUserAccountList];
    [userDefaults synchronize];
}

// 用户是否曾经登陆
+ (BOOL)isUserLoginedWithID:(long long)userID
{
    NSNumber *uID = [NSNumber numberWithLongLong:userID];
    NSArray  *loginedList = [RNSettingManager loginedUserIDList];

    if (loginedList && [loginedList containsObject:uID]) {
        return YES;
    }

    return NO;
}

+ (void)clear
{
}

+ (BOOL)isFirstInstall
{
    NSString *firstRunTag = [NSString stringWithFormat:kIsFirstInstallFeShowed, APPCONTEXT.config.version];
    return [[NSUserDefaults standardUserDefaults] objectForKey:firstRunTag] ? NO : YES;
}

+ (void)setFirstInstall
{
    NSString *firstRunTag = [NSString stringWithFormat:kIsFirstInstallFeShowed, APPCONTEXT.config.version];
    [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:firstRunTag];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

///////
//// 图片设置
// 新鲜事图片模式
+ (RHCNewsFeedPhotoMode)newsfeedPhotoMode
{
    return [RNSettingManager integerForKey:[RNSettingManager userPrivateKey:kNewsfeedPhotoMode]];
}

+ (void)setNewsfeedPhotoMode:(RHCNewsFeedPhotoMode)newsfeedPhotoMode
{
    [RNSettingManager setInteger:newsfeedPhotoMode forKey:[RNSettingManager userPrivateKey:kNewsfeedPhotoMode]];
}

// 是否显示过图片模式提示
+ (BOOL)photoModeAlertShowed
{
    return [RNSettingManager boolForKey:[RNSettingManager userPrivateKey:kPhotoModeAlertShowed]];
}

+ (void)setPhotoModeAlertShowed:(BOOL)showed
{
    [RNSettingManager setBool:showed forKey:[RNSettingManager userPrivateKey:kPhotoModeAlertShowed]];
}

// 图片上传模式
+ (RHCPhotoUploadMode)photoUploadMode
{
    return [RNSettingManager integerForKey:[RNSettingManager userPrivateKey:kPhotoUploadMode]];
}

+ (void)setPhotoUploadMode:(RHCPhotoUploadMode)photoUploadMode
{
    [RNSettingManager setInteger:photoUploadMode forKey:[RNSettingManager userPrivateKey:kPhotoUploadMode]];
}

//// 隐私设置
// 好友申请隐私
+ (RHCFriendRequestPrivacyMode)friendRequestPrivacyMode
{
    return [RNSettingManager integerForKey:[RNSettingManager userPrivateKey:kFriendRequestPrivacyMode]];
}

+ (void)setFriendRequestPrivacyMode:(RHCFriendRequestPrivacyMode)friendRequestPrivacyMode
{
    [RNSettingManager setInteger:friendRequestPrivacyMode forKey:[RNSettingManager userPrivateKey:kFriendRequestPrivacyMode]];
}

// 手机通讯录同步
+ (BOOL)syncContactEnable
{
    return [RNSettingManager boolForKey:[RNSettingManager userPrivateKey:kSyncContactEnable]];
}

+ (void)setSyncContactEnable:(BOOL)enable
{
    [RNSettingManager setBool:enable forKey:[RNSettingManager userPrivateKey:kSyncContactEnable]];
}

// 手机通讯录同步完成
+(BOOL)syncContactCompleted
{
    return [RNSettingManager boolForKey:[RNSettingManager userPrivateKey:kSyncContactCompleted]];
}

+(void)setSyncContactCompleted:(BOOL)completed
{
    [RNSettingManager setBool:completed forKey:[RNSettingManager userPrivateKey:kSyncContactCompleted]];
}

/// 消息设置
// 防打扰模式开关
+ (BOOL)antiDisturbEnable
{
    return [RNSettingManager boolForKey:[RNSettingManager userPrivateKey:kAntiDisturbEnable]];
}

+ (void)setAntiDisturbEnable:(BOOL)enable
{
    [RNSettingManager setBool:enable forKey:[RNSettingManager userPrivateKey:kAntiDisturbEnable]];

    if (!enable) {
        [RNSettingManager setAntiDisturbTimeValue:kAntiDisturbTimeValueDefault];
    }
}

// 防打扰时间段
+ (NSArray *)antiDisturbTimeValue
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString       *key = [RNSettingManager userPrivateKey:kAntiDisturbTimeValue];

    if ([userDefaults objectForKey:key] != nil) {
        return [userDefaults objectForKey:key];
    }

    return [RNSettingManager defaultValueForKey:key];
}

+ (void)setAntiDisturbTimeValue:(NSArray *)value
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

    [userDefaults setObject:value forKey:[RNSettingManager userPrivateKey:kAntiDisturbTimeValue]];
    [userDefaults synchronize];
}

+ (BOOL)isInAntiDisturbTime
{
    BOOL isInAntiDisturb = NO;

    NSArray  *antiDisturbTimeValue = [RNSettingManager antiDisturbTimeValue];
    NSArray *startTime = [antiDisturbTimeValue[0] componentsSeparatedByString:@":"];
    NSArray *endTime = [antiDisturbTimeValue[1] componentsSeparatedByString:@":"];
    if (2 != startTime.count || 2 != endTime.count) {
        return isInAntiDisturb;
    }

    // 获取防打扰时间
    NSInteger startHour = [startTime[0] integerValue];
    NSInteger startMinute = [startTime[1] integerValue];
    NSInteger endHour = [endTime[0] integerValue];
    NSInteger endMinute = [endTime[1] integerValue];
    // 获取当前时间
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *dateComponent = [[NSCalendar currentCalendar] components:unitFlags fromDate:[NSDate date]];
    NSInteger currentHour = [dateComponent hour];
    NSInteger currentMinute = [dateComponent minute];
    // 将时间转换为数字
    NSUInteger startHourMinute = startHour * 100 + startMinute;
    NSUInteger endHourMinute = endHour * 100 + endMinute;
    NSUInteger currentHourMinute = currentHour * 100 + currentMinute;
    // 判断是否在防打扰时间内
    if ((startHour < endHour)
        || (startHour == endHour && startMinute < endMinute)) {
        if (currentHourMinute >= startHourMinute && currentHourMinute <= endHourMinute) {
            isInAntiDisturb = YES;
        } else {
            isInAntiDisturb = NO;
        }
    } else if ((startHour > endHour)
               || (startHour == endHour && startMinute > endMinute)) {
        if (currentHourMinute <= startHourMinute && currentHourMinute >= endHourMinute) {
            isInAntiDisturb = YES;
        } else {
            isInAntiDisturb = NO;
        }
    } else {
        isInAntiDisturb = NO;
    }

    return isInAntiDisturb;
}

// 震动设置
+ (BOOL)vibrationEnable
{
    return [RNSettingManager boolForKey:kVibrationEnable];
}

+ (void)setVibrationEnable:(BOOL)enable
{
    [RNSettingManager setBool:enable forKey:kVibrationEnable];
}

// 声音设置
+ (BOOL)voiceEnable
{
    return [RNSettingManager boolForKey:kVoiceEnable];
}

+ (void)setVoiceEnable:(BOOL)enable
{
    [RNSettingManager setBool:enable forKey:kVoiceEnable];
}

// 特别关注新鲜事提醒开关
+ (BOOL)focusFriendNoticeEnable
{
    return [RNSettingManager boolForKey:[RNSettingManager userPrivateKey:kFocusFriendNoticeEnable]];
}

+ (void)setFocusFriendNoticeEnable:(BOOL)enable
{
    [RNSettingManager setBool:enable forKey:[RNSettingManager userPrivateKey:kFocusFriendNoticeEnable]];
}

+ (BOOL)photosUploadNoticeEnable{
    return [RNSettingManager boolForKey:[RNSettingManager userPrivateKey:kPhotosUploadNoticeEnable]];
}

+ (void)setPhotosUploadNoticeEnable:(BOOL)enable{
    [RNSettingManager setBool:enable forKey:[RNSettingManager userPrivateKey:kPhotosUploadNoticeEnable]];
}
/// 插件系统
// 公共主页
+ (BOOL)pagePlugEnable
{
    return [RNSettingManager boolForKey:[RNSettingManager userPrivateKey:kPagePlugEnable]];
}

+ (void)setPagePlugEnable:(BOOL)enable
{
    [RNSettingManager setBool:enable forKey:[RNSettingManager userPrivateKey:kPagePlugEnable]];
}

//跨平台分享红点标示
+ (void)setShareThirdPartDefaultValue:(BOOL)enable{
    [RNSettingManager setBool:enable forKey:[RNSettingManager userPrivateKey:kShareThirdPartDefaultValue]];
}

+ (BOOL)shareThirdPartDefaultValue{
    return [RNSettingManager boolForKey:[RNSettingManager userPrivateKey:kShareThirdPartDefaultValue]];
}

+ (void)setShareThirdPartFeedId:(NSNumber *)feedId{
    if (feedId) {
        [[NSUserDefaults standardUserDefaults] setObject:feedId forKey:[RNSettingManager userPrivateKey:kShareThirdPartFeedId]];
        return;
    }
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:[RNSettingManager userPrivateKey:kShareThirdPartFeedId]];
}

+ (id)shareThirdPartFeedId{
    return [[NSUserDefaults standardUserDefaults] objectForKey:[RNSettingManager userPrivateKey:kShareThirdPartFeedId]];
}

// DIY表情
+ (BOOL)diyEmotionPlugEnable
{
    return [RNSettingManager boolForKey:[RNSettingManager userPrivateKey:kDIYEmotionPluginEnable]];
}

+ (void)setDIYEmotionPlugEnable:(BOOL)enable
{
    [RNSettingManager setBool:enable forKey:[RNSettingManager userPrivateKey:kDIYEmotionPluginEnable]];
}

// 手机号绑定
+ (BOOL)bindMobileCompleted
{
    return [RNSettingManager boolForKey:[RNSettingManager userPrivateKey:kBindMobileCompleted]];
}

+ (void)setBindMobileCompleted:(BOOL)isCompleted
{
    [RNSettingManager setBool:isCompleted forKey:[RNSettingManager userPrivateKey:kBindMobileCompleted]];
}

+ (BOOL)bindMobileFirst
{
    return [RNSettingManager boolForKey:[RNSettingManager userPrivateKey:kBindMobileFirst]];
}

+ (void)setBindMobileFirst:(BOOL)isFirst
{
    [RNSettingManager setBool:isFirst forKey:[RNSettingManager userPrivateKey:kBindMobileFirst]];
}

+ (NSString *)bindMobileNumber
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString       *key = [RNSettingManager userPrivateKey:kBindMobileNumber];

    return [userDefaults objectForKey:key];
}

+ (void)setBindMobileNumber:(NSString *)number
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

    [userDefaults setObject:number forKey:[RNSettingManager userPrivateKey:kBindMobileNumber]];
    [userDefaults synchronize];
}

// 通讯录数据匹配
+ (BOOL)addressBookMatchingEnable
{
    return [RNSettingManager boolForKey:[RNSettingManager userPrivateKey:kAddressBookMatchingEnable]];
}

+ (void)setAddressBookMatchingEnable:(BOOL)enable
{
    [RNSettingManager setBool:enable forKey:[RNSettingManager userPrivateKey:kAddressBookMatchingEnable]];
}

//设置通讯录导头像的导入项
+(BOOL)abHeadBirthdayEnable
{
    return [RNSettingManager boolForKey:[RNSettingManager userPrivateKey:kABHeadBirthday]];
}

+(void)setABHeadBirthdayEnable:(BOOL)enable
{
    [RNSettingManager setBool:enable forKey:[RNSettingManager userPrivateKey:kABHeadBirthday]];
}

+(BOOL)abHeadSchoolEnable
{
    return [RNSettingManager boolForKey:[RNSettingManager userPrivateKey:kABHeadSchool]];
}

+(void)setABHeadSchoolEnable:(BOOL)enable
{
    [RNSettingManager setBool:enable forKey:[RNSettingManager userPrivateKey:kABHeadSchool]];
}

+(BOOL)abHeadHometownEnable
{
    return [RNSettingManager boolForKey:[RNSettingManager userPrivateKey:kABHeadHometown]];
}

+(void)setABHeadHometownEnable:(BOOL)enable
{
    [RNSettingManager setBool:enable forKey:[RNSettingManager userPrivateKey:kABHeadHometown]];
}

+(BOOL)abHeadQQEnable
{
    return [RNSettingManager boolForKey:[RNSettingManager userPrivateKey:kABHeadQQ]];
}

+(void)setABHeadQQEnable:(BOOL)enable
{
    [RNSettingManager setBool:enable forKey:[RNSettingManager userPrivateKey:kABHeadQQ]];
}

+(BOOL)abHeadPersonalPageEnable
{
    return [RNSettingManager boolForKey:[RNSettingManager userPrivateKey:kABHeadPersonalPage]];
}

+(void)setABHeadPersonalPageEnable:(BOOL)enable
{
    [RNSettingManager setBool:enable forKey:[RNSettingManager userPrivateKey:kABHeadPersonalPage]];
}

+(BOOL)abHeadShareEnable
{
    return [RNSettingManager boolForKey:[RNSettingManager userPrivateKey:kABHeadShare]];
}

+(void)setABHeadShareEnable:(BOOL)enable
{
    [RNSettingManager setBool:enable forKey:[RNSettingManager userPrivateKey:kABHeadShare]];
}

// 位置分享
+ (BOOL)positionSharedEnbale
{
    return [RNSettingManager boolForKey:[RNSettingManager userPrivateKey:kPositionSharedEnbale]];
}

+ (void)setPositionSharedEnable:(BOOL)enable
{
    [RNSettingManager setBool:enable forKey:[RNSettingManager userPrivateKey:kPositionSharedEnbale]];
}

// 是否现实过皮肤提醒
+ (BOOL)skinNoticeShowed
{
    return [RNSettingManager boolForKey:[RNSettingManager userPrivateKey:kSkinNoticeShowed]];
}

+ (void)setSkinNoticeShowed:(BOOL)showed
{
    [RNSettingManager setBool:showed forKey:[RNSettingManager userPrivateKey:kSkinNoticeShowed]];
}

// 开启语音通话功能
+ (BOOL)openVoIPReceiverFeature
{
    return [RNSettingManager boolForKey:[RNSettingManager userPrivateKey:kOpenVoIPReceiverFeature]];
}

+ (void)setOpenVoIPReceiverFeature:(BOOL)open
{
    [RNSettingManager setBool:open forKey:[RNSettingManager userPrivateKey:kOpenVoIPReceiverFeature]];
}

// 目前是否提示用户现在没使用wifi，会产生流量资费， for VOIP.
+(BOOL)needToNotifyUserNotUsingWifi
{
    return [RNSettingManager boolForKey:[RNSettingManager userPrivateKey:kNeedToNotifyUserNotUsingWifi]];
}

+(void)setNeedToNotifyUserNotUsingWifi:(BOOL)need
{
    [RNSettingManager setBool:need forKey:[RNSettingManager userPrivateKey:kNeedToNotifyUserNotUsingWifi]];
}

+ (BOOL)newFriendShowed
{
    return [RNSettingManager boolForKey:[RNSettingManager userPrivateKey:kNewFriendShowed]];
}

+ (void)setNewFriendShowed:(BOOL)showed
{
    [RNSettingManager setBool:showed forKey:[RNSettingManager userPrivateKey:kNewFriendShowed]];
}

+ (BOOL)nightMode
{
    return [RNSettingManager boolForKey:[RNSettingManager userPrivateKey:kNightModeON]];
}

+ (void)setNightMode:(BOOL)nightMode
{
    [RNSettingManager setBool:nightMode forKey:[RNSettingManager userPrivateKey:kNightModeON]];
}

+ (NSArray *)diyEmotionEscapeCodes
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString       *key = [RNSettingManager userPrivateKey:kDIYEmotionEscapeCodes];

    return [userDefaults objectForKey:key];
}

+ (void)setDIYEmotionEscapeCodes:(NSArray *)escapeCodes
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString       *key = [RNSettingManager userPrivateKey:kDIYEmotionEscapeCodes];

    [userDefaults setObject:escapeCodes forKey:key];
    [userDefaults synchronize];
}

+ (BOOL)hasEnterNearby
{
    return [RNSettingManager boolForKey:[RNSettingManager userPrivateKey:kHasEnterNearby]];
}

+ (void)setHasEnterNearby:(BOOL)isEnter
{
    [RNSettingManager setBool:isEnter forKey:[RNSettingManager userPrivateKey:kHasEnterNearby]];
}

+ (BOOL)hasEnterFindFriends
{
    return [RNSettingManager boolForKey:[RNSettingManager userPrivateKey:kHasEnterFindFriends]];
}

+ (void)setHasEnterFindFriends:(BOOL)isEnter
{
    [RNSettingManager setBool:isEnter forKey:[RNSettingManager userPrivateKey:kHasEnterFindFriends]];
}

+ (BOOL)hasEnterSonicFriends
{
    return [RNSettingManager boolForKey:[RNSettingManager userPrivateKey:kHasEnterSonicFriends]];
}

+ (void)setHasEnterSonicFriends:(BOOL)isEnter
{
    [RNSettingManager setBool:isEnter forKey:[RNSettingManager userPrivateKey:kHasEnterSonicFriends]];
}

+ (BOOL)hasEnterABHead
{
    return [RNSettingManager boolForKey:[RNSettingManager userPrivateKey:kHasEnterABHead]];
}

+ (void)setHasEnterABHead:(BOOL)isEnter
{
    [RNSettingManager setBool:isEnter forKey:[RNSettingManager userPrivateKey:kHasEnterABHead]];
}

+ (void)setEnterTuangouTime:(NSDate *)date
{
    NSString *key = [RNSettingManager userPrivateKey:kEnterTuangouTime];
    [[NSUserDefaults standardUserDefaults] setObject:date forKey:key];
}

+ (NSDate *)getEnterTuangouTime
{
    NSString *key = [RNSettingManager userPrivateKey:kEnterTuangouTime];
    return [[NSUserDefaults standardUserDefaults] valueForKey:key];
}

+ (void)setEnterNearByGroupTime:(NSDate *)date
{
    NSString *key = [RNSettingManager userPrivateKey:kEnterNearByGroupTime];
    [[NSUserDefaults standardUserDefaults] setObject:date forKey:key];
}

+ (NSDate *)getEnterNearByGroupTime
{
    NSString *key = [RNSettingManager userPrivateKey:kEnterNearByGroupTime];
    return [[NSUserDefaults standardUserDefaults] valueForKey:key];
}

@end
