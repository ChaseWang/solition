//
//  AppUser.m
//  finder
//
//  Created by jianjie Wu on 4/1/13.
//  Copyright (c) 2013 jianjie Wu. All rights reserved.
//

#import "AppUser.h"

// 公共目录名
#define kCommonDir              @"common"
// 表情目录名
#define kEmotionDir             @"emotion"

// 7.0 之前版本最后登陆ID存储
#define kLastLoginUserIdLowerV7        @"kLastLoginUserId"

// 7.0 之前版本持久化文件名
#define kMainUserFileNameLowerV7       @"user"

@interface AppUserLowerV7 : NSObject <NSCoding>

@property (nonatomic, copy) NSNumber *userId;
@property (nonatomic, copy) NSString* username;
@property (nonatomic, copy) NSString * sessionKey;
@property (nonatomic, copy) NSString * secretKey;
@property (nonatomic, copy) NSString * ticket;
@property (nonatomic, copy) NSString* loginEmail;
@property (nonatomic, assign) BOOL needComplete;

@end

@implementation AppUserLowerV7

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.userId forKey:@"userId"];
    [aCoder encodeObject:self.username forKey:@"userName"];
    [aCoder encodeObject:self.ticket forKey:@"mticket"];
    [aCoder encodeObject:self.sessionKey forKey:@"msessionKey"];
    [aCoder encodeObject:self.secretKey forKey:@"mprivateSecretKey"];
    [aCoder encodeObject:self.loginEmail forKey:@"loginAccount"];
    [aCoder encodeBool:self.needComplete forKey:@"checkIsNewUser"];
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.userId = [aDecoder decodeObjectForKey:@"userId"];
		self.username = [aDecoder decodeObjectForKey:@"userName"];
        self.ticket = [aDecoder decodeObjectForKey:@"mticket"];
        self.sessionKey = [aDecoder decodeObjectForKey:@"msessionKey"];
        self.secretKey = [aDecoder decodeObjectForKey:@"mprivateSecretKey"];
        self.loginEmail = [aDecoder decodeObjectForKey:@"loginAccount"];
        self.needComplete = [aDecoder decodeBoolForKey:@"checkIsNewUser"];
    }
    
    return self;
}

@end

@interface AppUser (Update)

+ (NSString *)lowerV7UserpersistPath:(NSString *)uID;

@end

@implementation AppUser

- (id)init
{
    if (self = [super init]) {
        //默认开启小黄鸡插件
    }
    return self;
}

#pragma mark - NSCoding methods

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:[NSNumber numberWithLongLong:self.userID] forKey:@"userID"];
    [aCoder encodeObject:[NSNumber numberWithBool:self.needComplete] forKey:@"needComplete"];
    [aCoder encodeObject:self.username forKey:@"username"];

    [aCoder encodeObject:self.sessionKey forKey:@"sessionKey"];
    [aCoder encodeObject:self.secretKey forKey:@"secretKey"];
    [aCoder encodeObject:self.ticket forKey:@"ticket"];
    [aCoder encodeObject:self.web_ticket forKey:@"web_ticket"];
    [aCoder encodeObject:self.currentLoginDateTime forKey:@"currentLoginDateTime"];
    [aCoder encodeObject:self.headUrl forKey:@"headUrl"];

    [aCoder encodeObject:self.loginEmail forKey:@"loginEmail"];
    [aCoder encodeObject:self.user_universties forKey:@"user_universities"];
    [aCoder encodeObject:self.gender forKey:@"gender"];
    [aCoder encodeObject:self.qrCodeUrl forKey:@"qrCodeUrl"];
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
	if (self = [self init])
    {
        self.userID = [[aDecoder decodeObjectForKey:@"userID"] longLongValue];
        self.needComplete = [[aDecoder decodeObjectForKey:@"needComplete"] boolValue];
        self.username = [aDecoder decodeObjectForKey:@"username"];
        self.sessionKey = [aDecoder decodeObjectForKey:@"sessionKey"];
        self.secretKey = [aDecoder decodeObjectForKey:@"secretKey"];
        self.ticket = [aDecoder decodeObjectForKey:@"ticket"];
        self.web_ticket = [aDecoder decodeObjectForKey:@"web_ticket"];
        self.currentLoginDateTime = [aDecoder decodeObjectForKey:@"currentLoginDateTime"];
        self.headUrl = [aDecoder decodeObjectForKey:@"headUrl"];

        self.loginEmail = [aDecoder decodeObjectForKey:@"loginEmail"];
        self.user_universties = [aDecoder decodeObjectForKey:@"user_universities"];
        self.gender = [aDecoder decodeObjectForKey:@"gender"];
        
        self.qrCodeUrl = [aDecoder decodeObjectForKey:@"qrCodeUrl"];
        //主用户个人信缓存
        self.preferPictureDate = [aDecoder decodeObjectForKey:@"preferPictureDate"];
 
        self.appToken = [aDecoder decodeObjectForKey:@"appToken"];
    }
	return self;
}

- (NSString *)userVideoPicturePath
{
    NSString *path = [[self userDocumentPath] stringByAppendingPathComponent:@"shortVideo/pictures"];
    [self createFilePath:path];
    return path;
}

- (NSString *)userVideoPath
{
    NSString *path = [[self userDocumentPath] stringByAppendingPathComponent:@"shortVideo"];
    [self createFilePath:path];
    return path;
}

// 用户路径
- (NSString *)userDocumentPath
{
    NSString *path = [[AppUser documentPath] stringByAppendingPathComponent:[[NSNumber numberWithLongLong:self.userID] stringValue]];
    [self createFilePath:path];
    return path;
}

- (BOOL)createFilePath:(NSString *)path
{
    NSFileManager *fileMgr = [NSFileManager defaultManager];

    if (![fileMgr fileExistsAtPath:path]) {
        NSError *error = nil;
        [fileMgr  createDirectoryAtPath:path
            withIntermediateDirectories:YES
                             attributes:nil
                                  error:&error];

        if (error) {
            return NO;
        }
    }
    return YES;
}

// App Document 路径
+ (NSString *)documentPath
{
    NSArray  *searchPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [searchPath objectAtIndex:0];

    return path;
}

// 公共文件夹路径
+ (NSString *)commonPath
{
    NSString *path = [[AppUser documentPath] stringByAppendingPathComponent:kCommonDir];

    NSFileManager *fileMgr = [NSFileManager defaultManager];

    if (![fileMgr fileExistsAtPath:path]) {
        NSError *error = nil;
        [fileMgr  createDirectoryAtPath:path
            withIntermediateDirectories:YES
                             attributes:nil
                                  error:&error];

        if (error) {
//            LOG_INFO(@"创建 commonPath 失败 %@", error);
        }
    }

    return path;
}

// 表情文件夹路径
+ (NSString *)emotionPath
{
    NSString *path = [[AppUser commonPath] stringByAppendingPathComponent:kEmotionDir];
    
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    
    if (![fileMgr fileExistsAtPath:path]) {
        NSError *error = nil;
        [fileMgr  createDirectoryAtPath:path
            withIntermediateDirectories:YES
                             attributes:nil
                                  error:&error];
        
        if (error) {
            //            LOG_INFO(@"创建 commonPath 失败 %@", error);
        }
    }
    
    return path;
}

+ (BOOL)isPageUser:(NSNumber*)uid {
	NSNumber* myUid;
	if ([uid isKindOfClass:[NSString class]]) {
		myUid = [((NSString*)uid) stringToNumber];
	} else {
		myUid = uid;
	}

	long min = 600000000L;
	long max = 700000000L;
	long long lUid = [myUid longLongValue];
	if(lUid >= min && lUid < max) {
		return YES;
	} else {
		return NO;
	}
}

+ (BOOL)isPublicAccount:(NSNumber *)userID
{
	long long longUserID = 0;
	if ([userID isKindOfClass:[NSString class]]) {
		longUserID = [[((NSString*)userID) stringToNumber] longLongValue];
	} else {
		longUserID = [userID longLongValue];
	}

	long min = 629999999L;
	long max = 640000000L;
	if(min < longUserID && longUserID < max) {
		return YES;
	} else {
		return NO;
	}
}


+ (BOOL)isMainUser:(NSNumber*)uid {
    return YES;
}


- (NSString *)sessionKey{
    if (!_sessionKey) {
        return @"";
    }
    
    return _sessionKey;
}

- (NSString *)secretKey{
    if (!_secretKey) {
        return @"";
    }
    
    return _secretKey;
}


// 是否登录
- (BOOL)isLogin{
    if (self.sessionKey.length > 0 && self.secretKey && self.secretKey.length > 0) {
        return YES;
    }
    return NO;
}

// 主用户注销 Cookie
- (void)clearCookie{
    NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (NSHTTPCookie *cookie in [cookieJar cookies]) {
        [cookieJar deleteCookie:cookie];
    }
}

+ (BOOL)isNeedUpdateFromLowerV7{
    NSNumber *fromUserId = [[NSUserDefaults standardUserDefaults] objectForKey:kLastLoginUserIdLowerV7];
    
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    NSString *fromUserPersistPath = [AppUser lowerV7UserpersistPath:[fromUserId stringValue]];
    if (fromUserId && [fileMgr fileExistsAtPath:fromUserPersistPath]) {
        return YES;
    }
    
    return NO;
}

+ (NSString *)lowerV7UserpersistPath:(NSString *)uID{
    NSString *documentDirectory = [AppUser documentPath];
    NSString *dirPath = [documentDirectory stringByAppendingPathComponent:uID];
    
    NSString *path = [dirPath stringByAppendingPathComponent:kMainUserFileNameLowerV7];
    return path;
}

- (void)updateFromLowerV7{
    NSNumber *fromUserId = [[NSUserDefaults standardUserDefaults] objectForKey:kLastLoginUserIdLowerV7];
    
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    NSString *fromUserPersistPath = [AppUser lowerV7UserpersistPath:[fromUserId stringValue]];
    
    if (![fileMgr fileExistsAtPath:fromUserPersistPath]) {
        return;
    }
    
    [NSKeyedUnarchiver setClass:[AppUserLowerV7 class] forClassName:@"RCMainUser"];
    AppUserLowerV7 *olderUser = [NSKeyedUnarchiver unarchiveObjectWithFile:fromUserPersistPath];
    if (!olderUser) {
        return;
    }
    
    self.userID = [olderUser.userId longLongValue];
    self.ticket = olderUser.ticket;
    self.sessionKey = olderUser.sessionKey;
    self.secretKey = olderUser.secretKey;
    self.loginEmail = olderUser.loginEmail;
    self.needComplete = olderUser.needComplete;
}

- (void)loadUserInfo{
}

- (void)registerCookie{
}

@end
