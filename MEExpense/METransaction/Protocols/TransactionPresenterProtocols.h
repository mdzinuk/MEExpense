//
//  TransactionPresenterProtocols.h
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 22/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import "MEBaseProtocols.h"

#ifndef TransactionPresenterProtocols_h
#define TransactionPresenterProtocols_h


#endif /* TransactionPresenterProtocols_h */
@protocol METransactionPresenterProtocol<NSObject>

@required
@property (nonatomic, strong, readonly) NSMutableArray<Transaction*>* _Nullable transactions;
@property (nonatomic, strong, readonly) NSMutableArray<Category*>* _Nullable categories;
- (void)loadList;
- (void)loadCategoryList;
- (void)switchListContext:(NSInteger)context;
- (void)startEditingFor:(NSManagedObjectID* _Nullable )transactionId;
- (void)didOptionChange:(NSInteger)index;
- (void)didEditField:(NSDate* _Nullable )date;
- (void)manageSerialFetches;

@optional
- (TransactionID* _Nullable )getListIndex:(NSInteger)index;
- (NSString* _Nullable )getListName:(NSInteger)index;
- (NSString* _Nullable )getListLimit:(NSInteger)index;
- (UIColor* _Nonnull )getListColor:(NSInteger)index;
- (void)endEditingFor:(NSManagedObjectID* _Nullable )transactionId
         withCategory:(NSString* _Nullable)name
            selection:(NSInteger)colorIndex
              expense:(double)expense
             currency:(NSInteger)currencyIndex
       andExpenseDate:(NSDate *_Nullable)date;
@end
