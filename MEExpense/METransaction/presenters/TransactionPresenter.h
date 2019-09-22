//
//  TransactionPresenter.h
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 21/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import "MEBasePresenter.h"
#import "TransactionPresenterProtocols.h"
#import "TransactionViewProtocols.h"

NS_ASSUME_NONNULL_BEGIN
@interface TransactionPresenter: MEBasePresenter<METransactionPresenterProtocol>
@property (nonatomic, strong, readonly) NSMutableArray<Transaction*>* _Nullable transactions;
@property (nonatomic, strong, readonly) NSMutableArray<Category*>* _Nullable categories;
- (instancetype)initWith:(id<MEBaseViewProtocol>)view;
@end
NS_ASSUME_NONNULL_END
