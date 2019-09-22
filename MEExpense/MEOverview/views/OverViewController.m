//
//  FEOverViewController.m
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 19/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import "OverViewController.h"
#import "OverViewPresenter.h"

@interface OverViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, readwrite, strong, nullable)id<OverViewPresenterProtocol>presenter;
@end

@implementation OverViewController
@synthesize presenter;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.presenter != nil) {
        self.presenter = [[OverViewPresenter alloc] initWith:(id<MEBaseViewProtocol>)self];
        [self.presenter manageSerialFetches];
    }
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.estimatedRowHeight = UITableViewAutomaticDimension;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}
- (IBAction)refresh:(id)sender {
    [self.presenter manageSerialFetches];
}

- (void)reloadview {
    [super reloadview];
    [self.tableView reloadData];
}

#pragma mark --
#pragma mark -- Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self.presenter conformsToProtocol:@protocol(OverViewPresenterProtocol)]) {
        return [self.presenter.overviewArray count];
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kOverViewController" forIndexPath:indexPath];
    cell.textLabel.text = [self.presenter.overviewArray objectAtIndex:indexPath.row].description;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.textColor = [self.presenter.overviewArray objectAtIndex:indexPath.row].isExceeded ? UIColor.whiteColor : UIColor.blackColor;
    cell.backgroundColor = [[self.presenter getListColor:indexPath.row] colorWithAlphaComponent:0.4];
    return cell;
}

@end
