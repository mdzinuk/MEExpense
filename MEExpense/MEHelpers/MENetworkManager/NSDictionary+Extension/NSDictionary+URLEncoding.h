//
//  NSDictionary+URLEncoding.h
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 21/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (URLEncoding)
- (NSArray*)urlqueryItems;
@end

NS_ASSUME_NONNULL_END
