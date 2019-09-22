//
//  METextField.h
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 21/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccessoryTextField.h"

NS_ASSUME_NONNULL_BEGIN
@interface METextField: AccessoryTextField
- (NSString* )getSelectedValue;
- (NSInteger )getSelectedOption;
- (NSString* )getSelectionOptionValue;
- (void)setLeftText:(NSString* )text
        withOptions:(NSArray* )array
        forSelected: (NSInteger )index;
@end
NS_ASSUME_NONNULL_END
