//
//  AccessoryTextField.m
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 21/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import "AccessoryTextField.h"

@interface AccessoryTextField()
@end


@implementation AccessoryTextField
- (void)drawRect:(CGRect)rect {
    [self setup];
}
- (void)configAccessoryView {
    if (self.inputAccessoryView == nil) {
        UIToolbar *toolbar = [[UIToolbar alloc] init];
        [toolbar sizeToFit];
        
        UIBarButtonItem *flexibleButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                        target:nil
                                                                                        action:nil];
        UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                     target:self
                                                                                     action:@selector(hideKeyBoard:)];
        [toolbar setItems:@[flexibleButton, rightButton]];
        self.inputAccessoryView = toolbar;
    }
}

- (void)setup {
    [self configAccessoryView];
}

- (void)hideKeyBoard:(UIBarButtonItem* )sender {
    [self resignFirstResponder];
}

- (NSString*)getInputtext {
    return self.text;
}

@end
