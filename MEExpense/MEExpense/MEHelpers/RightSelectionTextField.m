//
//  RightSelectionTextField.m
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 21/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//


#import "RightSelectionTextField.h"
@interface RightSelectionTextField()<UITextFieldDelegate>
@end


@implementation RightSelectionTextField
@synthesize textFieldDelegate;

- (void)setup {
    [super setup];
    
    self.delegate = self;
}

- (BOOL)textField:(UITextField *)textField
shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string {
    return NO;
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ([self.textFieldDelegate respondsToSelector:@selector(textFieldDidChangeOption:)]) {
        [self.textFieldDelegate textFieldDidChangeOption:self];
    }
}
@end
