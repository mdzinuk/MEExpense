//
//  TransactionPresenter.m
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 21/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import "TransactionPresenter.h"
#import "Transaction.h"
#import "Category.h"
#import "Budget.h"
#import "Amount.h"

@interface TransactionPresenter()
@property (nonatomic, weak) id<METransactionEditViewProtocol, METransactionViewProtocol, MEBaseViewProtocol> viewContext;
@property (nonatomic, strong, readwrite) NSMutableArray<Transaction*>* _Nullable transactions;
@property (nonatomic, strong, readwrite) NSMutableArray<Category*>* _Nullable categories;
@property (nonatomic, assign, readwrite) NSInteger segmentedIndex;
@end


@implementation TransactionPresenter
@synthesize viewContext;

- (instancetype)initWith:(id<METransactionEditViewProtocol, METransactionViewProtocol>)view; {
    self = [super init];
    if (self) {
        self.viewContext = (id<METransactionEditViewProtocol, METransactionViewProtocol, MEBaseViewProtocol>)view;
        return self;
    }
    return nil;
}

- (void)dealloc {
    self.transactions = nil;
    self.categories = nil;
}

#pragma mark --
#pragma mark -- METransactionPresenterProtocol
- (void)manageSerialFetches {
#warning Coredata can't handle two fetch async way.. need workaround
    dispatch_queue_t serialQueue = dispatch_queue_create("com.coredata.request.queue", DISPATCH_QUEUE_SERIAL);
    __weak TransactionPresenter *weakSelf = self;
    dispatch_async(serialQueue, ^{
        [weakSelf loadList];
    });
    dispatch_async(serialQueue, ^{
        [weakSelf loadCategoryList];
    });
}
- (void)loadList {
    [self.getService loadEntityDataFor:[Transaction entityName]];
}
- (void)loadCategoryList {
    [self.getService loadEntityDataFor:[Category entityName]];
}
- (void)startEditingFor:(NSManagedObjectID* _Nullable )transactionId {
#warning will implement later
    //  [self loadEntityModels];
    if (transactionId != nil) { }
    else {
        // [self.viewContext setCategory:@"Category" andOption:colorCodeRawValues() withIndex:0];
        // [self.viewContext setBudget:@"Monthly budget" andOption:currencyCodeRawValues() withIndex:0];
    }
}

- (void)didOptionChange:(NSInteger)index {
    NSArray* catNames = [self.categories valueForKeyPath:@"@distinctUnionOfObjects.name"];
    NSString* name = [catNames objectAtIndex:index];
    [self.viewContext setPlaceHolder:name categoryList:catNames withIndex:index];
}

- (void)didEditField:(NSDate* _Nullable )date {
    [self.viewContext setDate:[TransactionPresenter timeStringFormat:date]];
}
- (void)endEditingFor:(NSManagedObjectID* _Nullable )transactionId
         withCategory:(NSString* _Nullable)name
            selection:(NSInteger)colorIndex
              expense:(double)expense
             currency:(NSInteger)currencyIndex
       andExpenseDate:(NSDate *_Nullable)date {
    
    NSInteger colorCode = [self getColorCode:name];
    ColorType color = (ColorType)colorCode;
    NSString* currency = CurrencyCode[currencyIndex];
    
    [self.getService updateTransactionTableWith:transactionId
                                transactionDate:date
                                       category:name
                                      selection:color
                                        bundget:expense
                                    andCurrency:currency];
    
}
- (TransactionID* _Nullable )getListIndex:(NSInteger)index {
    Transaction* transaction = [self.transactions objectAtIndex:index];
    return transaction.objectID;
}
- (NSString* )getListName:(NSInteger)index {
    Transaction* transaction = [self.transactions objectAtIndex:index];
    return [NSString stringWithFormat:@"%@ %@", transaction.category.name,
            [TransactionPresenter timeStringFormat:transaction.creationDate]];
}
- (NSString* )getListLimit:(NSInteger)index {
    Transaction* transaction = [self.transactions objectAtIndex:index];
    CurrencyType currenctCurrency = (CurrencyType)currencyCodeEnum(transaction.category.budget.limit.currency);
    float multiply = (transaction.category.budget.limit.valueValue * ((currenctCurrency == CurrencyTypeUSD) ? self.convertionRate : 1.0));
    return  [NSString stringWithFormat:@"%.2lf (%@)", multiply, CurrencyCode[CurrencyTypeNZD] ];
}

- (UIColor* )getListColor:(NSInteger)index {
    Transaction* transaction = [self.transactions objectAtIndex:index];
    ColorType colorCode = (ColorType)[self getColorCode: transaction.category.name];
    return [self presentationColor:colorCode];
}

#pragma mark --
#pragma mark -- PrivateMethods
- (BOOL)sortbyAddition:(NSDate* )date {
    if (self.segmentedIndex == 0) {
        return [[NSCalendar currentCalendar] isDate:date
                                    inSameDayAsDate:[NSDate date]];
    }
    return [[NSCalendar currentCalendar] isDate:date
                                    equalToDate:[NSDate date]
                              toUnitGranularity:NSCalendarUnitMonth];
}

- (void)updateRawCategories: (NSArray*)results {
    // Not relational category
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(Category* category, NSDictionary *bindings) {
        return ([category isKindOfClass:[Category class]] && category.transaction == nil);
    }];
    NSArray* filterdlist = [results filteredArrayUsingPredicate:predicate];
    
    if (self.categories == nil) {
        self.categories = [[NSMutableArray alloc] init];
        [self.categories addObjectsFromArray:filterdlist];
    } else {
        if (![self.categories isEqualToArray:filterdlist]) {
            [self.categories removeAllObjects];
            [self.categories addObjectsFromArray:filterdlist];
        }
    }
#warning Need to be improved... code refactoring
    if ([self.viewContext conformsToProtocol:@protocol(METransactionEditViewProtocol)]) {
        if (self.categories.count > 0) {
            NSArray* catNames = [self.categories valueForKeyPath:@"@distinctUnionOfObjects.name"];
            [self.viewContext setPlaceHolder:[catNames objectAtIndex:0] categoryList:catNames withIndex:0];
            [self.viewContext setAmount:@"0.0" andCurrencyOption:currencyCodeRawValues() withIndex:0];
        } else {
            [self.viewContext setPlaceHolder:@"Add atleaset one category" categoryList:@[@"Select"] withIndex:0];
            [self.viewContext setAmount:@"Add atleaset one category" andCurrencyOption:@[@"Select"] withIndex:0];
        }
    }
    [viewContext reloadview];
}
- (void)updateRawTransaction: (NSArray*)results {
    //Apply filter
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(Transaction* object, NSDictionary *bindings) {
        return ([object isKindOfClass:[Transaction class]] && [self sortbyAddition:object.creationDate]);
    }];
    NSArray* sortedResults = [results filteredArrayUsingPredicate:predicate];
    if (self.transactions == nil) {
        self.transactions = [[NSMutableArray alloc] init];
        [self.transactions addObjectsFromArray:sortedResults];
    } else {
        if (![self.transactions isEqualToArray:sortedResults]) {
            [self.transactions removeAllObjects];
            [self.transactions addObjectsFromArray:sortedResults];
        }
    }
}
- (void)switchListContext:(NSInteger)context {
    self.segmentedIndex = context;
    [self manageSerialFetches];
}
- (NSInteger)getColorCode:(NSString* )categoryName {
    for (Category* cat in self.categories) {
        if (cat.name ==  categoryName) {
            return  cat.color.integerValue;
        }
    }
    return 0;
}

#pragma mark --
#pragma mark -- MEBasePresenterServiceProtocol
- (void)didFinishedCoreDataResult:(NSArray * _Nullable)results {
    //When call from Transaction add/edit page
    if ([self.viewContext conformsToProtocol:@protocol(METransactionEditViewProtocol)]) {
        [self updateRawCategories:results];
    } else {
        //When call from Transaction list page just take solid class
        NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(id object, NSDictionary *bindings) {
            return [object isKindOfClass:[Transaction class]];
        }];
        NSArray* filteredlist = [results filteredArrayUsingPredicate:predicate];
        // first return
        if (filteredlist.count > 0) {
            [self updateRawTransaction:results];
        } else {//second return
            [self updateRawCategories:results];
        }
    }
}
- (void)didFinishedCoreDataErrora:(NSError* _Nullable )error {
    if ([self.viewContext conformsToProtocol:@protocol(METransactionEditViewProtocol)]) {
        [self.viewContext reloadview];
    }
}
- (void)didFinishedTableUpdate:(BOOL)isSuccess {
    [self.viewContext didFinishedUpdateTable:isSuccess];
}

@end
