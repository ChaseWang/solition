//
//  AppConfig.h
//  finder
//
//  Created by jianjie Wu on 4/1/13.
//  Copyright (c) 2013 jianjie Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppConfig : NSObject

- (NSString *)pushSettingEnable;
- (NSString *)udid;


// copy property
//获取设备操作系统版本号
@property (nonatomic, copy) NSString *deviceScreenBoundsRecord;
// app id
@property (nonatomic, copy) NSString *appId;
// 本应用在appStore的ID
@property (nonatomic, copy) NSString* appStoreId;
// Open Platform API Key
@property (nonatomic, copy) NSString *pubdate;
// Open Platform API Key
@property (nonatomic, copy) NSString *opApiKey;
// 3G API URL
@property (nonatomic, copy) NSString *mApiUrl;
//
@property (nonatomic, copy) NSString *talkServerAddr;
// 
@property (nonatomic, copy) NSString *talkServerPort;
// oauth url
@property (nonatomic, copy) NSString* oauthLoginURL;

@property (nonatomic, copy) NSString *priKey;

// Open Platform Secret Key
@property (nonatomic, copy) NSString *opSecretKey;
// 客户端代码，用在UA中
@property (nonatomic, copy) NSString *clientCode;
// 客户端名称，用在关于中体现
@property (nonatomic, copy) NSString *clientName;
// 客户端版本号
@property (nonatomic, copy) NSString *version;
// mcs 版本号
@property (nonatomic, copy) NSString *mcsVersion;
// 自动生成的 Git 短 Hash，用作内部版本号
@property (nonatomic, copy) NSString *autoHashVersion;
// 打包时间
@property (nonatomic, copy) NSString *autoArchiveDate;
// Client fromType.
@property (nonatomic, copy) NSString *fromType;
// Client fromID.
@property (nonatomic, copy) NSString *fromID;
// 设备型号
@property (nonatomic, copy) NSString *deviceModel;
// 数据库路径
@property (nonatomic, copy) NSString *databasePath;
// Client Info.
@property (nonatomic, strong) NSDictionary *clientInfo;
@property (nonatomic, copy) NSString *clientInfoJSONString;
@property (nonatomic, copy) NSString *clientInfoUniqkey;
//
@property (nonatomic, strong) NSString *misc;
// PushID
@property (nonatomic, assign) NSInteger pushID;

@property (nonatomic, assign) NSInteger dataVersion;
@property (nonatomic, assign) NSUInteger httpTimeout;

@property (nonatomic, copy) NSString* chatServerVersion;

@property (nonatomic, copy) NSString *helpURL;

// Wap 信息
@property (nonatomic, copy) NSString *wapInfoStage;
@property (nonatomic, copy) NSString *wapInfoDeviceId;

// UA
@property (nonatomic, copy) NSString *userAgent;

//store
@property (nonatomic, copy) NSString *emotionStoreUrl;
@property (nonatomic, copy) NSString *skinStoreUrl;
@property (nonatomic, copy) NSString *emotionRequestUrl;

//评分
@property (nonatomic, copy) NSString *appMarkUrl;

// 皮肤表情
@property (nonatomic, copy) NSString *skinVersion;
@property (nonatomic, copy) NSString *emotionVsion;

@property (nonatomic, copy) NSString *bindingUrl;
@end
