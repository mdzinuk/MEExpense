//
//  UIStoryboard+UIViewController.m
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 21/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import "UIStoryboard+UIViewController.h"

@implementation UIStoryboard (UIViewController)
+ (UIViewController* )loadViewController:(NSString* )identifier {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    return [storyboard instantiateViewControllerWithIdentifier:identifier];
}
@end
