//
//  MENavigationViewController.m
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 21/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import "MENavigationViewController.h"

@interface MENavigationViewController ()
- (instancetype)initWithView:(UIViewController *)controller;
@end

#warning Will add description later
@implementation MENavigationViewController
+ (instancetype)initWithView:(UIViewController *)controller {
    return [[self alloc] initWithView:controller];
}

- (instancetype)initWithView:(UIViewController *)controller {
    self = [super initWithRootViewController:controller];
    if (self) {
        [self.navigationBar setPrefersLargeTitles:TRUE];
        [self setLeftCancelButton:controller];
    }
    return self;
}

- (void)setLeftCancelButton:(UIViewController *)viewController {
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]
                                     initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                     target:self action:@selector(didClickOnCancelButton:)];
    [viewController.navigationItem setLeftBarButtonItem:cancelButton];
}

- (void)didClickOnCancelButton:(UIBarButtonItem* )sender {
    if ([self presentingViewController]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}
@end
