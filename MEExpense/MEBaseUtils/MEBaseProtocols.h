//
//  MEBaseProtocols.h
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 19/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#ifndef MEBaseProtocols_h
#define MEBaseProtocols_h

@protocol MEBasePresenterProtocol <NSObject>
@optional
- (void)checkLatestCurrencyRate;
@end


@protocol MEBaseViewProtocol <NSObject>
@optional
- (void)reloadview;
@end


@protocol MEBasePresenterServiceProtocol <NSObject>
@optional
- (void)didSuccessWithNetwork:(NSDictionary* _Nullable)serialized;
- (void)didFailWithNetwork:(NSError* _Nullable )error;
@end

@protocol MEBaseServiceProtocol <NSObject>
@optional
- (void)didNeedtoStartTask;
@end

#endif /* MEBaseProtocols_h */
