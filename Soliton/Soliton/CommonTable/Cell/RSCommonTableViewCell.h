//
//  RSCommonTableViewCell.h
//  RenrenSixin
//
//  Created by 宗超 姚 on 8/17/12.
//  Copyright (c) 2012 renren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSTableViewCell.h"

#define CELL_HORIZON_MARGIN 10

typedef enum{
    RSTableViewCellTypeNone=0,
    RSTableViewCellTypeSingle,
    RSTableViewCellTypeHead,
    RSTableViewCellTypeMiddle,
    RSTableViewCellTypeTail,
//    RSTableViewCellWithCustomColorAndAccessoryType,
}RSTableViewCellType;

@interface RSCommonTableViewCell : RSTableViewCell
{
    RSTableViewCellType _cellType;
    UILabel* _tipsLabel;
}

//cell 边框颜色
- (UIColor *)cellBorderColor;
//cell底部阴影颜色
- (UIColor *)cellShadowColor;
//cell背景颜色
- (UIColor *)cellBackgroundViewColor;
//选中时cell的颜色
- (UIColor *)cellSelectedBackgroundViewColor;
//cell距离左右边缘宽度
- (CGFloat)cellMarginX;
- (CGFloat)cellMarginRightX;
//cell距离上下边缘高度
- (CGFloat)cellMarginY;
//边框宽度
- (CGFloat)cellBorderWidth;
//阴影高度
- (CGFloat)cellShadowHeight;
//设置cell的高度
- (CGFloat)cellHeight;

@property (nonatomic, strong)UILabel* tipsLabel;
@property (nonatomic, assign)RSTableViewCellType cellType;
@property (nonatomic, strong) UIView *shadowView;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIView *maskPointView;
@end
