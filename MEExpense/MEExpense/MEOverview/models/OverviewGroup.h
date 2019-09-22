//
//  OverviewGroup.h
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 22/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MEConstants.h"
#import "Category.h"
#import "Transaction.h"

NS_ASSUME_NONNULL_BEGIN

@interface OverviewGroup : NSObject
@property(nonatomic, readonly)NSString* categoryName;
@property (nonatomic, readonly) NSInteger colorType;
@property (nonatomic, readonly) float limit;
- (instancetype)initWith:(Category*)category andTrans:(NSArray<Transaction*>*)transaction;
- (BOOL)isExceeded;
- (NSString* )description;
@end

NS_ASSUME_NONNULL_END
