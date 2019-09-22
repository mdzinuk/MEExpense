//
//  EditTransactionViewController.h
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 21/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import "MEBaseViewController.h"
#import "Transaction.h"

NS_ASSUME_NONNULL_BEGIN
@interface EditTransactionViewController : MEBaseViewController
@property (nonatomic, strong) TransactionID *transactionId;
@end
NS_ASSUME_NONNULL_END
