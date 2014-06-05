//
//  RSTableItem.h
//  RenrenSixin
//
//  Created by feng zijie on 12-4-10.
//  Copyright (c) 2012年 renren. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RSTableViewItem;
@protocol RSTableViewItemActionButtonDelegate <NSObject>

- (void)tableViewItem:(RSTableViewItem*)item actionButton:(id)sender pressedWithInfo:(NSDictionary*)info;

@end

@interface RSTableViewItem : NSObject

@property (nonatomic, assign) float cellHeight;	// 缓存cell的高度,主要用于高度可变的cell

@property (nonatomic, strong) id userInfo;		// 用户数据

@property (nonatomic, weak) id<RSTableViewItemActionButtonDelegate>actionButtonDelegate;


- (void)actionButton:(id)sender pressedWithInfo:(NSDictionary*)info;

@end
