//
//  SRToastNotificationsViewController.m
//  SRHackWeek
//
//  Created by Tur, Louis on 3/18/15.
//  Copyright (c) 2015 Tur, Louis. All rights reserved.
//

#import "SRNYTimesArticle.h"
#import "SRNYTimesStyle.h"
#import "SRNYTimesAPIManager.h"
#import "SRToastNotificationView.h"
#import "SRToastNotificationsViewController.h"

#import "SRArticleTableViewCell.h"

#import <UIImageView+AFNetworking.h>

static NSString * const kCellIdentifier = @"cell";
@interface SRToastNotificationsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) SRToastNotificationView * sharedNotificationsManager;
@property (strong, nonatomic) SRNYTimesAPIManager * sharedManager;
@property (strong, nonatomic) NSArray * topStories;

@property (strong, nonatomic) NSURL * urlForPlaceholderImage;

@property (nonatomic) BOOL isFetchingData;

@end

@implementation SRToastNotificationsViewController

-(NSArray *)topStories{
    if (!_topStories) {
        _topStories = [NSArray array];
    }
    return _topStories;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self.tableView registerClass:[SRArticleTableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    self.isFetchingData = YES;
    self.sharedManager = [SRNYTimesAPIManager sharedAPIManager];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    dispatch_queue_t fetchQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_async(fetchQueue, ^{
        [self queryAPIForTopStories];
    });
    
    // TODO: Placeholder Not working
    self.urlForPlaceholderImage = [[NSBundle mainBundle] URLForResource:@"NYTLogo" withExtension:@"png"];
    
    [self addNavigationBarAndConfigure];
    [self configureToastNotifications];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void) configureToastNotifications{
    
    self.sharedNotificationsManager = [SRToastNotificationView sharedManager];
    [self.sharedNotificationsManager.toastBannerView setBackgroundColor:[SRNYTimesStyle redBreakingNews]];

}

-(void) showToastNotificationFromRight{
    [self.navigationController.view addSubview:self.sharedNotificationsManager.toastBannerView];
    UILabel * breakingNewsLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 30, self.sharedNotificationsManager.toastBannerView.frame.size.width, self.sharedNotificationsManager.toastBannerView.frame.size.height)];
    [breakingNewsLabel setAdjustsFontSizeToFitWidth:YES];
    [self.sharedNotificationsManager.toastBannerView addSubview:breakingNewsLabel];
    
    UIFont * franklinMedium = [UIFont fontWithName:@"AppleSDGothicNeo-Regular" size:40.0];
    breakingNewsLabel.font = franklinMedium;
    breakingNewsLabel.text = @"HOLY CRAP: BREAKING NEWS";
    
    UIGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeTheToast)];
    [self.sharedNotificationsManager.toastBannerView addGestureRecognizer:tapGesture];
    
    [self.sharedNotificationsManager addBounceFromTopAnimationAndRemoveOnCompletion:NO completion:^(BOOL finished) {
        if (finished) {
            [[SRToastNotificationView sharedManager] addDisappearTopAnimationWithBeginTime:1.5 andFillMode:kCAFillModeBoth andRemoveOnCompletion:YES completion:^(BOOL finished) {
                
            }];
        }
    }];
}

-(void) removeTheToast{
    
    [[SRToastNotificationView sharedManager] addDisappearTopAnimationAndRemoveOnCompletion:YES];
    //[self.sharedNotificationsManager removeAllAnimations];
    //[self.sharedNotificationsManager setAlpha:0];
    [self.sharedNotificationsManager addDisappearTopAnimationAndRemoveOnCompletion:YES completion:^(BOOL finished) {
        
    }];
}

-(void) queryAPIForTopStories{
    
    [self.sharedManager retrieveTopStoriesWithCompletion:^(NSArray * topStories) {
        if (topStories) {
            self.topStories = [NSArray arrayWithArray:topStories];
            dispatch_queue_t mainQueue = dispatch_get_main_queue();
            dispatch_async( mainQueue, ^{
                [self.tableView reloadData];
            });
        }
    }];
    
}

-(void) addNavigationBarAndConfigure{
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStyleDone target:self action:@selector(returnToMenu)];
    self.navigationItem.leftBarButtonItem = backButton;
    
    UIBarButtonItem *toastButtons = [[UIBarButtonItem alloc] initWithTitle:@"Toast!" style:UIBarButtonItemStylePlain
                                                                    target:self
                                                                    action:@selector(showToastNotificationFromRight)];
    self.navigationItem.rightBarButtonItem = toastButtons;
    
    // -- NAV BAR APPEARANCE -- //
    [[UINavigationBar appearance] setBarTintColor:[SRNYTimesStyle gray246]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue" size:24.0] }];
    self.navigationController.navigationBar.topItem.title = @"Top Stories";
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SRArticleTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[SRArticleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier];
    }else{
        
        if ([self.topStories count]) {
            @try {
                SRNYTimesArticle * currentArticleFromTopStories = (SRNYTimesArticle *)self.topStories[indexPath.row];
                
                cell.articleTitle.text = currentArticleFromTopStories.articleTitle;
                cell.bylineView.text = currentArticleFromTopStories.articleByLine;
                cell.articleAbstractField.text = currentArticleFromTopStories.articleAbstract;
                
                if ([currentArticleFromTopStories hasPresentableMediaImage]) {
                    [currentArticleFromTopStories displayMultimediaForArticleWithCompletion:^(SRNYTimesArticleMultimedia * thumb) {
                        
                        if (thumb) {
                            [cell displayThumbnail:thumb.mediaURL];
                        }
                        else{
                            cell.multimediaImageView.image = [UIImage imageWithContentsOfFile:self.urlForPlaceholderImage.absoluteString];
                        }
                        
                    }];
                }
                
            }
            @catch (NSException *exception) {
                exception = [[NSException alloc] initWithName:@"Articles not yet retrieved" reason:@"Cell is being set up before data has been retrieved" userInfo:nil];
            }
            @finally{
                
            }

        }
    }
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.topStories count] ? : 10;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(void) returnToMenu{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 185.0;
}

-(BOOL)prefersStatusBarHidden{ return YES; }

@end
