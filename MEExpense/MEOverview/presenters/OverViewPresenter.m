//
//  OverViewPresenter.m
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 22/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import "OverViewPresenter.h"
#import "Transaction.h"
#import "Category.h"
#import "Budget.h"
#import "Amount.h"
#import "OverviewGroup.h"

@interface OverViewPresenter()
@property (nonatomic, weak) id<MEBaseViewProtocol> viewContext;
@property (nonatomic, strong, readwrite) NSMutableArray<Transaction*>* _Nullable transactions;
@property (nonatomic, strong, readwrite) NSMutableArray<Category*>* _Nullable categories;
@property (nonatomic, strong, readwrite) NSMutableArray<OverviewGroup*>* _Nullable overviewArray;
@end


@implementation OverViewPresenter
@synthesize viewContext;

- (instancetype)initWith:(id<MEBaseViewProtocol>)view; {
    self = [super init];
    if (self) {
        self.viewContext = (id<MEBaseViewProtocol>)view;
        return self;
    }
    return nil;
}

- (void)dealloc {
    self.transactions = nil;
    self.categories = nil;
    self.overviewArray = nil;
}

#pragma mark --
#pragma mark -- METransactionPresenterProtocol
- (void)manageSerialFetches {
    [self reset];
    
    dispatch_queue_t serialQueue = dispatch_queue_create("com.coredata.request.queue", DISPATCH_QUEUE_SERIAL);
    __weak OverViewPresenter *weakSelf = self;
    dispatch_async(serialQueue, ^{
        [weakSelf loadList];
    });
    dispatch_async(serialQueue, ^{
        [weakSelf loadCategoryList];
    });
    
    dispatch_async(serialQueue, ^{
        [weakSelf listGrouping];
    });
}

- (void)reset {
    if (self.overviewArray.count != 0) {
        [self.overviewArray removeAllObjects];
    }
    
    if (self.transactions.count != 0) {
        [self.transactions removeAllObjects];
    }
    
    if (self.categories.count != 0) {
        [self.categories removeAllObjects];
    }
}
- (void)loadList {
    [self.getService loadEntityDataFor:[Transaction entityName]];
}
- (void)loadCategoryList {
    [self.getService loadEntityDataFor:[Category entityName]];
}
- (void)listGrouping {
    NSArray *transactionName = [self.transactions sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"category.name" ascending:YES]]];
    NSArray *categoriesName = [self.categories sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]]];
    if (self.overviewArray == nil) {
        self.overviewArray = [[NSMutableArray alloc] init];
    }
    if (self.overviewArray.count != 0) {
        [self.overviewArray removeAllObjects];
    }
    __weak OverViewPresenter *weakSelf = self;
    NSMutableArray* array = [NSMutableArray array];
    [categoriesName enumerateObjectsUsingBlock:^(Category  * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.transaction == nil) {
            for (Transaction* tran in transactionName) {
                if (tran.category.name == obj.name) {
                    [array addObject:tran];
                }
            }
            [weakSelf.overviewArray addObject: [[OverviewGroup alloc] initWith:obj andTrans:array]];
        }
    }];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.viewContext reloadview];
    });
}

- (void)getallTransactionList:(NSArray*)results {
    //Apply filter
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(Transaction* object, NSDictionary *bindings) {
        return ([object isKindOfClass:[Transaction class]]);
    }];
    NSArray* sortedResults = [results filteredArrayUsingPredicate:predicate];
    if (self.transactions == nil) {
        self.transactions = [[NSMutableArray alloc] init];
        [self.transactions addObjectsFromArray:sortedResults];
    }
    
    if (self.transactions.count == 0) {
        [self.transactions addObjectsFromArray:sortedResults];
    }
}

- (void)getallCategoryList:(NSArray*)results {
    NSMutableSet* existingNames = [NSMutableSet set];
    NSMutableArray* filteredArray = [NSMutableArray array];
    for (id object in results) {
        if ([object isKindOfClass: [Category class]]) {
            if (![existingNames containsObject:[object name]]) {
                [existingNames addObject:[object name]];
                [filteredArray addObject:object];
            }
        }
    }
    if (self.categories == nil) {
        self.categories = [[NSMutableArray alloc] initWithArray:filteredArray];
    }
    if (self.categories.count == 0) {
        [self.categories addObjectsFromArray:filteredArray];
    }
}

- (UIColor* )getListColor:(NSInteger)index {
    OverviewGroup* overview = [self.overviewArray objectAtIndex:index];
    ColorType colorCode = (ColorType)[overview colorType];
    return [self presentationColor:colorCode];
}

#pragma mark --
#pragma mark -- MEBasePresenterServiceProtocol
- (void)didFinishedCoreDataResult:(NSArray * _Nullable)results {
    if (self.transactions.count == 0 || self.categories.count == 0) {
        if (self.transactions.count == 0) {
            [self getallTransactionList: results];
        }
        if (self.categories.count == 0) {
            [self getallCategoryList: results];
        }
    }
}
- (void)didFinishedCoreDataErrora:(NSError* _Nullable )error {
    [self.viewContext reloadview];
}

@end
