//
//  FHBirthDatePickerView.h
//  fastHand
//
//  Created by wangtao on 14-5-25.
//  Copyright (c) 2014年 sunyuping. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FHBirthDatePickerView;
@protocol FHBirthDatePickerViewDelegate<NSObject>
@optional
- (void)pickerViewSelectDateDone:(FHBirthDatePickerView *)pickerView dateString:(NSString *)dateString;
- (void)onChangeData:(BOOL)change index:(NSInteger)index;
- (void)pickerViewWillShow:(FHBirthDatePickerView *)picker;
- (void)pickerViewWillHide:(FHBirthDatePickerView *)picker;
@end

@interface FHBirthDatePickerView : UIView<UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, copy)NSString *birthdayString;
@property (nonatomic, assign)id<FHBirthDatePickerViewDelegate> delegate;
- (void)showPicker;
- (void)hidePicker;
@end
