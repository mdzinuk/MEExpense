//
//  DateTextField.m
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 21/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import "DateTextField.h"
#import "AccessoryTextField.h"

@interface DateTextField()<UITextFieldDelegate>
@property (nonatomic, strong) UIDatePicker* pickerView;
@property (nonatomic, assign) NSInteger selectedIndex;
@end

@implementation DateTextField
- (void)dealloc {
    self.pickerView = nil;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
}

- (void)setup {
    [super setup];
    
    if (self.pickerView == nil) {
        self.pickerView = [[UIDatePicker alloc] init];
        self.pickerView.datePickerMode = UIDatePickerModeDateAndTime;
        self.inputView = self.pickerView;
    }
    self.delegate = self;
}

- (NSDate* )getSelectedDate {
    return self.pickerView.date;
}

- (void)setLeftText:(NSString* )text withOptions:(NSArray* )array forSelected: (NSInteger)index {
    self.text = text;
    self.selectedIndex = index;
}

- (BOOL)textField:(UITextField *)textField
shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string {
    return NO;
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ([self.textFieldDelegate respondsToSelector:@selector(textFieldDidSelectDate:)]) {
        [self.textFieldDelegate textFieldDidSelectDate: self.pickerView.date];
    }
}

@end
