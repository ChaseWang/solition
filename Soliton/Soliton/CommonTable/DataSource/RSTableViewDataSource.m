//
//  RSCTableViewDataSource.m
//  RenrenSixin
//
//  Created by zhongsheng on 12-5-28.
//  Copyright (c) 2012年 renren. All rights reserved.
//

#import "RSTableViewDataSource.h"
#import "RSTableViewItem.h"
#import "RSTableViewCell.h"
#import "RSBaseTableView.h"
#import "RSTableViewLoadMoreCell.h"
#import "RSTableViewLoadMoreItem.h"

@implementation RSTableViewDataSource
///////////////////////////////////////////////////////////////////////////////////////////////////

- (void)dealloc
{
    DDLogInfo(@"source name: %@",[self className]);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Class public


///////////////////////////////////////////////////////////////////////////////////////////////////
// 似乎没什么用，搜索图标是UITableViewIndexSearch
+ (NSArray*)lettersForSectionsWithSearch:(BOOL)search summary:(BOOL)summary {
    NSMutableArray* titles = [NSMutableArray array];
    if (search) {
        [titles addObject:UITableViewIndexSearch];
    }
    
    for (unichar c = 'A'; c <= 'Z'; ++c) {
        NSString* letter = [NSString stringWithFormat:@"%c", c];
        [titles addObject:letter];
    }
    
    if (summary) {
        [titles addObject:@"#"];
    }
    
    return titles;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark UITableViewDataSource


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UITableViewCell*)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id object = [self tableView:tableView objectForRowAtIndexPath:indexPath];
    
    Class cellClass = [self tableView:tableView cellClassForObject:object];
    NSString *className = [cellClass className];
    
    UITableViewCell* cell =
    (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:className];
    if (cell == nil) {
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault
                                 reuseIdentifier:className];
    }
    
    if ([cell isKindOfClass:[RSTableViewCell class]]) {
        [(RSTableViewCell*)cell setObject:object];
        [(RSTableViewCell*)cell setIndexPath:indexPath];
    }    
    [self tableView:tableView cell:cell willAppearAtIndexPath:indexPath];
    
    return cell;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSArray*)sectionIndexTitlesForTableView:(UITableView*)tableView {
    return nil;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSInteger)tableView:(UITableView*)tableView sectionForSectionIndexTitle:(NSString*)title
               atIndex:(NSInteger)sectionIndex {
    if (tableView.tableHeaderView) {
        if (sectionIndex == 0)  {
            // This is a hack to get the table header to appear when the user touches the
            // first row in the section index.  By default, it shows the first row, which is
            // not usually what you want.
            [tableView scrollRectToVisible:tableView.tableHeaderView.bounds animated:NO];
            return -1;
        }
    }
    
    NSString* letter = [title substringToIndex:1];
    NSInteger sectionCount = [tableView numberOfSections];
    for (NSInteger i = 0; i < sectionCount; ++i) {
        NSString* section  = [tableView.dataSource tableView:tableView titleForHeaderInSection:i];
        if ([section hasPrefix:letter]) {
            return i;
        }
    }
    if (sectionIndex >= sectionCount) {
        return sectionCount-1;
        
    } else {
        return sectionIndex;
    }
}

#pragma mark -
#pragma mark TTTableViewDataSource


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)tableView:(UITableView*)tableView objectForRowAtIndexPath:(NSIndexPath*)indexPath {
    return nil;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (Class)tableView:(UITableView*)tableView cellClassForObject:(id)object {

	if ([object isKindOfClass:[RSTableViewLoadMoreItem class]]) {
		return [RSTableViewLoadMoreCell class];
	}
    else if ([object isKindOfClass:[RSTableViewItem class]]) {
        return [RSTableViewCell class];
    } 
    DDLogInfo(@"=========get null cellClassObject");
    return [RSTableViewCell class];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*)tableView:(UITableView*)tableView labelForObject:(id)object {
    return @"";
    //    if ([object isKindOfClass:[TTTableTextItem class]]) {
    //        TTTableTextItem* item = object;
    //        return item.text;
    //        
    //    } else {
    //        return [NSString stringWithFormat:@"%@", object];
    //    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSIndexPath*)tableView:(UITableView*)tableView indexPathForObject:(id)object {
    return nil;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)tableView:(UITableView*)tableView cell:(UITableViewCell*)cell 
willAppearAtIndexPath:(NSIndexPath*)indexPath {
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)search:(NSString*)text {
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*)titleForLoading:(BOOL)reloading {
    if (reloading) {
        return NSLocalizedString(@"Updating...", @"");
        
    } else {
        return NSLocalizedString(@"Loading...", @"");
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIImage*)imageForEmpty {
    return [self imageForError:nil];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIImage*)titleImageForEmpty{
    return nil;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*)titleForEmpty {
    return nil;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*)subtitleForEmpty {
    return nil;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIImage*)imageForError:(NSError*)error {
    switch (error.code) {
        case NSURLErrorCancelled:
        case NSURLErrorCannotFindHost:
        case NSURLErrorCannotConnectToHost:
        case NSURLErrorNotConnectedToInternet:
            return [UIImage imageForKey:@"common_ic_wuwangluo"];
        default:
            return nil;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*)titleForError:(NSError*)error {
    NSString *title = nil;
    switch (error.code) {
        case NSURLErrorCancelled:
        case NSURLErrorCannotFindHost:
        case NSURLErrorCannotConnectToHost:
        case NSURLErrorNotConnectedToInternet:
            title = NSLocalizedString(@"网络无法连接，请检查您的网络", nil);
            break;
        case NSURLErrorTimedOut:
            title = NSLocalizedString(@"连接超时", nil);
            break;
        default:
            title = [error.userInfo objectForKey:@"error_msg"];
            if (!title)
                title = error.localizedDescription;
            break;
    }
    return title;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*)subtitleForError:(NSError*)error {
    return nil;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)empty
{
    return YES;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)buttonExecutable
{
    return NO;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIEdgeInsets)emptyViewEdgeInsets
{
    return UIEdgeInsetsZero;
}

- (void)tableViewItem:(RSTableViewItem*)item actionButton:(id)sender pressedWithInfo:(NSDictionary*)info
{
    if ([self.actionButtonDelegate respondsToSelector:@selector(dataSource:item:ofSender:withInfo:)]) {
        [self.actionButtonDelegate dataSource:self item:item ofSender:sender withInfo:info];
    }
}

@end
