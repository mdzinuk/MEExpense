//
//  TransactionViewProtocols.h
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 22/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import "MEBaseProtocols.h"

#ifndef TransactionViewProtocols_h
#define TransactionViewProtocols_h

@protocol METransactionEditViewProtocol <NSObject>
@optional
- (void)setPlaceHolder:(NSString* _Nonnull )placeHolder categoryList:(NSArray* _Nonnull )option withIndex:(NSInteger)index;
- (void)setAmount:(NSString* _Nonnull )amount andCurrencyOption:(NSArray* _Nonnull )option withIndex:(NSInteger)index;
- (void)setDate:(NSString* _Nonnull )dateString;
- (void)didFinishedUpdateTable:(BOOL)isSuccess;
@end

@protocol METransactionViewProtocol <NSObject>
- (void)reloadBothTransactionAndCategory;
@optional
@end

#endif /* TransactionViewProtocols_h */
