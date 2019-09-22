//
//  TransactionListViewController.m
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 19/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import "TransactionPresenter.h"
#import "TransactionListViewController.h"
#import "EditTransactionViewController.h"
#import "MENavigationViewController.h"
#import "UIStoryboard+UIViewController.h"


@interface TransactionListViewController ()
@property (nonatomic, readwrite, strong, nullable)id<MEBasePresenterProtocol, METransactionPresenterProtocol>presenter;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation TransactionListViewController
@synthesize presenter;

- (void)dealloc {
    self.presenter = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.presenter != nil) {
        self.presenter = [[TransactionPresenter alloc] initWith:(id<MEBaseViewProtocol, METransactionViewProtocol>)self];
        [self.presenter checkLatestCurrencyRate];
    }
}

- (void)reloadBothTransactionAndCategory { }
- (void)reloadview {
    [super reloadview];
    __weak TransactionListViewController *weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.tableView reloadData];
    });
}
- (IBAction)didClickOnRefresh:(id)sender {
    [self.presenter manageSerialFetches];
}
- (IBAction)didClickOnSegmentedBar:(UISegmentedControl *)sender {
    [presenter switchListContext: sender.selectedSegmentIndex];
}
- (IBAction)didClickOnAdd:(UIBarButtonItem *)sender {
    EditTransactionViewController *editTransactionViewController = (EditTransactionViewController* )[UIStoryboard loadViewController:@"kTransactionListViewController"];
    MENavigationViewController* navigationController = [MENavigationViewController initWithView:editTransactionViewController];
    [self presentViewController:navigationController animated:YES completion:nil];
}


#pragma mark --
#pragma mark -- Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self.presenter conformsToProtocol:@protocol(METransactionPresenterProtocol)]) {
        return [self.presenter.transactions count];
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kTransactionListCellIdentifier" forIndexPath:indexPath];
    cell.textLabel.text = [self.presenter getListName: indexPath.row];
    cell.detailTextLabel.text = [self.presenter getListLimit:indexPath.row];
    cell.textLabel.textColor = [self.presenter getListColor:indexPath.row];
    cell.detailTextLabel.textColor = [self.presenter getListColor:indexPath.row];
    return cell;
}

-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    __weak TransactionListViewController *weakSelf = self;
    UITableViewRowAction *editAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Edit" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        EditTransactionViewController *editTransactionViewController = (EditTransactionViewController* )[UIStoryboard loadViewController:@"kTransactionListViewController"];
        editTransactionViewController.transactionId = [self.presenter getListIndex:indexPath.row];
        MENavigationViewController* navigationController = [MENavigationViewController initWithView:editTransactionViewController];
        [weakSelf presentViewController:navigationController animated:YES completion:nil];
    }];
    editAction.backgroundColor = [UIColor redColor];
    return @[editAction];
}
@end
