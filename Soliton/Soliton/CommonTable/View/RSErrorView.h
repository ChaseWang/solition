//
//  RSErrorView.h
//  RenrenSixin
//
//  Created by feng zijie on 12-6-4.
//  Copyright (c) 2012年 renren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RSErrorView : UIView {
    UIImageView*  _imageView;
    UILabel*      _subtitleView;
    UIButton*     _titleButton;
}

@property (nonatomic, strong) UIImage*  image;
@property (nonatomic, strong) UIImage*  titleImage;
@property (nonatomic, copy)   NSString* title;
@property (nonatomic, copy)   NSString* subtitle;

- (id)initWithTitle:(NSString*)title subtitle:(NSString*)subtitle image:(UIImage*)image;
- (id)initWithTitle:(NSString*)title subtitle:(NSString*)subtitle titleImage:(UIImage*)tImage watermarkImage:(UIImage *)wImage;
- (void)addTarget:(id)target action:(SEL)action;// forControlEvents:(UIControlEvents)controlEvents;

@end

