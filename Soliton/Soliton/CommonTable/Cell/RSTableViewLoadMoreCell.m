//
//  RSTableViewLoadMoreCell.m
//  RenrenSixin
//
//  Created by feng zijie on 12-6-6.
//  Copyright (c) 2012年 renren. All rights reserved.
//

#import "RSTableViewLoadMoreCell.h"
#import "RSTableViewLoadMoreItem.h"

static const CGFloat kMoreButtonMargin = 40;
static const CGFloat kRowHeight = 44.0f;

@interface RSTableViewLoadMoreCell()

- (void)buildLoadingAnimationView;
- (void)buildTitleLabel;

@end

@implementation RSTableViewLoadMoreCell

@synthesize animating = _animating;

+ (CGFloat)tableView:(UITableView*)tableView rowHeightForObject:(id)object {
  return  kRowHeight;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _animating = NO;

        [self buildTitleLabel];        
        [self buildLoadingAnimationView];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryType = UITableViewCellAccessoryNone;

    }
	return self;
}

- (void)setAnimating:(BOOL)animating {
	_animating = animating;
	if (animating) {
		[_loadingAnimationView startAnimating];
	} else {
		[_loadingAnimationView stopAnimating];
	}
}

- (void)objectPropertyChanged:(NSString *)property {
   if([property isEqualToString:@"isLoading"]){
       RSTableViewLoadMoreItem *item = self.object;
       if (!item.isNoMoreItem) {
           self.animating		= item.isLoading;
       }
   }
}

- (void)startObserveObjectProperty {
    [self addObservedProperty:@"isLoading"];
}

- (void)finishObserveObjectProperty {
    [self removeObservedProperty:@"isLoading"];
}


#pragma mark- Override
- (void)layoutSubviews {
	[super layoutSubviews];

	_loadingAnimationView.left	= kMoreButtonMargin - (_loadingAnimationView.width + 6) + 80;
	_loadingAnimationView.top	= floor(self.contentView.height / 2 - _loadingAnimationView.height / 2);

//	_titleLabel.frame = CGRectMake(kMoreButtonMargin,
//			_titleLabel.top,
//			self.contentView.width - (kMoreButtonMargin + 6),
//			_titleLabel.height);

    _titleLabel.frame = CGRectMake(10, _titleLabel.top, self.contentView.width - 20, _titleLabel.height);
    _loadingAnimationView.centerY = _titleLabel.centerY;
}

- (void)setObject:(id)object
{
	if (_object != object) {
		[super setObject:object];
	}
    if (_object) {
        RSTableViewLoadMoreItem *item = _object;
        _titleLabel.text	= item.title;
        if (!item.isNoMoreItem) {
            self.animating		= item.isLoading;
        }
    }
}

#pragma mark- UI
- (void)buildLoadingAnimationView
{
	_loadingAnimationView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
	[self.contentView addSubview:_loadingAnimationView];
}

- (void)resetLoadingAnimationView:(UIActivityIndicatorView*)loadingView
{
    if (_loadingAnimationView != nil) {
        [_loadingAnimationView removeFromSuperview];
    }
    _loadingAnimationView = loadingView;
	[self.contentView addSubview:_loadingAnimationView];
}

- (void)buildTitleLabel
{
	_titleLabel = [[UILabel alloc] initWithFrame:self.contentView.bounds];
    _titleLabel.backgroundColor = [UIColor clearColor];
//	_titleLabel.autoresizingMask			= UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	_titleLabel.font						= [UIFont boldSystemFontOfSize:15];
	_titleLabel.textColor					= [UIColor lightGrayColor];
	_titleLabel.highlightedTextColor		= [UIColor whiteColor];
	_titleLabel.textAlignment				= UITextAlignmentCenter;
//	_titleLabel.lineBreakMode				= UILineBreakModeTailTruncation;
	_titleLabel.adjustsFontSizeToFitWidth	= YES;
//    [_titleLabel setTextColor:[UIColor colorForKey:@"colorOfRefreshHeaderLabel"]];
//    [_titleLabel setShadowColor:[UIColor colorForKey:@"colorOfRefreshHeaderLabelShadow"]];
    
    [self addSubview:_titleLabel];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    
}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    
}
//- (void)drawRect:(CGRect)rect {
//    
//    //分割线
////    UIColor *lineColor = [[UIColor colorForKey:@"CommonModule-colorTypeC"] colorWithAlphaComponent:0.3];
////    [lineColor setFill];
//    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextFillRect(context, CGRectMake(10, self.height - 1, self.width-20, 1));
//}
@end
