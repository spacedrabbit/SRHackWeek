//
//  SRNYTimesAPIManager.h
//  SRHackWeek
//
//  Created by Tur, Louis on 3/19/15.
//  Copyright (c) 2015 Tur, Louis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SRNYTimesAPIManager : NSObject

+(instancetype) sharedAPIManager;

-(void) retrieveTopStories:(NSInteger)quantity completion:(void(^)(NSArray *))complete;

@end
