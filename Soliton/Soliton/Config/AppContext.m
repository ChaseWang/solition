
//
//  AppContext.m
//  finder
//
//  Created by jianjie Wu on 4/1/13.
//  Copyright (c) 2013 jianjie Wu. All rights reserved.
//

#import "AppContext.h"

static AppContext *_appContext = nil;

@implementation AppContext{
    NSMutableDictionary *_contextDictionary;
}

@synthesize currentUser = _user;
@synthesize config = _config;
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

+ (AppContext *)getInstance {
    @synchronized (self) {
        
        if (!_appContext) {
            _appContext = [[self alloc] init];
        }
        return _appContext;
        
    }
}

- (id)init {
    self = [super init];
    if (self){
    }
    return self;
}

- (void)resetForUserLogIn{
    if (self.currentUser && self.currentUser.userID > 0) {
    }
}

- (void)logout{
}

@end
