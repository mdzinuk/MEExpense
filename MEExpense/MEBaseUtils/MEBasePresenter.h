//
//  MEBasePresenter.h
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 19/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MEBaseProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface MEBasePresenter: NSObject<MEBasePresenterProtocol>
@property (nonatomic, readonly) float convertionRate;
@property (nonatomic, readonly) NSString* latestupdate;
- (instancetype)initWith:(id<MEBaseViewProtocol>)view;
@end

NS_ASSUME_NONNULL_END
