//
//  MEBaseService.m
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 19/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import "MEBaseService.h"

@interface MEBaseService()
@property (nonatomic, weak) id<MEBasePresenterServiceProtocol>presenterContext;
@end


@implementation MEBaseService
- (instancetype)initWith:(id<MEBasePresenterServiceProtocol>)presenter {
    self = [super init];
    if (self) {
        self.presenterContext = presenter;
        return self;
    }
    return nil;
}

- (void)didNeedtoStartTask {
    // Networkrequest
    [self.presenterContext didSuccessWithNetwork: nil];
}
@end
