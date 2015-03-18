//
//  SRSplashScreen.m
//  SRHackWeek
//
//  Created by Tur, Louis on 3/17/15.
//  Copyright (c) 2015 Tur, Louis. All rights reserved.
//

#import "SRNYTimesStyle.h"
#import "SRSplashScreenViewController.h"
#import "SRSplashScreenAnimationView.h"
#import "SRToastNotificationsViewController.h"

static NSString * const kToastButtonTitle = @"Toasty";
static NSString * const kSlideButtonTitle = @"Horizontal Menu";

static CGFloat kViewCornerRadius = 8.0;
static CGFloat kViewBorderWidth = 3.0;
static CGFloat kIconSize = 44.0;


@interface SRSplashScreenViewController ()

@property (strong, nonatomic) SRSplashScreenAnimationView * menuAnimationView;
@property (strong, nonatomic) UIButton * toastDemoButton;
@property (strong, nonatomic) UIButton * navigationDemoButton;
@property (strong, nonatomic) UIImageView * NYTLogoView;
@property (strong, nonatomic) UIView * menuBackgroundView;

@end

@implementation SRSplashScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.menuAnimationView = [[SRSplashScreenAnimationView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [self setupBlurryBackground:^(BOOL done) {
        if (done) {
            [self makeAdjustmentsToAnimatedMenu];
            [self showMenuView:nil];
        }
    }];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self showMenuView:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - BACKGROUND AND VIEW SETUP
/** Adds background image and blur effect to landing view. If view is successfully added to view hierarchy, returns YES
 *
 */
-(void) setupBlurryBackground:(void(^)(BOOL))complete{
    
    UIImage * splashScreenBackgroundImage = [UIImage imageNamed:@"Cat-on-computer.jpg"];
    UIImageView * backgroundImageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [backgroundImageView setImage:splashScreenBackgroundImage];
    [backgroundImageView setContentMode:UIViewContentModeScaleAspectFill];

    UIVisualEffect * blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView * blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    blurEffectView.frame = backgroundImageView.bounds;
    
    [self.view addSubview:backgroundImageView];
    [backgroundImageView addSubview:blurEffectView];
    
    [self.view addSubview:self.menuAnimationView]; 
    
    // makes sure that view has been added to the hierarchy
    if ( [[[[self.view subviews] objectEnumerator] allObjects] containsObject:backgroundImageView]) {
        complete(YES);
    }
}

/** Adds UI Customizations to scaffolded animation view, including setting iVar references for later use
 *
 */
-(void) makeAdjustmentsToAnimatedMenu{
    

    // -- Toast Notifications Button Setup -- //
    UIImage * toastButtonImage = [SRNYTimesStyle imageOfToastButtonNormalWithIconSize:CGSizeMake(kIconSize, kIconSize)
                                                                     splashButtonText:kToastButtonTitle
                                                                               radius:kViewCornerRadius];
    UIImage * toastButtonImagePressed = [SRNYTimesStyle imageOfToastButtonPressedWithSplashButtonText:kToastButtonTitle];
    
    self.toastDemoButton = [[UIButton alloc] initWithFrame:self.menuAnimationView.topButton.bounds];
    [self.toastDemoButton setImage:toastButtonImage forState:UIControlStateNormal];
    [self.toastDemoButton setImage:toastButtonImagePressed forState:UIControlStateHighlighted];
    [self.toastDemoButton setTag:1];
    [self.menuAnimationView.topButton setUserInteractionEnabled:YES];
    [self.menuAnimationView.topButton addSubview:self.toastDemoButton];
    
    // -- Horizontal Sections Button Setup -- //
    UIImage * sliderButtonImage = [SRNYTimesStyle imageOfSliderButtonNormalWithIconSize:CGSizeMake(kIconSize, kIconSize)
                                                                       splashButtonText:kSlideButtonTitle
                                                                                 radius:kViewCornerRadius];
    UIImage * sliderButtonImagePressed = [SRNYTimesStyle imageOfSlideButtonPressedWithSplashButtonText:kSlideButtonTitle];
    self.navigationDemoButton = [[UIButton alloc] initWithFrame:self.menuAnimationView.bottomButton.bounds];
    [self.navigationDemoButton setImage:sliderButtonImage forState:UIControlStateNormal];
    [self.navigationDemoButton setImage:sliderButtonImagePressed forState:UIControlStateHighlighted];
    [self.menuAnimationView.bottomButton setUserInteractionEnabled:YES];
    [self.menuAnimationView.bottomButton addSubview:self.navigationDemoButton];
    
    // -- Main Menu Background -- //
    self.menuBackgroundView = self.menuAnimationView.menuBackground;
    [self.menuBackgroundView setBackgroundColor:[SRNYTimesStyle gray226]];
    [self.menuBackgroundView.layer setBorderWidth:kViewBorderWidth];
    [self.menuBackgroundView.layer setBorderColor:[SRNYTimesStyle gray165].CGColor];
    [self.menuBackgroundView.layer setMasksToBounds:YES];
    [self.menuBackgroundView.layer setCornerRadius:kViewCornerRadius];
    
    // -- Logo View -- //
    self.NYTLogoView = self.menuAnimationView.logoView;
    [self.NYTLogoView setContentMode:UIViewContentModeScaleAspectFit];
    [self.NYTLogoView setImage:[UIImage imageNamed:@"NYTLogo"]];
    [self.NYTLogoView.layer setCornerRadius:kViewCornerRadius];
    [self.NYTLogoView.layer setBorderWidth:kViewBorderWidth];
    [self.NYTLogoView.layer setBorderColor:[SRNYTimesStyle gray144].CGColor];
    [self.NYTLogoView.layer setMasksToBounds:YES];
    
    [self addActionsToMenuButtons];
}

-(BOOL)prefersStatusBarHidden{return YES;}

#pragma mark - ADDING ACTIONS
/** Adds actions to menu buttons
 */
-(void) addActionsToMenuButtons{
    [self.toastDemoButton       addTarget:self action:@selector(dismissMenuView:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationDemoButton  addTarget:self action:@selector(dismissMenuView:) forControlEvents:UIControlEventTouchUpInside];
}

/** Convinience method to show menu animation
 */
-(void) showMenuView:(id)sender {
    [self.menuAnimationView addShowSplashMenuAnimationAndRemoveOnCompletion:NO];
}

/** Convinience method to dismiss menu animation
 */
-(void) dismissMenuView:(id)sender {
    
    UIButton *pressedButton = (UIButton *)sender;
    typeof(self) __weak weakSelf = self;
    
    [self.menuAnimationView removeAllAnimations];
    [self.menuAnimationView addDismissSplashMenuAnimationWithCompletion:^(BOOL finished) {
        if (finished) {
            if ( pressedButton.tag == 1 ) {

                SRToastNotificationsViewController * tnvc = [[SRToastNotificationsViewController alloc] init];
                UINavigationController * navController = [[UINavigationController alloc] initWithRootViewController:tnvc];
                
                [weakSelf presentViewController:navController animated:YES completion:^{
                }];
            }
        }
    }];
    
}

@end
