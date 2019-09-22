//
//  UIStoryboard+UIViewController.h
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 21/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//


#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface UIStoryboard (UIViewController)
+(UIViewController* )loadViewController:(NSString* )identifier;
@end

NS_ASSUME_NONNULL_END
