//
//  RSSearchDisplayController.m
//  RenrenSixin
//
//  Created by feng zijie on 12-6-11.
//  Copyright (c) 2012年 renren. All rights reserved.
//

#import "RSSearchDisplayController.h"
#import "RSTableViewController.h"

@implementation RSSearchDisplayController

- (id)initWithSearchBar:(UISearchBar *)searchBar contentsController:(UIViewController *)controller
{
    if (self = [super initWithSearchBar:searchBar contentsController:controller]) {
        self.delegate = self;
        // 去 search bar 黑线
    }

    return self;
}

#pragma mark -
#pragma mark Private

- (void)resetResults
{
    [_searchResultsViewController cancelSearch];
    [_searchResultsViewController search:nil];
    [_searchResultsViewController viewWillDisappear:NO];
    [_searchResultsViewController viewDidDisappear:NO];
    _searchResultsViewController.tableView = nil;
}

#pragma mark -
#pragma mark UISearchDisplayDelegate

- (void)searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller
{
    // 为了UI效果
    //    [controller.searchBar setShowsCancelButton:YES animated:NO];
    for (UIView *view in controller.searchBar.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *cancelBtn = (UIButton *)view;
            cancelBtn.backgroundColor = [UIColor clearColor];
            [cancelBtn setTitle:NSLocalizedStringFromTable(@"取消", RS_CURRENT_LANGUAGE_TABLE, nil)
                       forState:UIControlStateNormal];
            [cancelBtn setTitleColor:[UIColor whiteColor]
                            forState:UIControlStateHighlighted];
            [cancelBtn.titleLabel setShadowOffset:CGSizeMake(0.0, 1.0f)];
            [cancelBtn setTitleShadowColor:[UIColor clearColor]
                                  forState:UIControlStateHighlighted];
        }
    }

    id contenstController = controller.searchContentsController;
    [_searchResultsViewController viewWillAppear:NO];

    if ([contenstController respondsToSelector:@selector(willBeginSearch)]) {
        [contenstController performSelector:@selector(willBeginSearch)];
    }
}

- (void)searchDisplayControllerDidBeginSearch:(UISearchDisplayController *)controller
{
    [_searchResultsViewController viewDidAppear:NO];
}

- (void)searchDisplayControllerWillEndSearch:(UISearchDisplayController *)controller
{
    id contenstController = controller.searchContentsController;

    if ([contenstController respondsToSelector:@selector(willEndSearch)]) {
        [contenstController performSelector:@selector(willEndSearch)];
    }
}

- (void)searchDisplayControllerDidEndSearch:(UISearchDisplayController *)controller
{
    [self resetResults];
}

- (void)searchDisplayController:(UISearchDisplayController *)controller didLoadSearchResultsTableView:(UITableView *)tableView
{
}

- (void)searchDisplayController:(UISearchDisplayController *)controller willUnloadSearchResultsTableView:(UITableView *)tableView
{
}

- (void)searchDisplayController:(UISearchDisplayController *)controller didShowSearchResultsTableView:(UITableView *)tableView
{
    _searchResultsViewController.tableView = tableView;
    _searchResultsViewController.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_searchResultsViewController viewWillAppear:NO];
    [_searchResultsViewController viewDidAppear:NO];
}

- (void)searchDisplayController:(UISearchDisplayController *)controller willHideSearchResultsTableView:(UITableView *)tableView
{
    [self resetResults];
    id contenstController = controller.searchContentsController;

    if ([contenstController respondsToSelector:@selector(willHideSearchResult)]) {
        [contenstController performSelector:@selector(willHideSearchResult)];
    }
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 0.001);

    dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
            for (UIView *v in self.searchResultsTableView.subviews) {
                if ([v isKindOfClass:[UILabel class]] &&
                [[(UILabel *)v text] isEqualToString:@"No Results"]) {
                    [(UILabel *)v setText: NSLocalizedStringFromTable(@"没有结果", RS_CURRENT_LANGUAGE_TABLE, nil)];
                    break;
                }
            }
        });

    [_searchResultsViewController search:searchString];
    return YES;
}

- (BOOL)    searchDisplayController:(UISearchDisplayController *)controller
    shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    [_searchResultsViewController search:self.searchBar.text];
    return YES;
}

#pragma mark - UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [_searchResultsViewController searchBarSearchButtonClicked:searchBar];
}

@end