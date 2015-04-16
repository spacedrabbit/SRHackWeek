//
//  SRRandomUserGenerator.h
//  SRHackWeek
//
//  Created by Louis Tur on 4/13/15.
//  Copyright (c) 2015 Tur, Louis. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SRRandomUser;
@class SRRandomUserGeneratorDelegate;

@protocol SRRandomUserGeneratorDelegate <NSObject>

@required

+ (SRRandomUser *)getARandomUser;
+ (NSArray *)getSeveralRandomUsers:(NSUInteger)numberOfUsers;

@end

@interface SRRandomUserGenerator : NSObject <SRRandomUserGeneratorDelegate>

+ (instancetype)sharedManager;

@end
