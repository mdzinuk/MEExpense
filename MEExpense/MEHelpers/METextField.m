//
//  METextField.m
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 21/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import "METextField.h"


@interface METextField()<UIPickerViewDataSource, UIPickerViewDelegate>
#warning Will refactor later to remove unwanted code and logic.
@property (nonatomic, strong) UIPickerView* pickerView;
@property (nonatomic, strong) NSMutableArray* pickerDataArray;
@property (atomic, assign) BOOL isOptionInProgress;
@property (nonatomic, strong) UIButton* rightViewBtn;
@property (nonatomic, assign) NSInteger selectedIndex;
@end


@implementation METextField
- (void)dealloc {
    self.pickerView = nil;
    self.pickerDataArray = nil;
    self.rightViewBtn = nil;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
}

- (void)configRightView {
    if (self.rightView == nil) {
        self.rightViewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.rightViewBtn addTarget:self
                              action:@selector(selectOption:)
                    forControlEvents:UIControlEventTouchUpInside];
        [self.rightViewBtn setTitle:self.pickerDataArray[[self getSelectedOption]] forState:UIControlStateNormal];
        [self.rightViewBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.rightViewBtn.frame = CGRectMake(self.bounds.size.width - (self.bounds.size.width * 0.35),
                                             0,
                                             self.bounds.size.width * 0.35,
                                             self.bounds.size.height);
        self.rightViewBtn.backgroundColor = [UIColor lightGrayColor];
        self.rightView = self.rightViewBtn;
        self.rightViewMode = UITextFieldViewModeAlways;
    }
}

- (void)configPickerView {
    if (self.pickerView == nil) {
        self.pickerView = [[UIPickerView alloc] init];
        self.pickerView.delegate = self;
        self.pickerView.dataSource = self;
    }
}

- (void)setup {
    [super setup];
    
    [self configRightView];
    [self configPickerView];
    
    if (self.pickerDataArray == nil) {
        self.pickerDataArray = [NSMutableArray array];
    }
    // Option should not selected by default
    self.isOptionInProgress = NO;
}

- (void)setLeftText:(NSString* )text
        withOptions:(NSArray* )array
        forSelected: (NSInteger)index {
    self.text = text;
    self.pickerDataArray = [array mutableCopy];
    self.selectedIndex = index;
}

- (void)selectOption:(UIButton* )sender {
    self.isOptionInProgress = !self.isOptionInProgress;
    [self reloadAllInputViews];
}

- (void)doneBtnFromKeyboardClicked:(id)sender {
    self.isOptionInProgress = NO;
    [self reloadAllInputViews];
    
    [self resignFirstResponder];
}

- (void)reloadAllInputViews {
    if (self.isOptionInProgress) {
        self.inputView = self.pickerView;
        [self setTintColor:[UIColor clearColor]];
        [self becomeFirstResponder];
    } else {
        self.inputView = nil;
        [self setTintColor:[UIColor blueColor]];
    }
    [self.rightViewBtn setTitle:self.pickerDataArray[[self getSelectedOption]] forState:UIControlStateNormal];
    [self reloadInputViews];
}

- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.pickerDataArray.count;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.selectedIndex = row;
    [self.rightViewBtn setTitle:self.pickerDataArray[[self getSelectedOption]] forState:UIControlStateNormal];
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.pickerDataArray[row];
}

- (NSString*)getSelectedValue {
    return self.text;
}

- (NSInteger)getSelectedOption {
    return self.selectedIndex;
}

- (NSString* )getSelectionOptionValue {
    return self.pickerDataArray[[self getSelectedOption]];
}
@end
