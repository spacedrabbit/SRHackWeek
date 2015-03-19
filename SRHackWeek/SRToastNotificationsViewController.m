//
//  SRToastNotificationsViewController.m
//  SRHackWeek
//
//  Created by Tur, Louis on 3/18/15.
//  Copyright (c) 2015 Tur, Louis. All rights reserved.
//

#import "SRNYTimesStyle.h"
#import "SRToastNotificationsViewController.h"

static NSString * const kTopStoriesAPIKey = @"4d868a9601120acae1e6b5af3d81167f:1:71242787";

@interface SRToastNotificationsViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation SRToastNotificationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStyleDone target:self action:@selector(returnToMenu)];
    self.navigationItem.leftBarButtonItem = backButton;
    [[UINavigationBar appearance] setBarTintColor:[SRNYTimesStyle gray246]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue" size:24.0] }];
    self.navigationController.navigationBar.topItem.title = @"Toasty";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 0;
}

-(void) returnToMenu{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(BOOL)prefersStatusBarHidden{ return YES; }

@end
