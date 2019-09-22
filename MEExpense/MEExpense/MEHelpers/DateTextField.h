//
//  DateTextField.h
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 21/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import "AccessoryTextField.h"

NS_ASSUME_NONNULL_BEGIN
@class DateTextField;
@protocol DateTextFieldProtocol <NSObject>
@required
- (void)textFieldDidSelectDate:(NSDate* )date;
@end

@interface DateTextField: AccessoryTextField
@property (nonatomic, weak) id<DateTextFieldProtocol>textFieldDelegate;
- (NSDate* )getSelectedDate;
@end

NS_ASSUME_NONNULL_END
