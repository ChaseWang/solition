//uto-merging RenrenOfficial-iOS-Concept.xcodeproj/project.pbxproj

//  AppConfig.m
//  finder
//
//  Created by jianjie Wu on 4/1/13.
//  Copyright (c) 2013 jianjie Wu. All rights reserved.
//

#import "AppConfig.h"
#import "AppKeyChain.h"

#define APPSTORE_DISTRIBUTION_BUNDLE_ID @"com.xiaonei.xiaonei"
#define INHOUSE_DISTRIBUTION_BUNDLE_ID @"com.renren.concept"

@implementation AppConfig

- (id)init {
    self = [super init];
    if (self != nil) {
        
    }
    return self;
}


-(void)initEnv
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    
    // 客户端信息
    self.appId = @"238557";
    self.opApiKey = @"375bf558b0414612a933d4f86806148a";
    self.opSecretKey = @"51a8bd6f9cb041d48407c6155ae7908b";
    self.clientCode = @"RenReniPhone2014";
    self.clientName = @"人人";
    
    //应用在appStore的ID
    self.appStoreId = @"316709252"; 
    // 应用版本
    self.version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    // 自动生成的 Git 短 Hash
    self.autoHashVersion = [infoDictionary objectForKey:@"AutoHashVersion"];
    self.autoArchiveDate = [infoDictionary objectForKey:@"AutoArchiveDate"];
    // 渠道标识
    self.fromID = @"2000505"; // 正式版 fromID
    // 发布日期
    self.pubdate = @"20120712";
    // Path for cache database file
    self.databasePath = [docDir stringByAppendingPathComponent:@"cachedb.sql"];
    // 数据版本
    self.dataVersion = 1;
    // MCS版本
    self.mcsVersion = @"1";

    self.httpTimeout = 45;
  
    // 设备型号
    self.deviceModel = [UIDevice machineModelName];
    
    // 线上环境参数
    self.mApiUrl = @"http://api.m.renren.com/api";
    self.talkServerAddr = @"talk.m.renren.com"; // 正式
    self.talkServerPort = @"25553"; // 正式
    
    //store
    self.emotionStoreUrl = @"http://ios.mt.renren.com/emtion";
    self.skinStoreUrl = @"http://ios.mt.renren.com/skin";
    self.emotionRequestUrl = @"http://ios.mt.renren.com/getcodeurl/ios";

    self.chatServerVersion = @"20";
    self.oauthLoginURL = @"https://login.renren.com";
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    NSString *DeviceScreenBounds = [NSString stringWithFormat:@"%dx%d", (int)screenBounds.size.width, (int)screenBounds.size.height];
    self.deviceScreenBoundsRecord = DeviceScreenBounds;

    self.helpURL = @"http://3g.renren.com/help/guestbook.do?";
    
    // wap页面信息
    self.wapInfoStage = @"client";
    self.wapInfoDeviceId = @"iphone_concept";
    
    // UA
    self.userAgent = [NSString stringWithFormat:@"%@/%@", self.clientCode, self.version];


    self.appMarkUrl = @"";
    
    NSString *bundleID = [infoDictionary objectForKey:@"CFBundleIdentifier"];
    if ([bundleID isEqualToString:APPSTORE_DISTRIBUTION_BUNDLE_ID]) {
        self.pushID = 11;
    }
    else if ([bundleID isEqualToString:INHOUSE_DISTRIBUTION_BUNDLE_ID]){
        self.pushID = 911;
    }
    else{
        self.pushID = 911;
    }

    self.skinVersion = @"2";
    self.emotionVsion = @"2";

    self.bindingUrl = @"https://safe.renren.com/redirect/3g/bindmobile?no_share=1&id=";
}

- (NSString *)pushSettingEnable
{
    NSString * retString = @"false";
    
    UIRemoteNotificationType notificationType = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
    if ( (UIRemoteNotificationTypeBadge & notificationType)
        || (UIRemoteNotificationTypeAlert & notificationType)) {
        retString = @"true";
    }
    
    return  retString;
}

//078374f7ab6dcd376886bf9469128ba9
//FC:25:3F:0A:FF:6F

- (NSString *)udid {
    NSString * udid = [AppKeyChain sharedUUIDString];
    if (!udid) {
        udid = @"";
    }
    return udid;
}
@end
