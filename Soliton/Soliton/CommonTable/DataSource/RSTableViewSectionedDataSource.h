//
//  RSSectionedDataSource.h
//  RenrenSixin
//
//  Created by zhongsheng on 12-5-31.
//  Copyright (c) 2012年 renren. All rights reserved.
//

#import "RSTableViewDataSource.h"
#import "RSTableViewSectionObject.h"

#define Page_size 20

@interface RSTableViewSectionedDataSource : RSTableViewDataSource {
	NSMutableArray *_sections;
}

@property (nonatomic, strong) NSMutableArray *sections;			// RSSectionObject对象数组
@property (nonatomic, weak) NSMutableArray *firstSectionItems;	// 返回第一个section的items数组

@end