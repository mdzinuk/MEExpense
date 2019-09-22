//
//  MEBaseProtocols.h
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 19/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>
#import "Category.h"
#import "Transaction.h"
#import "MEConstants.h"


#ifndef MEBaseProtocols_h
#define MEBaseProtocols_h

@protocol MEBasePresenterProtocol <NSObject>
@optional
@property (nonatomic, readonly) float convertionRate;
@property (nonatomic, readonly) NSString* _Nullable latestupdate;
- (void)checkLatestCurrencyRate;
@end

@protocol MEBaseViewProtocol <NSObject>
@optional
- (void)reloadview;
@end

@protocol MEBasePresenterServiceProtocol <NSObject>
@optional
- (void)didSuccessWithNetwork:(NSDictionary* _Nullable)serialized;
- (void)didFailWithNetwork:(NSError* _Nullable )error;
- (void)didFinishedCoreDataResult:(NSArray * _Nullable)results;
- (void)didFinishedCoreDataErrora:(NSError* _Nullable )error;
- (void)didFinishedTableUpdate:(BOOL)isSuccess;
@end

@protocol MEFacadeServiceProtocol <NSObject>
@optional
- (void)didNeedtoStartTask;
- (void)loadEntityDataFor:(NSString* _Nonnull )entity;
- (void)searchInCategoryTableWith:(NSManagedObjectID* _Nullable )categoryId completionHandler:(MEManagedObject _Nullable )completion;
- (void)updateCategoryTableWith:(NSManagedObjectID* _Nullable )categoryId
                       category:(NSString* _Nullable)name
                      selection:(NSInteger)colorIndex
                        bundget:(double)limit
                    andCurrency:(NSString* _Nonnull)currency;
- (void)updateTransactionTableWith:(NSManagedObjectID* _Nullable )transactionId
                   transactionDate:(NSDate* _Nullable )date
                          category:(NSString* _Nullable)name
                         selection:(NSInteger)colorIndex
                           bundget:(double)limit
                       andCurrency:(NSString* _Nonnull)currency;
@end
#endif /* MEBaseProtocols_h */
