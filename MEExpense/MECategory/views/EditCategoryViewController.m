//
//  EditCategoryViewController.m
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 21/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import "EditCategoryViewController.h"
#import "METextField.h"
#import "CategoryPresenter.h"


@interface EditCategoryViewController ()
@property (weak, nonatomic) IBOutlet METextField *categoryField;
@property (weak, nonatomic) IBOutlet METextField *budgetField;
@property (nonatomic, readwrite, nullable)id<MEBasePresenterProtocol, MECategoryPresenterProtocol>presenter;
@end

@implementation EditCategoryViewController
@synthesize presenter;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = (self.categoryID == nil) ? @"Add Category" : @"Edit Category";
    
    if (self.presenter != nil) {
        self.presenter = [[CategoryPresenter alloc] initWith:(id<MEBaseViewProtocol, MECategoryViewProtocol>)self];
    }
    [self.presenter startEditingWith: _categoryID];
    //[self.presenter checkLatestCurrencyRate];
}
- (IBAction)didClickOnSave:(id)sender {
    [self.presenter endEditingFor:_categoryID
                     withCategory:_categoryField.getSelectedValue
                        selection:_categoryField.getSelectedOption
                          bundget:[_budgetField.text doubleValue]
                      andCurrency:_budgetField.getSelectedOption];
}

#pragma mark --
#pragma mark -- MECategoryListViewProtocol
- (void)setCategory:(NSString* _Nonnull )name andOption:(NSArray* _Nonnull )option withIndex:(NSInteger)index {
    [self.categoryField setLeftText:name withOptions:option forSelected:index];
}
- (void)setBudget:(NSString* _Nonnull )budget andOption:(NSArray* _Nonnull )option withIndex:(NSInteger)index {
    [self.budgetField setLeftText:budget withOptions:option forSelected:index];
}

- (void)didFinishedUpdateTable:(BOOL)isSuccess {
    [self dismissViewControllerAnimated:TRUE completion:nil];
}
@end
