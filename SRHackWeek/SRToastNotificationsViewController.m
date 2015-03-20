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

#import "SRArticleTableViewCell.h"

static NSString * const kCellIdentifier = @"cell";
@interface SRToastNotificationsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) SRNYTimesAPIManager * sharedManager;

@end

@implementation SRToastNotificationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[SRArticleTableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    
    self.sharedManager = [SRNYTimesAPIManager sharedAPIManager];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
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
    SRArticleTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[SRArticleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier];
    }
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(void) returnToMenu{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 160.0;
}

-(BOOL)prefersStatusBarHidden{ return YES; }

@end
