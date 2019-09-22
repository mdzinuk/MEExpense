//
//  MEBaseViewController.h
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 19/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MEBaseProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface MEBaseViewController: UIViewController<MEBaseViewProtocol>
@property (nonatomic, readwrite, strong, nullable)id<MEBasePresenterProtocol>presenter;
@end

NS_ASSUME_NONNULL_END
