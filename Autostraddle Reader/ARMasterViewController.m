//
//  ARMasterViewController.m
//  Autostraddle Reader
//
//  Created by Nicole Chung on 2013-09-12.
//  Copyright (c) 2013 Nicole Chung. All rights reserved.
//

#import "ARMasterViewController.h"

#import "ARDetailViewController.h"
#import "ARTableHeaderView.h"
#import "ARRSSLoader.h"
#import "ARRSSItem.h"

@interface ARMasterViewController () {
    NSArray *_objects;
    NSURL* feedURL;
    UIRefreshControl* refreshControl;
}
@end

@implementation ARMasterViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    // configuration
    self.title = @"Autostraddle";
    feedURL = [NSURL URLWithString:@"http://www.autostraddle.com/feed/"];
    
    // add refresh control to the table view
    refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self
                       action:@selector(refreshInvoked:forState:)
             forControlEvents:UIControlEventValueChanged];
    NSString* fetchMessage = [NSString stringWithFormat:@"Fetching: %@", feedURL];
    
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:fetchMessage attributes:@{NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:11.0]}];
    
    [self.tableView addSubview: refreshControl];
    
    // add the header
    self.tableView.tableHeaderView = [[ARTableHeaderView alloc]initWithText:@"fetching rss feed"];
    
    [self refreshFeed];
}

-(void) refreshInvoked:(id)sender forState:(UIControlState)state {
    [self refreshFeed];
}

-(void)refreshFeed
{
    ARRSSLoader *rss = [[ARRSSLoader alloc] init];
    [rss fetchRSSWithURL:feedURL complete:^(NSString *title, NSArray *results)  {
        // complete fetching the RSS
        dispatch_async(dispatch_get_main_queue(), ^{
            // UI Code on the main queue
            [(ARTableHeaderView*) self.tableView.tableHeaderView setText:title];
            _objects = results;
            [self.tableView reloadData];
            
            // Stop refresh control
            [refreshControl endRefreshing];
        });
    }];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSDate *object = _objects[indexPath.row];
    cell.textLabel.text = [object description];
    return cell;
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = _objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
