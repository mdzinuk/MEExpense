//
//  CategoryPresenter.h
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 20/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MEBasePresenter.h"
#import "CategoryPresenterProtocols.h"
#import "CategoryViewProtocols.h"

NS_ASSUME_NONNULL_BEGIN
@interface CategoryPresenter: MEBasePresenter<MECategoryPresenterProtocol>
@property (nonatomic, strong, readonly) NSMutableArray<Category*>* _Nullable categories;
- (instancetype)initWith:(id<MECategoryViewProtocol>)view;
@end
NS_ASSUME_NONNULL_END
