//
//  SRSplashScreen.m
//  SRHackWeek
//
//  Created by Tur, Louis on 3/17/15.
//  Copyright (c) 2015 Tur, Louis. All rights reserved.
//

#import "SRNYTimesStyle.h"
#import "SRSplashScreen.h"
#import "SRSplashScreenAnimationView.h"
#import <time.h>

static NSString * const kToastButtonTitle = @"Toasty";
static NSString * const kSlideButtonTitle = @"Horizontal Menu";

static CGFloat kViewCornerRadius = 8.0;
static CGFloat kViewBorderWidth = 3.0;
static CGFloat kIconSize = 44.0;


@interface SRSplashScreen ()

@property (strong, nonatomic) SRSplashScreenAnimationView * menuAnimationView;
@property (strong, nonatomic) UIButton * toastDemoButton;
@property (strong, nonatomic) UIButton * navigationDemoButton;
@property (strong, nonatomic) UIImageView * NYTLogoView;
@property (strong, nonatomic) UIView * menuBackgroundView;

@end

@implementation SRSplashScreen{
    CGSize kIconBounds;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.menuAnimationView = [[SRSplashScreenAnimationView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //self.menuAnimationView = [[SRSplashScreenAnimationView alloc] init];
    
    [self setupBlurryBackground:^(BOOL done) {
        if (done) {
            
            [self makeAdjustmentsToAnimatedMenu];
            [self showMenuView:nil];
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

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

    // makes sure that view has been added to the hierarchy
    if ( [[[[self.view subviews] objectEnumerator] allObjects] containsObject:backgroundImageView]) {
        
        complete(YES);
    }
    
}

-(void) makeAdjustmentsToAnimatedMenu{
    

    // -- Toast Notifications Button Setup -- //
    UIImage * toastButtonImage = [SRNYTimesStyle imageOfToastButtonNormalWithIconSize:CGSizeMake(kIconSize, kIconSize)
                                                                     splashButtonText:kToastButtonTitle
                                                                               radius:kViewCornerRadius];
    UIImage * toastButtonImagePressed = [SRNYTimesStyle imageOfToastButtonPressedWithSplashButtonText:kToastButtonTitle];
    
    self.toastDemoButton = [[UIButton alloc] initWithFrame:self.menuAnimationView.topButton.bounds];
    [self.toastDemoButton setImage:toastButtonImage forState:UIControlStateNormal];
    [self.toastDemoButton setImage:toastButtonImagePressed forState:UIControlStateHighlighted];
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
    [self.menuBackgroundView.layer setCornerRadius:kViewCornerRadius];
    [self.menuBackgroundView.layer setMasksToBounds:YES];
    
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

-(void) addActionsToMenuButtons{
    [self.toastDemoButton       addTarget:self action:@selector(dismissMenuView:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationDemoButton  addTarget:self action:@selector(dismissMenuView:) forControlEvents:UIControlEventTouchUpInside];
}

-(void) showMenuView:(id)sender{
    
    UIButton * resetButton = [[UIButton alloc] initWithFrame:CGRectMake(0.0, 0.0, 50, 50)];
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [self.view addSubview:self.menuAnimationView];
        
        resetButton.backgroundColor = [SRNYTimesStyle redBreakingNews];
        [self.menuAnimationView.menuBackground setUserInteractionEnabled:YES];
        [self.menuAnimationView addSubview:resetButton];
    }];
    
    [resetButton addTarget:self action:@selector(showMenuView:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.menuAnimationView addShowSplashMenuAnimationAndRemoveOnCompletion:YES];
}
-(void) dismissMenuView:(id)sender{

    typeof(SRSplashScreenAnimationView *) __weak weakAnimationView = self.menuAnimationView;
    [self.menuAnimationView removeAllAnimations];
    [self.menuAnimationView addDismissSplashMenuAnimationWithBeginTime:0.0 andFillMode:kCAFillModeBoth andRemoveOnCompletion:YES completion:^(BOOL finished) {
        if (finished) {
            [weakAnimationView removeAllAnimations];
        }
    }];
    
    
}

-(BOOL)prefersStatusBarHidden{return YES;}
@end
