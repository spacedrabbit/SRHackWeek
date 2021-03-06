//
//  SRNYTimesStyle.h
//  NYTimes
//
//  Created by Louis Tur on 3/17/15.
//  Copyright (c) 2015 New York Times. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@class PCGradient;

@interface SRNYTimesStyle : NSObject

// iOS Controls Customization Outlets
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* slideIconTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* toastImageTargets;

// Colors
+ (UIColor*)gray246;
+ (UIColor*)gray226;
+ (UIColor*)gray204;
+ (UIColor*)gray165;
+ (UIColor*)gray144;
+ (UIColor*)gray102;
+ (UIColor*)gray88;
+ (UIColor*)gray51;
+ (UIColor*)gray24;
+ (UIColor*)redTimeStamp;
+ (UIColor*)redDestructiveAction;
+ (UIColor*)redBreakingNews;
+ (UIColor*)bluePromo;
+ (UIColor*)blueApplicationTint;
+ (UIColor*)blueLink;
+ (UIColor*)blueHighlightedPromo;

// Gradients
+ (PCGradient*)gradient;

// Images
+ (UIImage*)sliderIcon;
+ (UIImage*)toastIcon;

// Generated Images
+ (UIImage*)imageOfSliderButtonNormalWithIconSize: (CGSize)iconSize
                                 splashButtonText: (NSString*)splashButtonText
                                           radius: (CGFloat)radius;

+ (UIImage*)imageOfSlideButtonPressedWithSplashButtonText: (NSString*)splashButtonText;

+ (UIImage*)imageOfToastButtonNormalWithIconSize: (CGSize)iconSize
                                splashButtonText: (NSString*)splashButtonText
                                          radius: (CGFloat)radius;

+ (UIImage*)imageOfToastButtonPressedWithSplashButtonText: (NSString*)splashButtonText;

+ (UIImage*)imageOfSlideIcon;
+ (UIImage*)imageOfToastImage;

@end



@interface PCGradient : NSObject
@property(nonatomic, readonly) CGGradientRef CGGradient;
- (CGGradientRef)CGGradient NS_RETURNS_INNER_POINTER;

+ (instancetype)gradientWithColors: (NSArray*)colors locations: (const CGFloat*)locations;
+ (instancetype)gradientWithStartingColor: (UIColor*)startingColor endingColor: (UIColor*)endingColor;

@end
