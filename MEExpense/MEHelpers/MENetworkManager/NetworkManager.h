//
//  NetworkManager.h
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 21/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MEConstants.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager : NSObject
+ (NetworkManager* )sharedManager;
- (void)taskWith:(NSString* )path
        andParam:(NSDictionary* )params
completionHandler:(MENetworkResponse)completion;
@end

NS_ASSUME_NONNULL_END
