//
//  CategoryPresenter.m
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 20/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import "CategoryPresenter.h"
#import "CoredataManager.h"
#import "Budget.h"
#import "Amount.h"


@interface CategoryPresenter()
@property (nonatomic, weak) id<MECategoryViewProtocol, MEBaseViewProtocol>viewContext;
@property (nonatomic, strong, readwrite) NSMutableArray<Category*>* _Nullable categories;
@end

@implementation CategoryPresenter
@synthesize viewContext;

- (void)dealloc {
    self.categories = nil;
}

- (instancetype)initWith:(id<MECategoryViewProtocol>)view {
    self = [super init];
    if (self) {
        self.viewContext = (id<MECategoryViewProtocol, MEBaseViewProtocol>)view;
        return self;
    }
    return nil;
}

#pragma mark --
#pragma mark -- MECategoryPresenterProtocol

- (void)loadCategoryList {
    [self.getService loadEntityDataFor:[Category entityName]];
}
- (void)startEditingWith:(NSManagedObjectID* _Nullable )categoryId {
    if (categoryId != nil) {
        [self.getService searchInCategoryTableWith:categoryId completionHandler:^(NSManagedObject * _Nullable object) {
            Category *category = (Category*)object;
            [self.viewContext setCategory:category.name andOption:colorCodeRawValues() withIndex:category.color.intValue];
            [self.viewContext setBudget:category.budget.limit.value.stringValue andOption:currencyCodeRawValues() withIndex:currencyCodeEnum(category.budget.limit.currency)];
        }];
    } else {
        [self.viewContext setCategory:@"Category" andOption:colorCodeRawValues() withIndex:0];
        [self.viewContext setBudget:@"Monthly budget" andOption:currencyCodeRawValues() withIndex:0];
    }
}
- (void)endEditingFor:(NSManagedObjectID* _Nullable )categoryId
         withCategory:(NSString* _Nullable)name
            selection:(NSInteger)colorIndex
              bundget:(double)limit
          andCurrency:(NSInteger)currencyIndex {
    ColorType color = (ColorType)colorIndex;
    NSString* currency = CurrencyCode[currencyIndex];
    [self.getService updateCategoryTableWith:categoryId
                                    category:name
                                   selection:color
                                     bundget:limit
                                 andCurrency:currency];
}

- (CategoryID* _Nullable )categoryId:(NSInteger)index {
    Category* category = [self.categories objectAtIndex:index];
    return category.objectID;
}

- (NSString* )categoryTitle:(NSInteger)index {
    Category* category = [self.categories objectAtIndex:index];
    return [NSString stringWithFormat:@"%@", category.name];
}
- (NSString* )categoryLimit:(NSInteger)index {
    Category* category = [self.categories objectAtIndex:index];
    return [NSString stringWithFormat:@"%.2lf (%@)", category.budget.limit.valueValue, category.budget.limit.currency];
}
- (UIColor* )categoryViewColor:(NSInteger)index {
    Category* category = [self.categories objectAtIndex:index];
    ColorType colorCode = (ColorType)[category.color integerValue];
    return [self presentationColor:colorCode];
}

#pragma mark --
#pragma mark -- MEBasePresenterServiceProtocol
- (void)didFinishedCoreDataResult:(NSArray * _Nullable)results {
#warning Code should be refactored workaround needed to fis the isse.
    NSMutableSet* existingNames = [NSMutableSet set];
    NSMutableArray* filteredArray = [NSMutableArray array];
    for (id object in results) {
        if (![existingNames containsObject:[object name]]) {
            [existingNames addObject:[object name]];
            [filteredArray addObject:object];
        }
    }
    if ([self.viewContext conformsToProtocol:@protocol(MECategoryViewProtocol)]) {
        if (self.categories == nil) {
            self.categories = [[NSMutableArray alloc] init];
            [self.categories addObjectsFromArray:filteredArray];
        } else {
            if (![self.categories isEqualToArray:filteredArray]) {
                [self.categories removeAllObjects];
                [self.categories addObjectsFromArray:filteredArray];
            }
        }
        [self.viewContext reloadview];
    }
}
- (void)didFinishedCoreDataErrora:(NSError* _Nullable )error {
    if ([self.viewContext conformsToProtocol:@protocol(MECategoryViewProtocol)]) {
        [self.viewContext reloadview];
    }
}
- (void)didFinishedTableUpdate:(BOOL)isSuccess {
    [self.viewContext didFinishedUpdateTable:isSuccess];
}
@end



