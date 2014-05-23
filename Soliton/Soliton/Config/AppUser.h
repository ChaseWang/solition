//
//  AppUser.h
//  finder
//
//  Created by jianjie Wu on 4/1/13.
//  Copyright (c) 2013 jianjie Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RNSettingManager.h"

@interface AppUser : NSObject <NSCoding>

// User Info
@property (nonatomic, assign) long long userID;
@property (nonatomic, copy) NSString* username;
@property (nonatomic, copy) NSString * sessionKey;
@property (nonatomic, copy) NSString * secretKey;
@property (nonatomic, copy) NSString * ticket;
@property (nonatomic, copy) NSString * appToken;
@property (nonatomic, copy) NSString *web_ticket;
@property (nonatomic, copy) NSString *headUrl;
@property (nonatomic, copy) NSString* sessionId;
@property (nonatomic, copy) NSString* loginEmail;
@property (nonatomic, strong) NSDate *currentLoginDateTime;
@property (nonatomic, assign) BOOL needComplete;

@property (nonatomic, strong) NSArray *user_universties;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, copy) NSDate *preferPictureDate;

@property (nonatomic, strong) NSString *qrCodeUrl;

// 用户路径
- (NSString *)userDocumentPath;

- (NSString *)userVideoPicturePath;

- (NSString *)userVideoPath;
// App Document 路径
+ (NSString *)documentPath;
// 公共文件夹路径
+ (NSString *)commonPath;
// 表情文件夹路径
+ (NSString *)emotionPath;

+ (BOOL)isPageUser:(NSNumber*)uid;

+ (BOOL)isPublicAccount:(NSNumber *)userID;

+ (BOOL)isMainUser:(NSNumber*)uid;

- (void)loadUserInfo;

// 是否登录
- (BOOL)isLogin;

// 主用户注册 Cookie
- (void)registerCookie;

// 主用户注销 Cookie
- (void)clearCookie;
@end
