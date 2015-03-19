//
//  SRNYTimesAPIManager.m
//  SRHackWeek
//
//  Created by Tur, Louis on 3/19/15.
//  Copyright (c) 2015 Tur, Louis. All rights reserved.
//
#import <AFNetworking/AFNetworking.h>

#import "SRNYTimesAPIManager.h"
#import "SRNYTimesArticle.h"

static NSString * const kTopStoriesAPIKey = @"4d868a9601120acae1e6b5af3d81167f:1:71242787";
static NSString * const kNYTRequestURL = @"http://api.nytimes.com/svc/topstories/v1/home.json?";

@interface SRNYTimesAPIManager ()

@property (strong, nonatomic) SRNYTimesAPIManager * defaultManager;

@end

@implementation SRNYTimesAPIManager

+(instancetype)sharedAPIManager{
    
    __block SRNYTimesAPIManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[SRNYTimesAPIManager alloc] init];
    });
    return _sharedManager;
}

-(instancetype)init{
    self = [super init];
    if (self) {
    }
    return self;
}

-(void)retrieveTopStories:(NSInteger)quantity completion:(void (^)(NSArray *))complete {
    
    NSError * requestError;
    
    AFHTTPRequestSerializer * topNewsStoriesRequestSerializer = [AFHTTPRequestSerializer serializer];
    NSMutableURLRequest * topStoriesRequest = [topNewsStoriesRequestSerializer requestWithMethod:@"GET"
                                                                                       URLString:kNYTRequestURL
                                                                                      parameters:@{ @"api-key":kTopStoriesAPIKey }
                                                                                           error:&requestError];
    AFURLSessionManager * sessionManager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    AFJSONResponseSerializer * jsonResponse = [AFJSONResponseSerializer serializer];
    [jsonResponse setAcceptableContentTypes:[NSSet setWithObject:@"text/json"]];
    sessionManager.responseSerializer = jsonResponse;
    NSURLSessionDataTask * storiesRequestTask = [sessionManager dataTaskWithRequest:topStoriesRequest
                                                                  completionHandler:^(NSURLResponse *response, id responseObject, NSError *error)
    {
        NSLog(@"Request made");
        NSDictionary * responseObjectDictionary = (NSDictionary *)responseObject;
        if (!error) {
            NSLog(@"The response: %@", responseObject);
            //NSArray * articles = [SRNYTimesArticle createArticlesFromJSONResponse:responseObjectDictionary];
            
            //NSLog(@"Articles! %@", articles);
        }
        else{
            NSLog(@"Request made, but has error: %@", error);
        }
    }];
    [storiesRequestTask resume];
}

@end
