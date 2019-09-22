//
//  MEBaseViewController.m
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 19/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import "MEBaseViewController.h"
#import "MEBasePresenter.h"

@interface MEBaseViewController ()
@end

@implementation MEBaseViewController
- (void)dealloc {
    self.presenter = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.presenter == nil) {
        self.presenter = [[MEBasePresenter alloc] initWith:(id<MEBaseViewProtocol>)self];
    }
}

#pragma mark --
#pragma mark -- MEBaseViewProtocol
- (void)reloadview {
    
}
@end
