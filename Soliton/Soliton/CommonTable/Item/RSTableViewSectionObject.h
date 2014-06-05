//
//  RSSectionObject.h
//  RenrenSixin
//
//  Created by zhongsheng on 12-5-31.
//  Copyright (c) 2012年 renren. All rights reserved.
//

#import <Foundation/Foundation.h>
//Q: UI相关的对象，重用度不大，直接在 UITableView DataSource 实现就行
@interface RSTableViewSectionObject : NSObject 

@property (nonatomic, copy) NSString *letter;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) id userInfo;
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, copy) NSString *footerTitle;
@property (nonatomic, assign) BOOL selectAll;
@end
