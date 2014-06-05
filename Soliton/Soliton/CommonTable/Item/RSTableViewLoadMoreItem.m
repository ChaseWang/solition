//
//  RSTableViewLoadMoreItem.m
//  RenrenSixin
//
//  Created by feng zijie on 12-6-6.
//  Copyright (c) 2012年 renren. All rights reserved.
//

#import "RSTableViewLoadMoreItem.h"

@implementation RSTableViewLoadMoreItem
@synthesize isLoading = _isLoading;
@synthesize title = _title;
@synthesize isNoMoreItem = _isNoMoreItem;

+ (RSTableViewLoadMoreItem *)itemWithTitle:(NSString *)title
{
	RSTableViewLoadMoreItem *item = [[RSTableViewLoadMoreItem alloc] init];
	item.title = title;
	return item;
}

+ (RSTableViewLoadMoreItem *)itemWithTitle:(NSString *)title isNoMore:(BOOL)isNoMore
{
	RSTableViewLoadMoreItem *item = [[RSTableViewLoadMoreItem alloc] init];
	item.title = title;
    item.isNoMoreItem = isNoMore;
	return item;
}

@end
