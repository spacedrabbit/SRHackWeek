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

-(NSInteger) articlesRetrieved;
-(void) retrieveTopStoriesWithCompletion:(void(^)(NSArray *))complete;

@end
