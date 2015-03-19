//
//  SRToastNotificationsViewController.m
//  SRHackWeek
//
//  Created by Tur, Louis on 3/18/15.
//  Copyright (c) 2015 Tur, Louis. All rights reserved.
//

#import "SRNYTimesStyle.h"
#import "SRNYTimesAPIManager.h"
#import "SRToastNotificationView.h"
#import "SRToastNotificationsViewController.h"


@interface SRToastNotificationsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) SRNYTimesAPIManager * sharedManager;

@end

@implementation SRToastNotificationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sharedManager = [SRNYTimesAPIManager sharedAPIManager];
    
    [self addNavigationBarAndConfigure];
    [self.sharedManager retrieveTopStories:12 completion:^(NSArray * topStories) {
        NSLog(@"Completion of stories retrieval block");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void) addNavigationBarAndConfigure{
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStyleDone target:self action:@selector(returnToMenu)];
    self.navigationItem.leftBarButtonItem = backButton;
    [[UINavigationBar appearance] setBarTintColor:[SRNYTimesStyle gray246]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue" size:24.0] }];
    self.navigationController.navigationBar.topItem.title = @"Toasty";
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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120.0;
}

-(BOOL)prefersStatusBarHidden{ return YES; }

@end
