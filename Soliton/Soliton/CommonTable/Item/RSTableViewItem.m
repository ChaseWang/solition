//
//  RSTableItem.m
//  RenrenSixin
//
//  Created by feng zijie on 12-4-10.
//  Copyright (c) 2012年 renren. All rights reserved.
//

#import "RSTableViewItem.h"

@implementation RSTableViewItem
@synthesize cellHeight = _cellHeight;
@synthesize userInfo = _userInfo;


- (void)actionButton:(id)sender pressedWithInfo:(NSDictionary*)info
{
    if ([self.actionButtonDelegate respondsToSelector:@selector(tableViewItem:actionButton:pressedWithInfo:)]) {
        [self.actionButtonDelegate tableViewItem:self actionButton:sender pressedWithInfo:info];
    }
}


@end
