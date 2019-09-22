//
//  OverviewProtocols.h
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 22/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#ifndef OverviewProtocols_h
#define OverviewProtocols_h
@protocol OverViewPresenterProtocol<NSObject>
@required
@property (nonatomic, readonly) NSMutableArray<OverviewGroup*>* _Nullable overviewArray;
- (void)manageSerialFetches;
- (UIColor* _Nullable )getListColor:(NSInteger)index;
@end

#endif /* OverviewProtocols_h */
