//
//  SRRandomUserTableViewController.m
//  SRHackWeek
//
//  Created by Louis Tur on 4/13/15.
//  Copyright (c) 2015 Tur, Louis. All rights reserved.
//

#import "SRRandomUserTableViewController.h"

@interface SRRandomUserTableViewController ()

@property (nonatomic) NSUInteger numberOfRandos;

@end

@implementation SRRandomUserTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // self.clearsSelectionOnViewWillAppear = NO;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.numberOfRandos > 0 ? self.numberOfRandos : 1;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

@end