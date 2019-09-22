//
//  EditTransactionViewController.m
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 21/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import "EditTransactionViewController.h"
#import "RightSelectionTextField.h"
#import "DateTextField.h"
#import "TransactionPresenter.h"

@interface EditTransactionViewController()<RightSelectionTextFieldProtocol, METransactionEditViewProtocol>
@property (weak, nonatomic) IBOutlet RightSelectionTextField *categoryTextField;
@property (weak, nonatomic) IBOutlet METextField *amountTextField;
@property (weak, nonatomic) IBOutlet DateTextField *dateTextField;
@property (nonatomic, readwrite, strong, nullable)id<MEBasePresenterProtocol, METransactionPresenterProtocol>presenter;
@end


@implementation EditTransactionViewController
@synthesize presenter;

- (void)dealloc {
    self.presenter = nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.presenter != nil) {
        self.presenter = [[TransactionPresenter alloc] initWith:(id<MEBaseViewProtocol, METransactionEditViewProtocol>)self];
        [self.presenter loadCategoryList];
    }
    
    self.title = (self.transactionId == nil) ? @"Add Transaction" : @"Edit Transaction";
    [self.categoryTextField setTextFieldDelegate:(id<RightSelectionTextFieldProtocol>)self];
    [self.dateTextField setTextFieldDelegate:(id<DateTextFieldProtocol>)self];
    [self setRithtSaveButton];
}

- (void)setRithtSaveButton {
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]
                                   initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                   target:self action:@selector(didClickOnSaveButton:)];
    [self.navigationItem setRightBarButtonItem:saveButton];
}

- (void)didClickOnSaveButton:(UIBarButtonItem* )sender {
    [self.presenter endEditingFor:self.transactionId
                     withCategory:self.categoryTextField.getSelectedValue
                        selection:self.categoryTextField.getSelectedOption
                          expense:self.amountTextField.getSelectedValue.doubleValue
                         currency:self.amountTextField.getSelectedOption andExpenseDate:self.dateTextField.getSelectedDate];
}

#pragma mark --
#pragma mark -- METransactionViewProtocol
- (void)textFieldDidChangeOption:(RightSelectionTextField* )textField {
   [self.presenter didOptionChange:textField.getSelectedOption];
}
- (void)textFieldDidSelectDate:(NSDate* )date {
    [self.presenter didEditField:date];
}
#pragma mark --
#pragma mark -- METransactionViewProtocol
- (void)setPlaceHolder:(NSString* _Nonnull )placeHolder categoryList:(NSArray* _Nonnull )option withIndex:(NSInteger)index {
    [self.categoryTextField setLeftText:placeHolder withOptions:option forSelected: index];
}
- (void)setAmount:(NSString* _Nonnull )amount andCurrencyOption:(NSArray* _Nonnull )option withIndex:(NSInteger)index {
    [self.amountTextField setLeftText:amount withOptions:option forSelected: index];
}
- (void)setDate:(NSString* _Nonnull )dateString {
    [self.dateTextField setText:dateString];
}
- (void)didFinishedUpdateTable:(BOOL)isSuccess {
    if (isSuccess) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
@end
