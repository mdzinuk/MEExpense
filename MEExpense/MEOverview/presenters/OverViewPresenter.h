//
//  OverViewPresenter.h
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 22/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import "MEBasePresenter.h"
#import "OverviewGroup.h"
#import "OverviewProtocols.h"


NS_ASSUME_NONNULL_BEGIN
@interface OverViewPresenter: MEBasePresenter<OverViewPresenterProtocol>
- (instancetype)initWith:(id<MEBaseViewProtocol>)view;
@end
NS_ASSUME_NONNULL_END
