//
//  MEBaseService.h
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 19/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MEBaseProtocols.h"
#import "MEConstants.h"

NS_ASSUME_NONNULL_BEGIN
@interface FacadeService:NSObject<MEFacadeServiceProtocol>
- (instancetype)initWith:(id<MEBasePresenterServiceProtocol>)presenter;
@end
NS_ASSUME_NONNULL_END
