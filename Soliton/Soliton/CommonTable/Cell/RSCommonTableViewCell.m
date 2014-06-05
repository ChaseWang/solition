//
//  RSCommonTableViewCell.m
//  RenrenSixin
//
//  Created by 宗超 姚 on 8/17/12.
//  Copyright (c) 2012 renren. All rights reserved.
//

#import "RSCommonTableViewCell.h"
#import "RSCommonTableViewItem.h"

@implementation RSCommonTableViewCell
@synthesize tipsLabel = _tipsLabel;
@synthesize cellType = _cellType;

+ (CGFloat)tableView:(UITableView*)tableView rowHeightForObject:(id)object
{
    return 40;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.textLabel.font = [UIFont boldSystemFontOfSize:15.0f];
        self.detailTextLabel.font = [UIFont systemFontOfSize:15.0f];
        
        self.tipsLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 240, 15)] ;
        self.tipsLabel.font = [UIFont boldSystemFontOfSize:11.0];
        self.tipsLabel.textAlignment = UITextAlignmentLeft;
        self.tipsLabel.backgroundColor = [UIColor clearColor];
        self.tipsLabel.highlightedTextColor = [UIColor whiteColor];
        [self.contentView addSubview:self.tipsLabel];
         
        self.textLabel.shadowOffset = CGSizeMake(0, -1);
        self.detailTextLabel.shadowOffset = CGSizeMake(0, -1);
        self.tipsLabel.shadowOffset = CGSizeMake(0, -1);
        
        self.textLabel.backgroundColor = [UIColor clearColor];
        self.detailTextLabel.backgroundColor = [UIColor clearColor];
        self.tipsLabel.backgroundColor = [UIColor clearColor];

        self.textLabel.textColor = RGBCOLOR(80, 80, 80);
        self.detailTextLabel.textColor = RGBCOLOR(80, 80, 80);
        self.tipsLabel.textColor = RGBCOLOR(160, 160, 160);
    }
    return self;
}

- (void) layoutSubviews {
	[super layoutSubviews];
    CGSize maximumLabelSize = CGSizeMake(300,9999);
    CGSize expectedLabelSize = [self.textLabel.text sizeWithFont:self.textLabel.font constrainedToSize:maximumLabelSize lineBreakMode:self.textLabel.lineBreakMode];
    self.textLabel.size = expectedLabelSize;
    self.textLabel.left = self.contentView.left + 10;
    self.textLabel.adjustsFontSizeToFitWidth = NO;
    
    if ([self.tipsLabel.text length] > 0) {
        self.textLabel.top = self.contentView.top + 5;
        self.tipsLabel.left = self.textLabel.left;
        self.tipsLabel.bottom = self.contentView.bottom - 5;
    }
    if (self.accessoryView) {
        CGRect rect =  CGRectMake(0, 0, self.accessoryView.width, self.accessoryView.height);
        rect.origin.x = self.backgroundView.width - self.accessoryView.width - 10;
        self.accessoryView.frame = rect;
        self.accessoryView.centerY = self.contentView.centerY;
    } 
    if ([self.detailTextLabel.text length] > 0) {
        expectedLabelSize = [self.detailTextLabel.text sizeWithFont:self.detailTextLabel.font constrainedToSize:maximumLabelSize lineBreakMode:self.detailTextLabel.lineBreakMode];
        self.detailTextLabel.height = expectedLabelSize.height;
        self.detailTextLabel.centerY = self.contentView.centerY;
        self.detailTextLabel.textAlignment = NSTextAlignmentRight;

        CGFloat width;
        if (self.accessoryView) {
            width = self.accessoryView.left - self.detailTextLabel.left;
        }
        else {
            width = self.contentView.right - self.detailTextLabel.left - 21;
        }
        self.detailTextLabel.width = width;
        self.detailTextLabel.adjustsFontSizeToFitWidth = NO;
        self.detailTextLabel.frame = CGRectMake(self.detailTextLabel.frame.origin.x - 10, self.detailTextLabel.frame.origin.y, self.detailTextLabel.frame.size.width, self.detailTextLabel.frame.size.height);
    }
}

//cell 边框颜色
- (UIColor *)cellBorderColor
{
    return [UIColor colorWithRed:194.0f/255.0f green:196.0f/255.0f blue:204.0f/255.0f alpha:1.0f];
}

//cell底部阴影颜色
- (UIColor *)cellShadowColor
{
    return [UIColor colorWithRed:0 green:0 blue:0 alpha:0.08f];
}

//cell背景颜色
- (UIColor *)cellBackgroundViewColor
{
    return [UIColor whiteColor];
}

//选中时cell的颜色
- (UIColor *)cellSelectedBackgroundViewColor
{
    return [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.3];
}

//cell距离左右边缘宽度
- (CGFloat)cellMarginX
{
    return 10.0f;
}

- (CGFloat)cellMarginRightX
{
    return 10.0f;
}

//cell距离上下边缘高度
- (CGFloat)cellMarginY
{
    return 0.0f;
}

//描边宽度
- (CGFloat)cellBorderWidth
{
    return 1.0f;
}

//阴影高度
- (CGFloat)cellShadowHeight
{
    return 2.0f;
}

- (CGFloat)cellHeight
{
    return -1.0f;
}

- (void)setObject:(id)object
{
    [super setObject:object];
    if (object == nil) return;
    if ([_object isKindOfClass:[RSCommonTableViewItem class]])
    {
        RSCommonTableViewItem *tableItem = (RSCommonTableViewItem *)_object;
        self.cellType = tableItem.cellType;
        self.accessoryType = tableItem.accessoryType;
        self.backgroundView = [[UIView alloc]init];        
        CGFloat height = 0.0f;
        height = self.height;
        if (tableItem.cellHeight > 0.0f) {
            height = tableItem.cellHeight;
        }
        else
        {
            height = [[self class] tableView:nil rowHeightForObject:object];
        }
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.width, height)];

        UIImageView *sbv = [[UIImageView alloc]initWithFrame:self.bounds];
        if (self.cellType == RSTableViewCellTypeSingle) {
            UIImage *image = [UIImage imageForKey:@"common_cell_single"];
            [imageView setImage:[image stretchableImageWithLeftCapWidth:10 topCapHeight:10]];
            [sbv setImage:[self backGroundImage:[self cellSelectedBackgroundViewColor]]];
        }
        else if (self.cellType == RSTableViewCellTypeHead)
        {
            UIImage *image = [UIImage imageForKey:@"common_cell_top"];
            [imageView setImage:[image stretchableImageWithLeftCapWidth:10 topCapHeight:10]];
            [sbv setBackgroundColor:[self cellSelectedBackgroundViewColor]];
        }
        else if (self.cellType == RSTableViewCellTypeMiddle)
        {
            UIImage *image = [UIImage imageForKey:@"common_cell_middle"];
            [imageView setImage:[image stretchableImageWithLeftCapWidth:10 topCapHeight:10]];
            [sbv setBackgroundColor:[self cellSelectedBackgroundViewColor]];
        }
        else if (self.cellType == RSTableViewCellTypeTail)
        {
            UIImage *image = [UIImage imageForKey:@"common_cell_tail"];
            [imageView setImage:[image stretchableImageWithLeftCapWidth:10 topCapHeight:10]];
            [sbv setImage:[self backGroundImage:[self cellSelectedBackgroundViewColor]]];
        }
        else
        {
            [sbv setBackgroundColor:RGBACOLOR(0, 0, 0, 0.3)];
        }

        self.backgroundView = imageView;
        self.selectedBackgroundView = sbv;

        if (self.accessoryType == UITableViewCellAccessoryDisclosureIndicator) {
            UIImage* arrowImage  = [UIImage imageForKey:@"list_ic_arrow_right"];
            UIImage* arrowImageHL = [UIImage imageForKey:@"list_ic_arrow_right_hl"];
            self.accessoryView = [[UIImageView alloc] initWithImage:arrowImage highlightedImage:arrowImageHL] ;
            self.accessoryView.backgroundColor = self.contentView.backgroundColor;
            CGRect rect =  CGRectMake(0, 0, arrowImage.size.width, arrowImage.size.height);
            if (self.accessoryView) {
                rect.origin.x = self.contentView.width - arrowImage.size.width;
                self.accessoryView.frame = rect;
            }
        }
    }
}

- (UIImage *)backGroundImage:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, self.width, self.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);

    CGRect topRect = CGRectMake(0.0f, 0.0f, self.width, self.height - 3);
    CGContextFillRect(context, topRect);

    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGRect bottomRect = CGRectMake(0.0f, 0.0f, self.width, 3);
    CGContextFillRect(context, bottomRect);

    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return theImage;
}
@end
