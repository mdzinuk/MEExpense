//
//  NSDictionary+URLEncoding.m
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 21/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import "NSDictionary+URLEncoding.h"

@implementation NSDictionary (URLEncoding)
- (NSArray*)urlqueryItems {
    NSMutableArray *queryItems = [NSMutableArray array];
    for (NSString *key in self) {
        [queryItems addObject:[NSURLQueryItem queryItemWithName:key value:self[key]]];
    }
    return queryItems;
}
@end
