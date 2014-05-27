//
//  FHBirthDatePickerView.m
//  fastHand
//
//  Created by wangtao on 14-5-25.
//  Copyright (c) 2014年 sunyuping. All rights reserved.
//

#import "FHBirthDatePickerView.h"

static const int TOOLBARHEIGHT = 46;
static const int PICKERVIEWHEIGHT = 216;
#define currentMonth [currentMonthString integerValue]

@interface FHBirthDatePickerView()
{
    NSMutableArray *yearArray;
    NSArray *monthArray;
    NSMutableArray *DaysArray;

    NSString *currentMonthString;

    int selectedYearRow;
    int selectedMonthRow;
    int selectedDayRow;

    BOOL firstTimeLoad;
}

@property(nonatomic, strong)UIPickerView *customPicker;
@property(nonatomic, strong)UIToolbar *toolbarCancelDone;
@end

@implementation FHBirthDatePickerView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createDatePicker];
    }
    return self;
}

- (void)createDatePicker
{
    self.userInteractionEnabled = YES;

    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, PHONE_CONTENT_HEIGHT - TOOLBARHEIGHT - PICKERVIEWHEIGHT, 320, TOOLBARHEIGHT)];
    UIImage *toolBarIMG = [UIImage imageWithColor:RGBCOLOR(93, 175, 0)];

    //iOS 5
    if ([[[UIDevice currentDevice] systemVersion] floatValue] > 4.9) {

        if ([toolBar respondsToSelector:@selector(setBackgroundImage:forToolbarPosition:barMetrics:)]) {
            [toolBar setBackgroundImage:toolBarIMG forToolbarPosition:0 barMetrics:0];
        }

    } else {
        //iOS 4
        [toolBar insertSubview:[[UIImageView alloc] initWithImage:toolBarIMG] atIndex:0];
    }

    UIBarButtonItem *leftflexible = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(actionCancel:)];
    UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                              target:nil
                                                                              action:nil];
    leftflexible.tintColor = [UIColor whiteColor];

    UIBarButtonItem *doneBarItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(actionDone:)];
    doneBarItem.tintColor = [UIColor whiteColor];
    [toolBar setItems:[NSArray arrayWithObjects:leftflexible,flexItem,doneBarItem,nil]];
    self.toolbarCancelDone = toolBar;
    [self addSubview:self.toolbarCancelDone];

    self.customPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0,PHONE_CONTENT_HEIGHT - PICKERVIEWHEIGHT, 320, PICKERVIEWHEIGHT)];
    self.customPicker.showsSelectionIndicator = YES;
    self.customPicker.delegate = self;
    if ([UIDevice isHigherIOS7]){
        self.customPicker.backgroundColor = [UIColor whiteColor];
    }
    [self addSubview:self.customPicker];

    NSDate *date = [NSDate date];

    // Get Current Year
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy"];

    NSString *currentyearString = [NSString stringWithFormat:@"%@",
                                   [formatter stringFromDate:date]];

    // Get Current  Month
    [formatter setDateFormat:@"MM"];
    currentMonthString = [NSString stringWithFormat:@"%d",[[formatter stringFromDate:date]integerValue]];

    // Get Current  Date
    [formatter setDateFormat:@"dd"];
    NSString *currentDateString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];

    // PickerView -  Years data
    yearArray = [[NSMutableArray alloc]init];

    for (int i = 1900; i <= 2020 ; i++)
    {
        [yearArray addObject:[NSString stringWithFormat:@"%d",i]];
    }

    // PickerView -  Months data
    monthArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12"];

    // PickerView -  days data
    DaysArray = [[NSMutableArray alloc]init];

    for (int i = 1; i <= 31; i++)
    {
        [DaysArray addObject:[NSString stringWithFormat:@"%d",i]];
    }

    // PickerView - Default Selection as per current Date
    [self.customPicker selectRow:[yearArray indexOfObject:currentyearString] inComponent:0 animated:YES];
    [self.customPicker selectRow:[monthArray indexOfObject:currentMonthString] inComponent:1 animated:YES];
    [self.customPicker selectRow:[DaysArray indexOfObject:currentDateString] inComponent:2 animated:YES];
}


#pragma mark - UIPickerViewDelegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0)
    {
        selectedYearRow = row;
        [self.customPicker reloadAllComponents];
    }
    else if (component == 1)
    {
        selectedMonthRow = row;
        [self.customPicker reloadAllComponents];
    }
    else if (component == 2)
    {
        selectedDayRow = row;
        [self.customPicker reloadAllComponents];
    }
}

#pragma mark - UIPickerViewDatasource

- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row
          forComponent:(NSInteger)component
           reusingView:(UIView *)view {

    // Custom View created for each component
    UILabel *pickerLabel = (UILabel *)view;

    if (pickerLabel == nil) {
        CGRect frame = CGRectMake(0.0, 0.0, 50, 60);
        pickerLabel = [[UILabel alloc] initWithFrame:frame];
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont systemFontOfSize:15.0f]];
    }


    if (component == 0)
    {
        pickerLabel.text =  [yearArray objectAtIndex:row]; // Year
    }
    else if (component == 1)
    {
        pickerLabel.text =  [monthArray objectAtIndex:row];  // Month
    }
    else if (component == 2)
    {
        pickerLabel.text =  [DaysArray objectAtIndex:row]; // Date

    }

    return pickerLabel;
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0)
    {
        return [yearArray count];

    }
    else if (component == 1)
    {
        return [monthArray count];
    }
    else if (component == 2)
    { // day

        if (firstTimeLoad)
        {
            if (currentMonth == 1 || currentMonth == 3 || currentMonth == 5 || currentMonth == 7 || currentMonth == 8 || currentMonth == 10 || currentMonth == 12)
            {
                return 31;
            }
            else if (currentMonth == 2)
            {
                int yearint = [[yearArray objectAtIndex:selectedYearRow]intValue ];

                if(((yearint %4==0)&&(yearint %100!=0))||(yearint %400==0)){

                    return 29;
                }
                else
                {
                    return 28; // or return 29
                }

            }
            else
            {
                return 30;
            }

        }
        else
        {

            if (selectedMonthRow == 0 || selectedMonthRow == 2 || selectedMonthRow == 4 || selectedMonthRow == 6 || selectedMonthRow == 7 || selectedMonthRow == 9 || selectedMonthRow == 11)
            {
                return 31;
            }
            else if (selectedMonthRow == 1)
            {
                int yearint = [[yearArray objectAtIndex:selectedYearRow]intValue ];

                if(((yearint %4==0)&&(yearint %100!=0))||(yearint %400==0)){
                    return 29;
                }
                else
                {
                    return 28; // or return 29
                }
            }
            else
            {
                return 30;
            }
        }
    }else{
        return 0;
    }
}

- (void)actionCancel:(id)sender
{
    [self hidePicker];
}

- (void)actionDone:(id)sender
{
    NSString *dateString = [NSString stringWithFormat:@"%@-%@-%@",[yearArray objectAtIndex:[self.customPicker selectedRowInComponent:0]],[monthArray objectAtIndex:[self.customPicker selectedRowInComponent:1]],[DaysArray objectAtIndex:[self.customPicker selectedRowInComponent:2]]];
    NSLog(@"%@",dateString);
    self.birthdayString = dateString;
    if ([self.delegate respondsToSelector:@selector(pickerViewSelectDateDone:dateString:)]) {
        [self.delegate pickerViewSelectDateDone:self dateString:self.birthdayString];
    }
    [self hidePicker];
}

- (void)hidePicker
{
    if ([self.delegate respondsToSelector:@selector(pickerViewWillHide:)]) {
        [self.delegate pickerViewWillHide:self];
    }
    [UIView beginAnimations:@"Animation" context:nil];
	[UIView setAnimationDuration:0.3];
    [self setFrame:CGRectMake(0, PHONE_CONTENT_HEIGHT, 320, PHONE_CONTENT_HEIGHT)];
	[UIView commitAnimations];
}

- (void)showPicker
{
    if ([self.delegate respondsToSelector:@selector(pickerViewWillShow:)]) {
        [self.delegate pickerViewWillShow:self];
    }

    [UIView beginAnimations: @"Animation" context:nil];
	[UIView setAnimationDuration:0.3];
    [self setFrame:CGRectMake(0,PHONE_CONTENT_HEIGHT - self.height, 320, PHONE_CONTENT_HEIGHT)];
    [self.superview bringSubviewToFront:self];
	[UIView commitAnimations];
}

@end
