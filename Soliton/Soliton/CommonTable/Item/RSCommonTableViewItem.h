//
//  RSCommonTableViewItem.h
//  RenrenSixin
//
//  Created by 宗超 姚 on 8/17/12.
//  Copyright (c) 2012 renren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSTableViewItem.h"
#import "RSCommonTableViewCell.h"

//Q: 有必要用这个类？
@interface RSCommonTableViewItem : RSTableViewItem
@property (nonatomic, assign) RSTableViewCellType cellType;
@property (nonatomic, assign) UITableViewCellAccessoryType accessoryType;

@end
