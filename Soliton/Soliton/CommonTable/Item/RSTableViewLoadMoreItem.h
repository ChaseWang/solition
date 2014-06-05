//
//  RSTableViewLoadMoreItem.h
//  RenrenSixin
//
//  Created by feng zijie on 12-6-6.
//  Copyright (c) 2012年 renren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSTableViewItem.h"

@interface RSTableViewLoadMoreItem : RSTableViewItem


@property (nonatomic, assign) BOOL isLoading;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) BOOL isNoMoreItem;

+ (RSTableViewLoadMoreItem *)itemWithTitle:(NSString *)title;

+ (RSTableViewLoadMoreItem *)itemWithTitle:(NSString *)title isNoMore:(BOOL)isNoMore;

@end
