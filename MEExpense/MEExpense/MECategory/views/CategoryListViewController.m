//
//  CategoryListViewController.m
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 19/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import "MEConstants.h"
#import "CategoryPresenter.h"
#import "CategoryListViewController.h"
#import "EditCategoryViewController.h"
#import "MENavigationViewController.h"
#import "UIStoryboard+UIViewController.h"

@interface CategoryListViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, readwrite, strong, nullable)id<MEBasePresenterProtocol, MECategoryPresenterProtocol>presenter;
@end

@implementation CategoryListViewController
@synthesize presenter;

- (void)dealloc {
    self.presenter = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.presenter != nil) {
        self.presenter = [[CategoryPresenter alloc] initWith:(id<MEBaseViewProtocol, MECategoryViewProtocol>)self];
    }
    [self.presenter loadCategoryList];
}

- (void)reloadview {
    [super reloadview];
    [self.tableView reloadData];
}

- (IBAction)didClickOnRefresh:(UIBarButtonItem *)sender {
    [self.presenter loadCategoryList];
}
- (IBAction)didClickOnAdd:(UIBarButtonItem *)sender {
    EditCategoryViewController *editCategoryViewController = (EditCategoryViewController* )[UIStoryboard loadViewController:@"kEditCategoryViewController"];
    MENavigationViewController* navigationController = [MENavigationViewController initWithView:editCategoryViewController];
    [self presentViewController:navigationController animated:YES completion:nil];
}


#pragma mark --
#pragma mark -- Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self.presenter conformsToProtocol:@protocol(MECategoryPresenterProtocol)]) {
        return [self.presenter.categories count];
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kCategoryListCellIdentifier" forIndexPath:indexPath];
    cell.textLabel.text = [self.presenter categoryTitle: indexPath.row];
    cell.detailTextLabel.text = [self.presenter categoryLimit:indexPath.row];
    cell.textLabel.textColor = [self.presenter categoryViewColor:indexPath.row];
    cell.detailTextLabel.textColor = [self.presenter categoryViewColor:indexPath.row];
    return cell;
}
- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    __weak CategoryListViewController *weakSelf = self;
    UITableViewRowAction *editAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Edit" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        EditCategoryViewController *editCategoryViewController = (EditCategoryViewController* )[UIStoryboard loadViewController:@"kEditCategoryViewController"];
        editCategoryViewController.categoryID = [self.presenter categoryId:indexPath.row];
        MENavigationViewController* navigationController = [MENavigationViewController initWithView:editCategoryViewController];
        [weakSelf presentViewController:navigationController animated:YES completion:nil];
    }];
    editAction.backgroundColor = [UIColor redColor];
    return @[editAction];
}


@end
