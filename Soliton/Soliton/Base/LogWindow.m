//
//  LogWindow.m
//  RHCCore
//
//  Created by boyang liu on 14-3-31.
//  Copyright (c) 2014年 sunyuping. All rights reserved.
//

#import "LogWindow.h"

@interface LogWindow()<UITextViewDelegate>

@property(nonatomic,strong)UITextView *textView;
@property(nonatomic,strong)UISlider *slider;
@property(nonatomic,strong)UIButton *pasted;
@property(nonatomic,strong)UIButton *clear;

@end

@implementation LogWindow

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:1 alpha:.2];
        self.textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, frame.size.height - 30)];
        self.textView.backgroundColor = [UIColor clearColor];
        self.textView.font = [UIFont systemFontOfSize:12];
        self.textView.textColor = [UIColor redColor];
        self.textView.delegate = self;
        [self addSubview:self.textView];
        
        UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(210, 30, 200, 40)];
        slider.layer.anchorPoint = CGPointZero;
        [slider addTarget:self action:@selector(slider:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:slider];
        self.slider = slider;
        slider.transform = CGAffineTransformMakeRotation(M_PI_2);
        
        UIButton *pasted = [[UIButton alloc] initWithFrame:CGRectMake(10, frame.size.height - 30, 50, 30)];
        pasted.backgroundColor = [UIColor grayColor];
        pasted.titleLabel.font = [UIFont systemFontOfSize:13];
        [pasted setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [pasted setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [pasted setTitle:@"复制" forState:UIControlStateNormal];
        [pasted addTarget:self action:@selector(pasted:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:pasted];
        self.pasted = pasted;
        
        UIButton *clear = [[UIButton alloc] initWithFrame:CGRectMake(pasted.frame.origin.x +pasted.frame.size.width +10, frame.size.height - 30, 50, 30)];
        clear.backgroundColor = [UIColor grayColor];
        clear.titleLabel.font = [UIFont systemFontOfSize:13];
        [clear setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [clear setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [clear setTitle:@"clear" forState:UIControlStateNormal];
        [clear addTarget:self action:@selector(clear:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:clear];
        self.clear = clear;
    }
    return self;
}

- (void)clear:(id)sender{
    self.textView.text = @"";
    [self.textView scrollRangeToVisible:NSMakeRange(0,0)];
}

- (void)pasted:(id)sender{
    UIPasteboard *board  = [UIPasteboard generalPasteboard];
    board.string = self.textView.text;
}

- (void)slider:(UISlider *)slider{
    [self.textView setContentOffset:CGPointMake(0, (self.textView.contentSize.height - self.textView.height) * slider.value)];
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    return NO;
}

- (void)appendText:(NSString *)text{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *mText = self.textView.text;
        self.textView.text = [NSString stringWithFormat:@"%@\n%@",mText,text];
        [self.textView scrollRangeToVisible:NSMakeRange(mText.length, text.length)];
        if (self.textView.contentSize.height > self.textView.frame.size.height) {
            [self.slider setValue:1 animated:YES];
        }
    });
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    if (CGRectContainsPoint(self.slider.frame, point)||
        CGRectContainsPoint(self.pasted.frame, point)||
        CGRectContainsPoint(self.clear.frame, point)) {
        return [super hitTest:point withEvent:event];
    }
    return nil;
}

@end
