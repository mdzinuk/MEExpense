//
//  OverviewGroup.m
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 22/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import "OverviewGroup.h"
#import "Budget.h"
#import "Amount.h"


@interface OverviewGroup()
@property(nonatomic, copy, readwrite)NSString* categoryName;
@property (nonatomic, assign) NSInteger colorType;
@property (nonatomic, assign, readwrite) float limit;
@property(nonatomic, strong)NSMutableArray<Transaction*>*list;
@end

@implementation OverviewGroup
- (instancetype)initWith:(Category*)category andTrans:(NSArray<Transaction*>*)transaction {
    self = [super init];
    if (self) {
        self.categoryName = category.name;
        self.list = [[NSMutableArray alloc] initWithArray:transaction];
        self.limit = category.budget.limit.valueValue;
        self.colorType = category.colorValue;
        return self;
    }
    return nil;
}

- (void)dealloc {
    self.categoryName = nil;
    self.list = nil;
}

- (double)expenses {
    NSArray* prices = [self.list sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"amount.value" ascending:YES]]];
    return [[prices valueForKeyPath:@"@sum.amount.value"] doubleValue];
}
- (BOOL)isExceeded {
    
    return [self expenses] > self.limit;
}
- (NSString* )description {
    return [NSString stringWithFormat:@"%@ : \n total transaction: %lu \n total budget: %.2f \n coast: %f", self.categoryName, (unsigned long)self.list.count, self.limit, [self expenses]];
}
@end
