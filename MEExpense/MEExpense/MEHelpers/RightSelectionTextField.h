//
//  RightSelectionTextField.h
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 21/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import "METextField.h"

NS_ASSUME_NONNULL_BEGIN

@class RightSelectionTextField;
@protocol RightSelectionTextFieldProtocol <NSObject>
@required
- (void)textFieldDidChangeOption:(RightSelectionTextField* )textField;
@end

@interface RightSelectionTextField: METextField <RightSelectionTextFieldProtocol>
@property (nonatomic, weak) id<RightSelectionTextFieldProtocol>textFieldDelegate;
@end
NS_ASSUME_NONNULL_END
