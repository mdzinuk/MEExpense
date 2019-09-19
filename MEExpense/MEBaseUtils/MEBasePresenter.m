//
//  MEBasePresenter.m
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 19/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import "MEBasePresenter.h"
#import "MEBaseService.h"

@interface MEBasePresenter()<MEBasePresenterServiceProtocol>
@property (nonatomic, readwrite, assign) float convertionRate;
@property (nonatomic, readwrite, copy) NSString* latestupdate;
@property (nonatomic, weak) id<MEBaseViewProtocol>viewContext;
@property (nonatomic, strong) id<MEBaseServiceProtocol>service;
@end

@implementation MEBasePresenter
- (instancetype)initWith:(id<MEBaseViewProtocol>)view {
    self = [super init];
    if (self) {
        self.viewContext = view;
        return self;
    }
    return nil;
}

- (void)dealloc {
    self.service = nil;
}

#pragma mark --
#pragma mark -- MEBasePresenterProtocol
- (void)checkLatestCurrencyRate {
    // After loadednew network data
    
    if (self.service == nil)  {
        self.service = [[MEBaseService alloc] initWith:(id<MEBasePresenterServiceProtocol>)self];
    }
    [self.service didNeedtoStartTask];
    
}

#pragma mark --
#pragma mark -- MEBasePresenterServiceProtocol
- (void)didSuccessWithNetwork:(NSDictionary* _Nullable)serialized {
    [self.viewContext reloadview];
}
- (void)didFailWithNetwork:(NSError* _Nullable )error {
    [self.viewContext reloadview];
    
}
@end
