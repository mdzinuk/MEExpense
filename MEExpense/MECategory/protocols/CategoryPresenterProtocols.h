//
//  CategoryPresenterProtocols.h
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 22/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#ifndef CategoryPresenterProtocols_h
#define CategoryPresenterProtocols_h

@protocol MECategoryPresenterProtocol <NSObject>
@required
@property (nonatomic, strong, readonly) NSMutableArray<Category*>* _Nullable categories;
- (void)loadCategoryList;

@optional
- (CategoryID* _Nullable )categoryId:(NSInteger)index;
- (NSString* _Nullable )categoryTitle:(NSInteger)index;
- (NSString* _Nullable )categoryLimit:(NSInteger)index;
- (UIColor* _Nullable )categoryViewColor:(NSInteger)index;
- (void)startEditingWith:(NSManagedObjectID* _Nullable )categoryId;
- (void)endEditingFor:(NSManagedObjectID* _Nullable )categoryId
         withCategory:(NSString* _Nullable)name
            selection:(NSInteger)colorIndex
              bundget:(double)colorName
          andCurrency:(NSInteger)currencyIndex;
@end

#endif /* CategoryPresenterProtocols_h */
