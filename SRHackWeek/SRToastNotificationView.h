//
// ToastNotificationView.h
// Generated by Core Animator version 1.0 on 3/19/15.
//
// DO NOT MODIFY THIS FILE. IT IS AUTO-GENERATED AND WILL BE OVERWRITTEN
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface SRToastNotificationView : UIView

@property (strong, nonatomic) NSDictionary *viewsByName;

// bounceFromTop
- (void)addBounceFromTopAnimation;
- (void)addBounceFromTopAnimationWithCompletion:(void (^)(BOOL finished))completionBlock;
- (void)addBounceFromTopAnimationAndRemoveOnCompletion:(BOOL)removedOnCompletion;
- (void)addBounceFromTopAnimationAndRemoveOnCompletion:(BOOL)removedOnCompletion completion:(void (^)(BOOL finished))completionBlock;
- (void)addBounceFromTopAnimationWithBeginTime:(CFTimeInterval)beginTime andFillMode:(NSString *)fillMode andRemoveOnCompletion:(BOOL)removedOnCompletion completion:(void (^)(BOOL finished))completionBlock;
- (void)removeBounceFromTopAnimation;

// disappearTop
- (void)addDisappearTopAnimation;
- (void)addDisappearTopAnimationWithCompletion:(void (^)(BOOL finished))completionBlock;
- (void)addDisappearTopAnimationAndRemoveOnCompletion:(BOOL)removedOnCompletion;
- (void)addDisappearTopAnimationAndRemoveOnCompletion:(BOOL)removedOnCompletion completion:(void (^)(BOOL finished))completionBlock;
- (void)addDisappearTopAnimationWithBeginTime:(CFTimeInterval)beginTime andFillMode:(NSString *)fillMode andRemoveOnCompletion:(BOOL)removedOnCompletion completion:(void (^)(BOOL finished))completionBlock;
- (void)removeDisappearTopAnimation;

// swipeFromRight
- (void)addSwipeFromRightAnimation;
- (void)addSwipeFromRightAnimationWithCompletion:(void (^)(BOOL finished))completionBlock;
- (void)addSwipeFromRightAnimationAndRemoveOnCompletion:(BOOL)removedOnCompletion;
- (void)addSwipeFromRightAnimationAndRemoveOnCompletion:(BOOL)removedOnCompletion completion:(void (^)(BOOL finished))completionBlock;
- (void)addSwipeFromRightAnimationWithBeginTime:(CFTimeInterval)beginTime andFillMode:(NSString *)fillMode andRemoveOnCompletion:(BOOL)removedOnCompletion completion:(void (^)(BOOL finished))completionBlock;
- (void)removeSwipeFromRightAnimation;

// disappearToRight
- (void)addDisappearToRightAnimation;
- (void)addDisappearToRightAnimationWithCompletion:(void (^)(BOOL finished))completionBlock;
- (void)addDisappearToRightAnimationAndRemoveOnCompletion:(BOOL)removedOnCompletion;
- (void)addDisappearToRightAnimationAndRemoveOnCompletion:(BOOL)removedOnCompletion completion:(void (^)(BOOL finished))completionBlock;
- (void)addDisappearToRightAnimationWithBeginTime:(CFTimeInterval)beginTime andFillMode:(NSString *)fillMode andRemoveOnCompletion:(BOOL)removedOnCompletion completion:(void (^)(BOOL finished))completionBlock;
- (void)removeDisappearToRightAnimation;

// bounceFromBottom
- (void)addBounceFromBottomAnimation;
- (void)addBounceFromBottomAnimationWithCompletion:(void (^)(BOOL finished))completionBlock;
- (void)addBounceFromBottomAnimationAndRemoveOnCompletion:(BOOL)removedOnCompletion;
- (void)addBounceFromBottomAnimationAndRemoveOnCompletion:(BOOL)removedOnCompletion completion:(void (^)(BOOL finished))completionBlock;
- (void)addBounceFromBottomAnimationWithBeginTime:(CFTimeInterval)beginTime andFillMode:(NSString *)fillMode andRemoveOnCompletion:(BOOL)removedOnCompletion completion:(void (^)(BOOL finished))completionBlock;
- (void)removeBounceFromBottomAnimation;

// disappearToBottom
- (void)addDisappearToBottomAnimation;
- (void)addDisappearToBottomAnimationWithCompletion:(void (^)(BOOL finished))completionBlock;
- (void)addDisappearToBottomAnimationAndRemoveOnCompletion:(BOOL)removedOnCompletion;
- (void)addDisappearToBottomAnimationAndRemoveOnCompletion:(BOOL)removedOnCompletion completion:(void (^)(BOOL finished))completionBlock;
- (void)addDisappearToBottomAnimationWithBeginTime:(CFTimeInterval)beginTime andFillMode:(NSString *)fillMode andRemoveOnCompletion:(BOOL)removedOnCompletion completion:(void (^)(BOOL finished))completionBlock;
- (void)removeDisappearToBottomAnimation;

- (void)removeAllAnimations;

@end