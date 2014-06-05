//
//  RSSearchDisplayController.h
//  RenrenSixin
//
//  Created by feng zijie on 12-6-11.
//  Copyright (c) 2012年 renren. All rights reserved.
//
#import <Foundation/Foundation.h>

@class RSTableViewController;

@protocol RSSearchDisplayControllerDelegate <NSObject>

@optional
- (void)willBeginSearch;
- (void)willEndSearch;
- (void)willHideSearchResult;
- (void)didShowResult;

@end

@interface RSSearchDisplayController : UISearchDisplayController <UISearchDisplayDelegate>

@property (nonatomic, strong) RSTableViewController *searchResultsViewController;

@end