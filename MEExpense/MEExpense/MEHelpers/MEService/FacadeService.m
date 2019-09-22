//
//  MEBaseService.m
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 19/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import "FacadeService.h"
#import "CoredataManager.h"
#import "NetworkManager.h"
#import "Category.h"
#import "Transaction.h"
#import "Budget.h"

@interface FacadeService()
@property (nonatomic, weak) id<MEBasePresenterServiceProtocol>presenterContext;
@end


@implementation FacadeService
- (instancetype)initWith:(id<MEBasePresenterServiceProtocol>)presenter {
    self = [super init];
    if (self) {
        self.presenterContext = presenter;
        return self;
    }
    return nil;
}

- (void)didNeedtoStartTask {
    // Networkrequest
    //@"source" : @"NZD", @"currencies" : @"USD",
    NSDictionary* items = @{@"source" : @"USD", @"currencies" : @"NZD", @"format" : @"1"};
    __weak FacadeService *weakSelf = self;
    [NetworkManager.sharedManager taskWith:@"/live"
                                  andParam:items
                         completionHandler:^(NSDictionary * _Nullable dict, NSError * _Nullable error) {
                             if (![NSThread isMainThread]) {
                                 dispatch_async(dispatch_get_main_queue(), ^{
                                     [weakSelf.presenterContext didSuccessWithNetwork:dict];
                                 });
                             } else {
                                 [weakSelf.presenterContext didFailWithNetwork:error];
                             }
                         }];
}

- (void)loadEntityDataFor:(NSString* _Nonnull )entity {
    __weak FacadeService *weakSelf = self;
    [CoredataManager.sharedManager fetchWithEntity:entity completionHandler:^(NSArray * _Nullable result, NSError * _Nullable error) {
        if (error == nil) {
#warning workaround to filter entity objects only
            NSMutableArray* arr = [NSMutableArray array];
            for (id item in result) {
                if ([NSStringFromClass([item class]) isEqualToString: entity]) {
                    [arr addObject:item];
                }
            }
            [weakSelf.presenterContext didFinishedCoreDataResult:arr];
        } else {
            [weakSelf.presenterContext didFailWithNetwork:error];
        }
    }];
}

- (void)searchInCategoryTableWith:(NSManagedObjectID* _Nullable )categoryId
                completionHandler:(MEManagedObject _Nullable )completion {
    [CoredataManager.sharedManager searchByManagedId:categoryId completionHandler:completion];
}

- (void)updateCategoryTableWith:(NSManagedObjectID* _Nullable )categoryId
                       category:(NSString* _Nullable)name
                      selection:(NSInteger)colorIndex
                        bundget:(double)limit
                    andCurrency:(NSString* _Nonnull)currency {
    
    Category *category = [Category initWithName:name
                                       andColor:@(colorIndex)
                                         amount:limit
                                       currency:currency
                                        context:[CoredataManager.sharedManager getContext]];
    __weak FacadeService *weakSelf = self;
    if (categoryId != nil) {
        [CoredataManager.sharedManager updateWithManagedId:categoryId completionHandler:^(BOOL isSuccess) {
            [weakSelf.presenterContext didFinishedTableUpdate: isSuccess];
        }];
        
    } else {
        [CoredataManager.sharedManager insertEntityObject:category completionHandler:^(BOOL isSuccess) {
            [weakSelf.presenterContext didFinishedTableUpdate: isSuccess];
        }];
    }
}

- (void)updateTransactionTableWith:(NSManagedObjectID* _Nullable )transactionId
                   transactionDate:(NSDate* _Nullable )date
                          category:(NSString* _Nullable)name
                         selection:(NSInteger)colorIndex
                           bundget:(double)limit
                       andCurrency:(NSString* _Nonnull)currency {
    
    Transaction* transaction = [Transaction initWithDate:date
                                                category:name
                                                andColor:@(colorIndex)
                                                  amount:limit
                                                currency:currency
                                                 context:[CoredataManager.sharedManager getContext]];
    __weak FacadeService *weakSelf = self;
    if (transactionId != nil) {
        [CoredataManager.sharedManager updateWithManagedId:transactionId completionHandler:^(BOOL isSuccess) {
            [weakSelf.presenterContext didFinishedTableUpdate: isSuccess];
        }];
        
    } else {
        [CoredataManager.sharedManager insertEntityObject:transaction completionHandler:^(BOOL isSuccess) {
            [weakSelf.presenterContext didFinishedTableUpdate: isSuccess];
        }];
    }
}
@end
