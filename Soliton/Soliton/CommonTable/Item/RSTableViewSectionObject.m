//
//  RSSectionObject.m
//  RenrenSixin
//
//  Created by zhongsheng on 12-5-31.
//  Copyright (c) 2012年 renren. All rights reserved.
//

#import "RSTableViewSectionObject.h"

@implementation RSTableViewSectionObject
@synthesize letter = _letter;
@synthesize title = _title;
@synthesize userInfo = _userInfo;
@synthesize items = _items;
@synthesize footerTitle = _footerTitle;

// 初始化一发
- (NSMutableArray *)items
{
    if (!_items)
    {
        _items = [[NSMutableArray alloc] init];
    }
    return _items;
}
@end
