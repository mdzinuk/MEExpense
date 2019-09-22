//
//  CategoryViewProtocols.h
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 22/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#ifndef CategoryViewProtocols_h
#define CategoryViewProtocols_h
@protocol MECategoryViewProtocol <NSObject>
@optional
- (void)setCategory:(NSString* _Nonnull )name andOption:(NSArray* _Nonnull )option withIndex:(NSInteger)index;
- (void)setBudget:(NSString* _Nonnull)budget andOption:(NSArray* _Nonnull )option withIndex:(NSInteger)index;
- (void)didFinishedUpdateTable:(BOOL)isSuccess;
@end

#endif /* CategoryViewProtocols_h */
