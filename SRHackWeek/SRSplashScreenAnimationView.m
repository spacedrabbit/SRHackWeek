//
// SRSplashScreenAnimationView.m
// Generated by Core Animator version 1.0 on 3/17/15.
//
// DO NOT MODIFY THIS FILE. IT IS AUTO-GENERATED AND WILL BE OVERWRITTEN
//
#import "SRSplashScreenAnimationView.h"

static NSString * const kTopMenuButtonName      = @"topButton";
static NSString * const kBottomMenuButtonName   = @"bottomButton";
static NSString * const kMenuBackgroundName     = @"menuBackground";
static NSString * const kLogoImageViewName      = @"logoView";

@interface SRSplashScreenAnimationView ()
@property (strong, nonatomic) NSMapTable *completionBlocksByAnimation;
@end

@implementation SRSplashScreenAnimationView

#pragma mark - Life Cycle

- (instancetype)init
{
	return [self initWithFrame:CGRectMake(0,0,375,667)];
}

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self)
	{
		[self setupHierarchy];
        _topButton      = _viewsByName[kTopMenuButtonName];
        _bottomButton   = _viewsByName[kBottomMenuButtonName];
        _menuBackground = _viewsByName[kMenuBackgroundName];
        _logoView       = _viewsByName[kLogoImageViewName];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self)
	{
		[self setupHierarchy];
	}
	return self;
}

#pragma mark - Scaling

- (void)layoutSubviews
{
	[super layoutSubviews];

	UIView *scalingView = self.viewsByName[@"__scaling__"];
	float xScale = self.bounds.size.width / scalingView.bounds.size.width;
	float yScale = self.bounds.size.height / scalingView.bounds.size.height;
	switch (self.contentMode) {
		case UIViewContentModeScaleToFill:
			break;
		case UIViewContentModeScaleAspectFill:
		{
			float scale = MAX(xScale, yScale);
			xScale = scale;
			yScale = scale;
			break;
		}
		default:
		{
			float scale = MIN(xScale, yScale);
			xScale = scale;
			yScale = scale;
			break;
		}
	}
	scalingView.transform = CGAffineTransformMakeScale(xScale, yScale);
	scalingView.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
}

#pragma mark - Setup

- (void)setupHierarchy
{
	self.completionBlocksByAnimation = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsOpaqueMemory valueOptions:NSPointerFunctionsStrongMemory];
	NSMutableDictionary *viewsByName = [NSMutableDictionary dictionary];
	//NSBundle *bundle = [NSBundle bundleForClass:[self class]];

	UIView *__scaling__ = [UIView new];
	__scaling__.bounds = CGRectMake(0, 0, 375, 667);
	__scaling__.center = CGPointMake(187.5, 333.5);
	[self addSubview:__scaling__];
	viewsByName[@"__scaling__"] = __scaling__;

	UIView *splashMenu = [UIView new];
	splashMenu.bounds = CGRectMake(0, 0, 200.0, 242.6);
	splashMenu.layer.position = CGPointMake(187.500, 312.188);
	[__scaling__ addSubview:splashMenu];
	viewsByName[@"splashMenu"] = splashMenu;

	UIView *menu = [UIView new];
	menu.bounds = CGRectMake(0, 0, 200.0, 200.0);
	menu.layer.position = CGPointMake(100.000, 142.625);
	[splashMenu addSubview:menu];
	viewsByName[@"menu"] = menu;

	UIImageView *menuBackground = [UIImageView new];
	menuBackground.bounds = CGRectMake(0, 0, 200.0, 200.0);
	//UIImage *imgGrayBackground = [UIImage imageWithContentsOfFile:[bundle pathForResource:@"grayBackground.png" ofType:nil]];
	//menuBackground.image = imgGrayBackground;
	menuBackground.contentMode = UIViewContentModeCenter;
	menuBackground.layer.position = CGPointMake(100.000, 100.000);
	[menu addSubview:menuBackground];
	viewsByName[kMenuBackgroundName] = menuBackground;

	UIImageView *bottomButton = [UIImageView new];
	bottomButton.bounds = CGRectMake(0, 0, 160.0, 60.0);
	//UIImage *imgSliderButtonNormal = [UIImage imageWithContentsOfFile:[bundle pathForResource:@"sliderButtonNormal.png" ofType:nil]];
	//bottomButton.image = imgSliderButtonNormal;
	bottomButton.contentMode = UIViewContentModeCenter;
	bottomButton.layer.position = CGPointMake(100.000, 80.973);
	[menu addSubview:bottomButton];
	viewsByName[kBottomMenuButtonName] = bottomButton;

	UIImageView *topButton = [UIImageView new];
	topButton.bounds = CGRectMake(0, 0, 160.0, 60.0);
	//UIImage *imgToastButtonNormal = [UIImage imageWithContentsOfFile:[bundle pathForResource:@"toastButtonNormal.png" ofType:nil]];
	//topButton.image = imgToastButtonNormal;
	topButton.contentMode = UIViewContentModeCenter;
	topButton.layer.position = CGPointMake(100.000, 151.570);
	[menu addSubview:topButton];
	viewsByName[kTopMenuButtonName] = topButton;

	UIImageView *logoView = [UIImageView new];
	logoView.bounds = CGRectMake(0, 0, 92.0, 92.0);
	//UIImage *imgNYTLogo = [UIImage imageWithContentsOfFile:[bundle pathForResource:@"NYTLogo.png" ofType:nil]];
	//logoView.image = imgNYTLogo;
	logoView.contentMode = UIViewContentModeCenter;
	logoView.layer.position = CGPointMake(100.000, 46.000);
	[splashMenu addSubview:logoView];
	viewsByName[kLogoImageViewName] = logoView;

	self.viewsByName = viewsByName;
}

#pragma mark - showSplashMenu

- (void)addShowSplashMenuAnimation
{
	[self addShowSplashMenuAnimationWithBeginTime:0 andFillMode:kCAFillModeBoth andRemoveOnCompletion:NO completion:NULL];
}

- (void)addShowSplashMenuAnimationWithCompletion:(void (^)(BOOL finished))completionBlock
{
	[self addShowSplashMenuAnimationWithBeginTime:0 andFillMode:kCAFillModeBoth andRemoveOnCompletion:NO completion:completionBlock];
}

- (void)addShowSplashMenuAnimationAndRemoveOnCompletion:(BOOL)removedOnCompletion
{
	[self addShowSplashMenuAnimationWithBeginTime:0 andFillMode:removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth andRemoveOnCompletion:removedOnCompletion completion:NULL];
}

- (void)addShowSplashMenuAnimationAndRemoveOnCompletion:(BOOL)removedOnCompletion completion:(void (^)(BOOL finished))completionBlock
{
	[self addShowSplashMenuAnimationWithBeginTime:0 andFillMode:removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth andRemoveOnCompletion:removedOnCompletion completion:completionBlock];
}

- (void)addShowSplashMenuAnimationWithBeginTime:(CFTimeInterval)beginTime andFillMode:(NSString *)fillMode andRemoveOnCompletion:(BOOL)removedOnCompletion completion:(void (^)(BOOL finished))completionBlock
{
	CAMediaTimingFunction *linearTiming = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
	CAMediaTimingFunction *easeInTiming = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
	CAMediaTimingFunction *overshootTiming = [CAMediaTimingFunction functionWithControlPoints:0.00 :0.00 :0.58 :1.30];

	if (completionBlock)
	{
		CABasicAnimation *representativeAnimation = [CABasicAnimation animationWithKeyPath:@"not.a.real.key"];
		representativeAnimation.duration = 1.325;
		representativeAnimation.delegate = self;
		[self.layer addAnimation:representativeAnimation forKey:@"ShowSplashMenu"];
		[self.completionBlocksByAnimation setObject:completionBlock forKey:[self.layer animationForKey:@"ShowSplashMenu"]];
	}

	CAKeyframeAnimation *topButtonTranslationXAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
	topButtonTranslationXAnimation.duration = 1.325;
	topButtonTranslationXAnimation.values = @[@(0.000), @(0.000), @(0.000), @(0.000)];
	topButtonTranslationXAnimation.keyTimes = @[@(0.000), @(0.566), @(0.849), @(1.000)];
	topButtonTranslationXAnimation.timingFunctions = @[overshootTiming, overshootTiming, linearTiming];
	topButtonTranslationXAnimation.beginTime = beginTime;
	topButtonTranslationXAnimation.fillMode = fillMode;
	topButtonTranslationXAnimation.removedOnCompletion = removedOnCompletion;
	[[self.viewsByName[kTopMenuButtonName] layer] addAnimation:topButtonTranslationXAnimation forKey:@"showSplashMenu_TranslationX"];

	CAKeyframeAnimation *topButtonTranslationYAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
	topButtonTranslationYAnimation.duration = 1.325;
	topButtonTranslationYAnimation.values = @[@(0.000), @(463.000), @(443.000), @(443.000)];
	topButtonTranslationYAnimation.keyTimes = @[@(0.000), @(0.566), @(0.849), @(1.000)];
	topButtonTranslationYAnimation.timingFunctions = @[easeInTiming, overshootTiming, linearTiming];
	topButtonTranslationYAnimation.beginTime = beginTime;
	topButtonTranslationYAnimation.fillMode = fillMode;
	topButtonTranslationYAnimation.removedOnCompletion = removedOnCompletion;
	[[self.viewsByName[kTopMenuButtonName] layer] addAnimation:topButtonTranslationYAnimation forKey:@"showSplashMenu_TranslationY"];

	CAKeyframeAnimation *bottomButtonTranslationXAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
	bottomButtonTranslationXAnimation.duration = 1.325;
	bottomButtonTranslationXAnimation.values = @[@(0.000), @(0.000), @(0.000), @(0.000)];
	bottomButtonTranslationXAnimation.keyTimes = @[@(0.000), @(0.566), @(0.849), @(1.000)];
	bottomButtonTranslationXAnimation.timingFunctions = @[overshootTiming, overshootTiming, linearTiming];
	bottomButtonTranslationXAnimation.beginTime = beginTime;
	bottomButtonTranslationXAnimation.fillMode = fillMode;
	bottomButtonTranslationXAnimation.removedOnCompletion = removedOnCompletion;
	[[self.viewsByName[kBottomMenuButtonName] layer] addAnimation:bottomButtonTranslationXAnimation forKey:@"showSplashMenu_TranslationX"];

	CAKeyframeAnimation *bottomButtonTranslationYAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
	bottomButtonTranslationYAnimation.duration = 1.325;
	bottomButtonTranslationYAnimation.values = @[@(0.000), @(463.000), @(443.000), @(443.000)];
	bottomButtonTranslationYAnimation.keyTimes = @[@(0.000), @(0.566), @(0.849), @(1.000)];
	bottomButtonTranslationYAnimation.timingFunctions = @[easeInTiming, overshootTiming, linearTiming];
	bottomButtonTranslationYAnimation.beginTime = beginTime;
	bottomButtonTranslationYAnimation.fillMode = fillMode;
	bottomButtonTranslationYAnimation.removedOnCompletion = removedOnCompletion;
	[[self.viewsByName[kBottomMenuButtonName] layer] addAnimation:bottomButtonTranslationYAnimation forKey:@"showSplashMenu_TranslationY"];

	CAKeyframeAnimation *logoViewTranslationXAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
	logoViewTranslationXAnimation.duration = 1.325;
	logoViewTranslationXAnimation.values = @[@(0.000), @(0.000), @(0.000)];
	logoViewTranslationXAnimation.keyTimes = @[@(0.000), @(0.755), @(1.000)];
	logoViewTranslationXAnimation.timingFunctions = @[overshootTiming, overshootTiming];
	logoViewTranslationXAnimation.beginTime = beginTime;
	logoViewTranslationXAnimation.fillMode = fillMode;
	logoViewTranslationXAnimation.removedOnCompletion = removedOnCompletion;
	[[self.viewsByName[kLogoImageViewName] layer] addAnimation:logoViewTranslationXAnimation forKey:@"showSplashMenu_TranslationX"];

	CAKeyframeAnimation *logoViewTranslationYAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
	logoViewTranslationYAnimation.duration = 1.325;
	logoViewTranslationYAnimation.values = @[@(0.000), @(457.000), @(437.000)];
	logoViewTranslationYAnimation.keyTimes = @[@(0.000), @(0.698), @(1.000)];
	logoViewTranslationYAnimation.timingFunctions = @[linearTiming, overshootTiming];
	logoViewTranslationYAnimation.beginTime = beginTime;
	logoViewTranslationYAnimation.fillMode = fillMode;
	logoViewTranslationYAnimation.removedOnCompletion = removedOnCompletion;
	[[self.viewsByName[kLogoImageViewName] layer] addAnimation:logoViewTranslationYAnimation forKey:@"showSplashMenu_TranslationY"];

	CAKeyframeAnimation *menuBackgroundTranslationXAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
	menuBackgroundTranslationXAnimation.duration = 1.325;
	menuBackgroundTranslationXAnimation.values = @[@(0.000), @(0.000), @(0.000), @(0.000)];
	menuBackgroundTranslationXAnimation.keyTimes = @[@(0.000), @(0.566), @(0.849), @(1.000)];
	menuBackgroundTranslationXAnimation.timingFunctions = @[overshootTiming, overshootTiming, linearTiming];
	menuBackgroundTranslationXAnimation.beginTime = beginTime;
	menuBackgroundTranslationXAnimation.fillMode = fillMode;
	menuBackgroundTranslationXAnimation.removedOnCompletion = removedOnCompletion;
	[[self.viewsByName[kMenuBackgroundName] layer] addAnimation:menuBackgroundTranslationXAnimation forKey:@"showSplashMenu_TranslationX"];

	CAKeyframeAnimation *menuBackgroundTranslationYAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
	menuBackgroundTranslationYAnimation.duration = 1.325;
	menuBackgroundTranslationYAnimation.values = @[@(0.000), @(447.000), @(437.000), @(437.000)];
	menuBackgroundTranslationYAnimation.keyTimes = @[@(0.000), @(0.566), @(0.849), @(1.000)];
	menuBackgroundTranslationYAnimation.timingFunctions = @[easeInTiming, overshootTiming, linearTiming];
	menuBackgroundTranslationYAnimation.beginTime = beginTime;
	menuBackgroundTranslationYAnimation.fillMode = fillMode;
	menuBackgroundTranslationYAnimation.removedOnCompletion = removedOnCompletion;
	[[self.viewsByName[kMenuBackgroundName] layer] addAnimation:menuBackgroundTranslationYAnimation forKey:@"showSplashMenu_TranslationY"];

	CAKeyframeAnimation *splashMenuTranslationXAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
	splashMenuTranslationXAnimation.duration = 1.325;
	splashMenuTranslationXAnimation.values = @[@(0.742), @(0.742)];
	splashMenuTranslationXAnimation.keyTimes = @[@(0.000), @(1.000)];
	splashMenuTranslationXAnimation.timingFunctions = @[linearTiming];
	splashMenuTranslationXAnimation.beginTime = beginTime;
	splashMenuTranslationXAnimation.fillMode = fillMode;
	splashMenuTranslationXAnimation.removedOnCompletion = removedOnCompletion;
	[[self.viewsByName[@"splashMenu"] layer] addAnimation:splashMenuTranslationXAnimation forKey:@"showSplashMenu_TranslationX"];

	CAKeyframeAnimation *splashMenuTranslationYAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
	splashMenuTranslationYAnimation.duration = 1.325;
	splashMenuTranslationYAnimation.values = @[@(-439.000), @(-439.000)];
	splashMenuTranslationYAnimation.keyTimes = @[@(0.000), @(1.000)];
	splashMenuTranslationYAnimation.timingFunctions = @[linearTiming];
	splashMenuTranslationYAnimation.beginTime = beginTime;
	splashMenuTranslationYAnimation.fillMode = fillMode;
	splashMenuTranslationYAnimation.removedOnCompletion = removedOnCompletion;
	[[self.viewsByName[@"splashMenu"] layer] addAnimation:splashMenuTranslationYAnimation forKey:@"showSplashMenu_TranslationY"];
}

- (void)removeShowSplashMenuAnimation
{
	[self.layer removeAnimationForKey:@"ShowSplashMenu"];
	[[self.viewsByName[kTopMenuButtonName] layer] removeAnimationForKey:@"showSplashMenu_TranslationX"];
	[[self.viewsByName[kTopMenuButtonName] layer] removeAnimationForKey:@"showSplashMenu_TranslationY"];
	[[self.viewsByName[kBottomMenuButtonName] layer] removeAnimationForKey:@"showSplashMenu_TranslationX"];
	[[self.viewsByName[kBottomMenuButtonName] layer] removeAnimationForKey:@"showSplashMenu_TranslationY"];
	[[self.viewsByName[kLogoImageViewName] layer] removeAnimationForKey:@"showSplashMenu_TranslationX"];
	[[self.viewsByName[kLogoImageViewName] layer] removeAnimationForKey:@"showSplashMenu_TranslationY"];
	[[self.viewsByName[kMenuBackgroundName] layer] removeAnimationForKey:@"showSplashMenu_TranslationX"];
	[[self.viewsByName[kMenuBackgroundName] layer] removeAnimationForKey:@"showSplashMenu_TranslationY"];
	[[self.viewsByName[@"splashMenu"] layer] removeAnimationForKey:@"showSplashMenu_TranslationX"];
	[[self.viewsByName[@"splashMenu"] layer] removeAnimationForKey:@"showSplashMenu_TranslationY"];
}

#pragma mark - dismissSplashMenu

- (void)addDismissSplashMenuAnimation
{
	[self addDismissSplashMenuAnimationWithBeginTime:0 andFillMode:kCAFillModeBoth andRemoveOnCompletion:NO completion:NULL];
}

- (void)addDismissSplashMenuAnimationWithCompletion:(void (^)(BOOL finished))completionBlock
{
	[self addDismissSplashMenuAnimationWithBeginTime:0 andFillMode:kCAFillModeBoth andRemoveOnCompletion:NO completion:completionBlock];
}

- (void)addDismissSplashMenuAnimationAndRemoveOnCompletion:(BOOL)removedOnCompletion
{
	[self addDismissSplashMenuAnimationWithBeginTime:0 andFillMode:removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth andRemoveOnCompletion:removedOnCompletion completion:NULL];
}

- (void)addDismissSplashMenuAnimationAndRemoveOnCompletion:(BOOL)removedOnCompletion completion:(void (^)(BOOL finished))completionBlock
{
	[self addDismissSplashMenuAnimationWithBeginTime:0 andFillMode:removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth andRemoveOnCompletion:removedOnCompletion completion:completionBlock];
}

- (void)addDismissSplashMenuAnimationWithBeginTime:(CFTimeInterval)beginTime andFillMode:(NSString *)fillMode andRemoveOnCompletion:(BOOL)removedOnCompletion completion:(void (^)(BOOL finished))completionBlock
{
	CAMediaTimingFunction *linearTiming = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
	CAMediaTimingFunction *easeOutTiming = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
	CAMediaTimingFunction *overshootTiming = [CAMediaTimingFunction functionWithControlPoints:0.00 :0.00 :0.58 :1.30];
	CAMediaTimingFunction *easeInTiming = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
	CAMediaTimingFunction *anticipateTiming = [CAMediaTimingFunction functionWithControlPoints:0.42 :-0.30 :1.00 :1.00];

	if (completionBlock)
	{
		CABasicAnimation *representativeAnimation = [CABasicAnimation animationWithKeyPath:@"not.a.real.key"];
		representativeAnimation.duration = 1.125;
		representativeAnimation.delegate = self;
		[self.layer addAnimation:representativeAnimation forKey:@"DismissSplashMenu"];
		[self.completionBlocksByAnimation setObject:completionBlock forKey:[self.layer animationForKey:@"DismissSplashMenu"]];
	}

	CAKeyframeAnimation *topButtonTranslationXAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
	topButtonTranslationXAnimation.duration = 1.125;
	topButtonTranslationXAnimation.values = @[@(0.000), @(0.000), @(0.000)];
	topButtonTranslationXAnimation.keyTimes = @[@(0.000), @(0.667), @(1.000)];
	topButtonTranslationXAnimation.timingFunctions = @[overshootTiming, linearTiming];
	topButtonTranslationXAnimation.beginTime = beginTime;
	topButtonTranslationXAnimation.fillMode = fillMode;
	topButtonTranslationXAnimation.removedOnCompletion = removedOnCompletion;
	[[self.viewsByName[kTopMenuButtonName] layer] addAnimation:topButtonTranslationXAnimation forKey:@"dismissSplashMenu_TranslationX"];

	CAKeyframeAnimation *topButtonTranslationYAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
	topButtonTranslationYAnimation.duration = 1.125;
	topButtonTranslationYAnimation.values = @[@(0.000), @(463.000), @(463.000)];
	topButtonTranslationYAnimation.keyTimes = @[@(0.000), @(0.667), @(1.000)];
	topButtonTranslationYAnimation.timingFunctions = @[anticipateTiming, linearTiming];
	topButtonTranslationYAnimation.beginTime = beginTime;
	topButtonTranslationYAnimation.fillMode = fillMode;
	topButtonTranslationYAnimation.removedOnCompletion = removedOnCompletion;
	[[self.viewsByName[kTopMenuButtonName] layer] addAnimation:topButtonTranslationYAnimation forKey:@"dismissSplashMenu_TranslationY"];

	CAKeyframeAnimation *bottomButtonTranslationXAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
	bottomButtonTranslationXAnimation.duration = 1.125;
	bottomButtonTranslationXAnimation.values = @[@(0.000), @(0.000), @(0.000)];
	bottomButtonTranslationXAnimation.keyTimes = @[@(0.000), @(0.667), @(1.000)];
	bottomButtonTranslationXAnimation.timingFunctions = @[overshootTiming, linearTiming];
	bottomButtonTranslationXAnimation.beginTime = beginTime;
	bottomButtonTranslationXAnimation.fillMode = fillMode;
	bottomButtonTranslationXAnimation.removedOnCompletion = removedOnCompletion;
	[[self.viewsByName[kBottomMenuButtonName] layer] addAnimation:bottomButtonTranslationXAnimation forKey:@"dismissSplashMenu_TranslationX"];

	CAKeyframeAnimation *bottomButtonTranslationYAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
	bottomButtonTranslationYAnimation.duration = 1.125;
	bottomButtonTranslationYAnimation.values = @[@(0.000), @(463.000), @(463.000)];
	bottomButtonTranslationYAnimation.keyTimes = @[@(0.000), @(0.667), @(1.000)];
	bottomButtonTranslationYAnimation.timingFunctions = @[anticipateTiming, linearTiming];
	bottomButtonTranslationYAnimation.beginTime = beginTime;
	bottomButtonTranslationYAnimation.fillMode = fillMode;
	bottomButtonTranslationYAnimation.removedOnCompletion = removedOnCompletion;
	[[self.viewsByName[kBottomMenuButtonName] layer] addAnimation:bottomButtonTranslationYAnimation forKey:@"dismissSplashMenu_TranslationY"];

	CAKeyframeAnimation *logoViewOpacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
	logoViewOpacityAnimation.duration = 1.125;
	logoViewOpacityAnimation.values = @[@(1.000), @(1.000), @(0.000)];
	logoViewOpacityAnimation.keyTimes = @[@(0.000), @(0.667), @(1.000)];
	logoViewOpacityAnimation.timingFunctions = @[overshootTiming, overshootTiming];
	logoViewOpacityAnimation.beginTime = beginTime;
	logoViewOpacityAnimation.fillMode = fillMode;
	logoViewOpacityAnimation.removedOnCompletion = removedOnCompletion;
	[[self.viewsByName[kLogoImageViewName] layer] addAnimation:logoViewOpacityAnimation forKey:@"dismissSplashMenu_Opacity"];

	CAKeyframeAnimation *logoViewScaleXAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.x"];
	logoViewScaleXAnimation.duration = 1.125;
	logoViewScaleXAnimation.values = @[@(1.000), @(0.904), @(1.530)];
	logoViewScaleXAnimation.keyTimes = @[@(0.000), @(0.667), @(1.000)];
	logoViewScaleXAnimation.timingFunctions = @[overshootTiming, overshootTiming];
	logoViewScaleXAnimation.beginTime = beginTime;
	logoViewScaleXAnimation.fillMode = fillMode;
	logoViewScaleXAnimation.removedOnCompletion = removedOnCompletion;
	[[self.viewsByName[kLogoImageViewName] layer] addAnimation:logoViewScaleXAnimation forKey:@"dismissSplashMenu_ScaleX"];

	CAKeyframeAnimation *logoViewScaleYAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.y"];
	logoViewScaleYAnimation.duration = 1.125;
	logoViewScaleYAnimation.values = @[@(1.000), @(0.904), @(1.530)];
	logoViewScaleYAnimation.keyTimes = @[@(0.000), @(0.667), @(1.000)];
	logoViewScaleYAnimation.timingFunctions = @[overshootTiming, overshootTiming];
	logoViewScaleYAnimation.beginTime = beginTime;
	logoViewScaleYAnimation.fillMode = fillMode;
	logoViewScaleYAnimation.removedOnCompletion = removedOnCompletion;
	[[self.viewsByName[kLogoImageViewName] layer] addAnimation:logoViewScaleYAnimation forKey:@"dismissSplashMenu_ScaleY"];

	CAKeyframeAnimation *logoViewTranslationXAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
	logoViewTranslationXAnimation.duration = 1.125;
	logoViewTranslationXAnimation.values = @[@(0.000), @(0.000), @(0.000)];
	logoViewTranslationXAnimation.keyTimes = @[@(0.000), @(0.667), @(1.000)];
	logoViewTranslationXAnimation.timingFunctions = @[easeOutTiming, linearTiming];
	logoViewTranslationXAnimation.beginTime = beginTime;
	logoViewTranslationXAnimation.fillMode = fillMode;
	logoViewTranslationXAnimation.removedOnCompletion = removedOnCompletion;
	[[self.viewsByName[kLogoImageViewName] layer] addAnimation:logoViewTranslationXAnimation forKey:@"dismissSplashMenu_TranslationX"];

	CAKeyframeAnimation *logoViewTranslationYAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
	logoViewTranslationYAnimation.duration = 1.125;
	logoViewTranslationYAnimation.values = @[@(0.000), @(87.805), @(87.805)];
	logoViewTranslationYAnimation.keyTimes = @[@(0.000), @(0.667), @(1.000)];
	logoViewTranslationYAnimation.timingFunctions = @[easeInTiming, linearTiming];
	logoViewTranslationYAnimation.beginTime = beginTime;
	logoViewTranslationYAnimation.fillMode = fillMode;
	logoViewTranslationYAnimation.removedOnCompletion = removedOnCompletion;
	[[self.viewsByName[kLogoImageViewName] layer] addAnimation:logoViewTranslationYAnimation forKey:@"dismissSplashMenu_TranslationY"];

	CAKeyframeAnimation *menuBackgroundTranslationXAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
	menuBackgroundTranslationXAnimation.duration = 1.125;
	menuBackgroundTranslationXAnimation.values = @[@(0.000), @(0.000)];
	menuBackgroundTranslationXAnimation.keyTimes = @[@(0.000), @(1.000)];
	menuBackgroundTranslationXAnimation.timingFunctions = @[linearTiming];
	menuBackgroundTranslationXAnimation.beginTime = beginTime;
	menuBackgroundTranslationXAnimation.fillMode = fillMode;
	menuBackgroundTranslationXAnimation.removedOnCompletion = removedOnCompletion;
	[[self.viewsByName[kMenuBackgroundName] layer] addAnimation:menuBackgroundTranslationXAnimation forKey:@"dismissSplashMenu_TranslationX"];

	CAKeyframeAnimation *menuBackgroundTranslationYAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
	menuBackgroundTranslationYAnimation.duration = 1.125;
	menuBackgroundTranslationYAnimation.values = @[@(0.000), @(463.000), @(463.000)];
	menuBackgroundTranslationYAnimation.keyTimes = @[@(0.000), @(0.667), @(1.000)];
	menuBackgroundTranslationYAnimation.timingFunctions = @[anticipateTiming, linearTiming];
	menuBackgroundTranslationYAnimation.beginTime = beginTime;
	menuBackgroundTranslationYAnimation.fillMode = fillMode;
	menuBackgroundTranslationYAnimation.removedOnCompletion = removedOnCompletion;
	[[self.viewsByName[kMenuBackgroundName] layer] addAnimation:menuBackgroundTranslationYAnimation forKey:@"dismissSplashMenu_TranslationY"];
}

- (void)removeDismissSplashMenuAnimation
{
	[self.layer removeAnimationForKey:@"DismissSplashMenu"];
	[[self.viewsByName[kTopMenuButtonName] layer] removeAnimationForKey:@"dismissSplashMenu_TranslationX"];
	[[self.viewsByName[kTopMenuButtonName] layer] removeAnimationForKey:@"dismissSplashMenu_TranslationY"];
	[[self.viewsByName[kBottomMenuButtonName] layer] removeAnimationForKey:@"dismissSplashMenu_TranslationX"];
	[[self.viewsByName[kBottomMenuButtonName] layer] removeAnimationForKey:@"dismissSplashMenu_TranslationY"];
	[[self.viewsByName[kLogoImageViewName] layer] removeAnimationForKey:@"dismissSplashMenu_Opacity"];
	[[self.viewsByName[kLogoImageViewName] layer] removeAnimationForKey:@"dismissSplashMenu_ScaleX"];
	[[self.viewsByName[kLogoImageViewName] layer] removeAnimationForKey:@"dismissSplashMenu_ScaleY"];
	[[self.viewsByName[kLogoImageViewName] layer] removeAnimationForKey:@"dismissSplashMenu_TranslationX"];
	[[self.viewsByName[kLogoImageViewName] layer] removeAnimationForKey:@"dismissSplashMenu_TranslationY"];
	[[self.viewsByName[kMenuBackgroundName] layer] removeAnimationForKey:@"dismissSplashMenu_TranslationX"];
	[[self.viewsByName[kMenuBackgroundName] layer] removeAnimationForKey:@"dismissSplashMenu_TranslationY"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
	void (^completion)(BOOL) = [self.completionBlocksByAnimation objectForKey:anim];
	[self.completionBlocksByAnimation removeObjectForKey:anim];
	if (completion)
	{
		completion(flag);
	}
}

- (void)removeAllAnimations
{
	for (UIView *view in self.viewsByName.allValues)
	{
		[view.layer removeAllAnimations];
	}
	[self.layer removeAnimationForKey:@"ShowSplashMenu"];
	[self.layer removeAnimationForKey:@"DismissSplashMenu"];
}

@end