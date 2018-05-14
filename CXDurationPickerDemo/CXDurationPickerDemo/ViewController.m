/*
 * Copyright (C) 2015 Concur Technologies
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "CXDurationPickerUtils.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.picker.delegate = self;

    // Setup
    self.picker.type = CXDurationPickerTypeDuration;
    self.picker.mode = CXDurationPickerModeStartDate;
    self.picker.allowSelectionsInPast = NO;

    // Styles
    UIColor *orange = [UIColor colorWithRed:0.93 green:0.44 blue:0.0 alpha:1];
    UIColor *lightOrange = [UIColor colorWithRed:0.93 green:0.44 blue:0.0 alpha:0.5];

    self.picker.gridColor = [UIColor clearColor];
    self.picker.disabledDayBackgroundColor = [UIColor clearColor];
    self.picker.disabledDayForegroundColor = [UIColor lightGrayColor];

    self.picker.todayBackgroundColor = [UIColor clearColor];
    self.picker.todayForegroundColor = orange;

    self.picker.terminalBackgroundColor = orange;
    self.picker.transitBackgroundColor = lightOrange;
    self.picker.transitForegroundColor = [UIColor blackColor];
    self.picker.dayForegroundColor = [UIColor blackColor];
}

#pragma mark - CXDurationPickerViewDelegate

- (void)durationPicker:(CXDurationPickerView *)durationPicker startDateChanged:(CXDurationPickerDate)pickerDate {
    NSLog(@"starteDateChanged");
    self.picker.mode = CXDurationPickerModeEndDate;
    [self.picker setStartPickerDate:pickerDate withDuration:0];
}

- (void)durationPicker:(CXDurationPickerView *)durationPicker endDateChanged:(CXDurationPickerDate)pickerDate {
    NSLog(@"endDateChanged");
    self.picker.mode = CXDurationPickerModeStartDate;
}

#pragma mark - CXDurationPickerViewDelegate Optionals

- (void)durationPicker:(CXDurationPickerView *)durationPicker invalidStartDateSelected:(CXDurationPickerDate)date {
    NSLog(@"invalidStartDateSelected");
    self.picker.mode = CXDurationPickerModeEndDate;
    [self.picker setStartPickerDate:date withDuration:0];
}

- (void)durationPicker:(CXDurationPickerView *)durationPicker invalidEndDateSelected:(CXDurationPickerDate)date {
    NSLog(@"invalidEndDateSelected");
    self.picker.mode = CXDurationPickerModeStartDate;
    [self.picker setEndDate:self.picker.startDate];
    [self.picker setStartDate:date];
}

- (void)durationPicker:(CXDurationPickerView *)durationPicker didSelectDateInPast:(CXDurationPickerDate)date forMode:(CXDurationPickerMode)mode {
    NSLog(@"Date was selected in the past. Ignoring.");
}

@end
