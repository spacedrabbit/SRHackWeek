//
//  SRNYTimesStyle.m
//  NYTimes
//
//  Created by Louis Tur on 3/17/15.
//  Copyright (c) 2015 New York Times. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//

#import "SRNYTimesStyle.h"


@implementation SRNYTimesStyle

#pragma mark Cache

static UIColor* _gray246 = nil;
static UIColor* _gray226 = nil;
static UIColor* _gray204 = nil;
static UIColor* _gray165 = nil;
static UIColor* _gray144 = nil;
static UIColor* _gray102 = nil;
static UIColor* _gray88 = nil;
static UIColor* _gray51 = nil;
static UIColor* _gray24 = nil;
static UIColor* _redTimeStamp = nil;
static UIColor* _redDestructiveAction = nil;
static UIColor* _redBreakingNews = nil;
static UIColor* _bluePromo = nil;
static UIColor* _blueApplicationTint = nil;
static UIColor* _blueLink = nil;
static UIColor* _blueHighlightedPromo = nil;

static PCGradient* _gradient = nil;

static UIImage* _sliderIcon = nil;
static UIImage* _toastIcon = nil;

static UIImage* _imageOfSlideIcon = nil;
static UIImage* _imageOfToastImage = nil;

#pragma mark Initialization

+ (void)initialize
{
    // Colors Initialization
    _gray246 = [UIColor colorWithRed: 0.965 green: 0.965 blue: 0.965 alpha: 1];
    _gray226 = [UIColor colorWithRed: 0.886 green: 0.886 blue: 0.886 alpha: 1];
    _gray204 = [UIColor colorWithRed: 0.8 green: 0.8 blue: 0.8 alpha: 1];
    _gray165 = [UIColor colorWithRed: 0.647 green: 0.647 blue: 0.647 alpha: 1];
    _gray144 = [UIColor colorWithRed: 0.565 green: 0.565 blue: 0.565 alpha: 1];
    _gray102 = [UIColor colorWithRed: 0.4 green: 0.4 blue: 0.4 alpha: 1];
    _gray88 = [UIColor colorWithRed: 0.345 green: 0.345 blue: 0.345 alpha: 1];
    _gray51 = [UIColor colorWithRed: 0.2 green: 0.2 blue: 0.2 alpha: 1];
    _gray24 = [UIColor colorWithRed: 0.094 green: 0.094 blue: 0.094 alpha: 1];
    _redTimeStamp = [UIColor colorWithRed: 0.659 green: 0.094 blue: 0.09 alpha: 1];
    _redDestructiveAction = [UIColor colorWithRed: 1 green: 0.227 blue: 0.188 alpha: 1];
    _redBreakingNews = [UIColor colorWithRed: 0.773 green: 0.169 blue: 0.012 alpha: 1];
    _bluePromo = [UIColor colorWithRed: 0.141 green: 0.557 blue: 0.824 alpha: 1];
    _blueApplicationTint = [UIColor colorWithRed: 0.204 green: 0.557 blue: 0.824 alpha: 1];
    _blueLink = [UIColor colorWithRed: 0.216 green: 0.518 blue: 0.729 alpha: 1];
    _blueHighlightedPromo = [UIColor colorWithRed: 0.063 green: 0.314 blue: 0.706 alpha: 1];

    // Gradients Initialization
    CGFloat gradientLocations[] = {0, 1};
    _gradient = [PCGradient gradientWithColors: @[SRNYTimesStyle.gray226, SRNYTimesStyle.gray204] locations: gradientLocations];

}

#pragma mark Colors

+ (UIColor*)gray246 { return _gray246; }
+ (UIColor*)gray226 { return _gray226; }
+ (UIColor*)gray204 { return _gray204; }
+ (UIColor*)gray165 { return _gray165; }
+ (UIColor*)gray144 { return _gray144; }
+ (UIColor*)gray102 { return _gray102; }
+ (UIColor*)gray88 { return _gray88; }
+ (UIColor*)gray51 { return _gray51; }
+ (UIColor*)gray24 { return _gray24; }
+ (UIColor*)redTimeStamp { return _redTimeStamp; }
+ (UIColor*)redDestructiveAction { return _redDestructiveAction; }
+ (UIColor*)redBreakingNews { return _redBreakingNews; }
+ (UIColor*)bluePromo { return _bluePromo; }
+ (UIColor*)blueApplicationTint { return _blueApplicationTint; }
+ (UIColor*)blueLink { return _blueLink; }
+ (UIColor*)blueHighlightedPromo { return _blueHighlightedPromo; }

#pragma mark Gradients

+ (PCGradient*)gradient { return _gradient; }

#pragma mark Images

+ (UIImage*)sliderIcon { return _sliderIcon ?: (_sliderIcon = [UIImage imageNamed: @"sliderIcon"]); }
+ (UIImage*)toastIcon { return _toastIcon ?: (_toastIcon = [UIImage imageNamed: @"toastIcon"]); }

#pragma mark Drawing Methods

+ (void)drawSliderButtonNormalWithIconSize: (CGSize)iconSize splashButtonText: (NSString*)splashButtonText radius: (CGFloat)radius
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// splashButton
    {
        //// buttonBackground Drawing
        UIBezierPath* buttonBackgroundPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(1, 1, 158, 58) cornerRadius: radius];
        [SRNYTimesStyle.gray246 setFill];
        [buttonBackgroundPath fill];
        [SRNYTimesStyle.gray204 setStroke];
        buttonBackgroundPath.lineWidth = 2;
        [buttonBackgroundPath stroke];


        //// buttonText Drawing
        CGRect buttonTextRect = CGRectMake(53, 4, 103, 52);
        NSMutableParagraphStyle* buttonTextStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
        buttonTextStyle.alignment = NSTextAlignmentCenter;

        NSDictionary* buttonTextFontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"Avenir-Black" size: 15], NSForegroundColorAttributeName: SRNYTimesStyle.gray88, NSParagraphStyleAttributeName: buttonTextStyle};

        CGFloat buttonTextTextHeight = [splashButtonText boundingRectWithSize: CGSizeMake(buttonTextRect.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: buttonTextFontAttributes context: nil].size.height;
        CGContextSaveGState(context);
        CGContextClipToRect(context, buttonTextRect);
        [splashButtonText drawInRect: CGRectMake(CGRectGetMinX(buttonTextRect), CGRectGetMinY(buttonTextRect) + (CGRectGetHeight(buttonTextRect) - buttonTextTextHeight) / 2, CGRectGetWidth(buttonTextRect), buttonTextTextHeight) withAttributes: buttonTextFontAttributes];
        CGContextRestoreGState(context);
    }


    //// Symbol Drawing
    CGRect symbolRect = CGRectMake(8, 8, iconSize.width, iconSize.height);
    CGContextSaveGState(context);
    UIRectClip(symbolRect);
    CGContextTranslateCTM(context, symbolRect.origin.x, symbolRect.origin.y);
    CGContextScaleCTM(context, symbolRect.size.width / 88, symbolRect.size.height / 88);

    [SRNYTimesStyle drawSlideIcon];
    CGContextRestoreGState(context);
}

+ (void)drawSlideButtonPressedWithSplashButtonText: (NSString*)splashButtonText
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Symbol Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 80, 30);
    CGContextScaleCTM(context, 0.8, 0.8);

    CGRect symbolRect = CGRectMake(-80, -30, 160, 60);
    CGContextSaveGState(context);
    UIRectClip(symbolRect);
    CGContextTranslateCTM(context, symbolRect.origin.x, symbolRect.origin.y);

    [SRNYTimesStyle drawSliderButtonNormalWithIconSize: CGSizeMake(44, 44) splashButtonText: splashButtonText radius: 8];
    CGContextRestoreGState(context);

    CGContextRestoreGState(context);
}

+ (void)drawToastButtonNormalWithIconSize: (CGSize)iconSize splashButtonText: (NSString*)splashButtonText radius: (CGFloat)radius
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// splashButton
    {
        //// buttonBackground Drawing
        UIBezierPath* buttonBackgroundPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(1, 1, 158, 58) cornerRadius: radius];
        [SRNYTimesStyle.gray246 setFill];
        [buttonBackgroundPath fill];
        [SRNYTimesStyle.gray204 setStroke];
        buttonBackgroundPath.lineWidth = 2;
        [buttonBackgroundPath stroke];


        //// buttonText Drawing
        CGRect buttonTextRect = CGRectMake(53, 4, 103, 52);
        NSMutableParagraphStyle* buttonTextStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
        buttonTextStyle.alignment = NSTextAlignmentCenter;

        NSDictionary* buttonTextFontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"Avenir-Black" size: 15], NSForegroundColorAttributeName: SRNYTimesStyle.gray88, NSParagraphStyleAttributeName: buttonTextStyle};

        CGFloat buttonTextTextHeight = [splashButtonText boundingRectWithSize: CGSizeMake(buttonTextRect.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: buttonTextFontAttributes context: nil].size.height;
        CGContextSaveGState(context);
        CGContextClipToRect(context, buttonTextRect);
        [splashButtonText drawInRect: CGRectMake(CGRectGetMinX(buttonTextRect), CGRectGetMinY(buttonTextRect) + (CGRectGetHeight(buttonTextRect) - buttonTextTextHeight) / 2, CGRectGetWidth(buttonTextRect), buttonTextTextHeight) withAttributes: buttonTextFontAttributes];
        CGContextRestoreGState(context);
    }


    //// Symbol Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 8, 8);
    CGContextRotateCTM(context, -360 * M_PI / 180);

    CGRect symbolRect = CGRectMake(0, 0, iconSize.width, iconSize.height);
    CGContextSaveGState(context);
    UIRectClip(symbolRect);
    CGContextTranslateCTM(context, symbolRect.origin.x, symbolRect.origin.y);
    CGContextScaleCTM(context, symbolRect.size.width / 88, symbolRect.size.height / 88);

    [SRNYTimesStyle drawToastImage];
    CGContextRestoreGState(context);

    CGContextRestoreGState(context);
}

+ (void)drawToastButtonPressedWithSplashButtonText: (NSString*)splashButtonText
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Symbol Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 80, 30);
    CGContextScaleCTM(context, 0.8, 0.8);

    CGRect symbolRect = CGRectMake(-80, -30, 160, 60);
    CGContextSaveGState(context);
    UIRectClip(symbolRect);
    CGContextTranslateCTM(context, symbolRect.origin.x, symbolRect.origin.y);

    [SRNYTimesStyle drawToastButtonNormalWithIconSize: CGSizeMake(44, 44) splashButtonText: splashButtonText radius: 8];
    CGContextRestoreGState(context);

    CGContextRestoreGState(context);
}

+ (void)drawSlideIcon
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Group
    {
        //// backgroundFill Drawing
        UIBezierPath* backgroundFillPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0, 0, 88, 88) cornerRadius: 8];
        [SRNYTimesStyle.gray226 setFill];
        [backgroundFillPath fill];


        //// iconSymbol Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 0, 15);
        CGContextScaleCTM(context, 0.9, 0.9);

        UIBezierPath* iconSymbolPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0, 0, 97.78, 74.44) cornerRadius: 8];
        CGContextSaveGState(context);
        [iconSymbolPath addClip];
        [SRNYTimesStyle.sliderIcon drawInRect: CGRectMake(0, 0, SRNYTimesStyle.sliderIcon.size.width, SRNYTimesStyle.sliderIcon.size.height)];
        CGContextRestoreGState(context);

        CGContextRestoreGState(context);
    }
}

+ (void)drawToastImage
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Group
    {
        //// backgroundFill Drawing
        UIBezierPath* backgroundFillPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0, 0, 88, 88) cornerRadius: 8];
        [SRNYTimesStyle.gray226 setFill];
        [backgroundFillPath fill];


        //// toastIconImage Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 4, 12.6);
        CGContextScaleCTM(context, 0.8, 0.8);

        UIBezierPath* toastIconImagePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0, 0, 100, 88) cornerRadius: 8];
        CGContextSaveGState(context);
        [toastIconImagePath addClip];
        [SRNYTimesStyle.toastIcon drawInRect: CGRectMake(0, 0, SRNYTimesStyle.toastIcon.size.width, SRNYTimesStyle.toastIcon.size.height)];
        CGContextRestoreGState(context);

        CGContextRestoreGState(context);
    }
}

#pragma mark Generated Images

+ (UIImage*)imageOfSliderButtonNormalWithIconSize: (CGSize)iconSize splashButtonText: (NSString*)splashButtonText radius: (CGFloat)radius
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(160, 60), NO, 0.0f);
    [SRNYTimesStyle drawSliderButtonNormalWithIconSize: iconSize splashButtonText: splashButtonText radius: radius];

    UIImage* imageOfSliderButtonNormal = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return imageOfSliderButtonNormal;
}

+ (UIImage*)imageOfSlideButtonPressedWithSplashButtonText: (NSString*)splashButtonText
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(160, 60), NO, 0.0f);
    [SRNYTimesStyle drawSlideButtonPressedWithSplashButtonText: splashButtonText];

    UIImage* imageOfSlideButtonPressed = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return imageOfSlideButtonPressed;
}

+ (UIImage*)imageOfToastButtonNormalWithIconSize: (CGSize)iconSize splashButtonText: (NSString*)splashButtonText radius: (CGFloat)radius
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(160, 60), NO, 0.0f);
    [SRNYTimesStyle drawToastButtonNormalWithIconSize: iconSize splashButtonText: splashButtonText radius: radius];

    UIImage* imageOfToastButtonNormal = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return imageOfToastButtonNormal;
}

+ (UIImage*)imageOfToastButtonPressedWithSplashButtonText: (NSString*)splashButtonText
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(160, 60), NO, 0.0f);
    [SRNYTimesStyle drawToastButtonPressedWithSplashButtonText: splashButtonText];

    UIImage* imageOfToastButtonPressed = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return imageOfToastButtonPressed;
}

+ (UIImage*)imageOfSlideIcon
{
    if (_imageOfSlideIcon)
        return _imageOfSlideIcon;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(88, 88), NO, 0.0f);
    [SRNYTimesStyle drawSlideIcon];

    _imageOfSlideIcon = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfSlideIcon;
}

+ (UIImage*)imageOfToastImage
{
    if (_imageOfToastImage)
        return _imageOfToastImage;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(88, 88), NO, 0.0f);
    [SRNYTimesStyle drawToastImage];

    _imageOfToastImage = [UIGraphicsGetImageFromCurrentImageContext() imageWithRenderingMode: UIImageRenderingModeAlwaysTemplate];
    UIGraphicsEndImageContext();

    return _imageOfToastImage;
}

#pragma mark Customization Infrastructure

- (void)setSlideIconTargets: (NSArray*)slideIconTargets
{
    _slideIconTargets = slideIconTargets;

    for (id target in self.slideIconTargets)
        [target setImage: SRNYTimesStyle.imageOfSlideIcon];
}

- (void)setToastImageTargets: (NSArray*)toastImageTargets
{
    _toastImageTargets = toastImageTargets;

    for (id target in self.toastImageTargets)
        [target setImage: SRNYTimesStyle.imageOfToastImage];
}


@end



@interface PCGradient ()
{
    CGGradientRef _CGGradient;
}
@end

@implementation PCGradient

- (instancetype)initWithColors: (NSArray*)colors locations: (const CGFloat*)locations
{
    self = super.init;
    if (self)
    {
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        NSMutableArray* cgColors = NSMutableArray.array;
        for (UIColor* color in colors)
            [cgColors addObject: (id)color.CGColor];

        _CGGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)cgColors, locations);
        CGColorSpaceRelease(colorSpace);
    }
    return self;
}

+ (instancetype)gradientWithColors: (NSArray*)colors locations: (const CGFloat*)locations
{
    return [self.alloc initWithColors: colors locations: locations];
}

+ (instancetype)gradientWithStartingColor: (UIColor*)startingColor endingColor: (UIColor*)endingColor
{
    CGFloat locations[] = {0, 1};
    return [self.alloc initWithColors: @[startingColor, endingColor] locations: locations];
}

- (void)dealloc
{
    CGGradientRelease(_CGGradient);
}

@end