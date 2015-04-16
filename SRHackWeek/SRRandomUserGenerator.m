//
//  SRRandomUserGenerator.m
//  SRHackWeek
//
//  Created by Louis Tur on 4/13/15.
//  Copyright (c) 2015 Tur, Louis. All rights reserved.
//

#import "SRRandomUserGenerator.h"
#import <AFNetworking/AFNetworking.h>

static NSString * const SRRandomUserAPIURL = @"http://api.randomuser.me/";
static NSString * const SRRandomLegoAPIURL = @"https://randomuser.me/api/0.5/?lego";

#pragma mark - SRRandomUser -

@interface SRRandomUser : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *emailAddress;
@property (strong, nonatomic) NSString *gender;
@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *password;
@property (strong, nonatomic) NSString *cellPhone;
@property (strong, nonatomic) NSString *ssn;

+ (instancetype)createRandomUserWithFirstName:(NSString *)firstName
                                     lastName:(NSString *)lastName
                                 emailAddress:(NSString *)email
                                       gender:(NSString *)gender
                                    cellPhone:(NSString *)cellPhone
                                          ssn:(NSString *)ssn;
- (void)registerUsername:(NSString *)username andPassword:(NSString *)password;

@end

@implementation SRRandomUser

+(instancetype)createRandomUserWithFirstName:(NSString *)firstName
                                    lastName:(NSString *)lastName
                                emailAddress:(NSString *)email
                                      gender:(NSString *)gender
                                   cellPhone:(NSString *)cellPhone
                                         ssn:(NSString *)ssn
{
    return [[[self class] alloc] initRandomUserWithFirstName:firstName
                                                    lastName:lastName
                                                emailAddress:email
                                                      gender:gender
                                                   cellPhone:cellPhone
                                                         ssn:ssn];
}

-(instancetype)initRandomUserWithFirstName:(NSString *)firstName
                                  lastName:(NSString *)lastName
                              emailAddress:(NSString *)email
                                    gender:(NSString *)gender
                                 cellPhone:(NSString *)cellPhone
                                       ssn:(NSString *)ssn
{
    self = [super init];
    if (self) {
        _firstName = firstName;
        _lastName = lastName;
        _emailAddress = email;
        _gender = gender;
        _cellPhone = cellPhone;
        _ssn = ssn;
    }
    return self;
}

-(void)registerUsername:(NSString *)username andPassword:(NSString *)password{
    self.password = password;
    self.username = username;
}

@end


#pragma mark - SRRandomUserGenerator -

@interface SRRandomUserGenerator ()

@property (strong, nonatomic) SRRandomUserGenerator * sharedManager;

@end

@implementation SRRandomUserGenerator

+(instancetype)sharedManager{
    __block SRRandomUserGenerator *sharedManager = nil;
    dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[SRRandomUserGenerator alloc] init];
    });
    return sharedManager;
}

-(SRRandomUserGenerator *)sharedManager{
    if (!_sharedManager) {
        _sharedManager = [SRRandomUserGenerator sharedManager];
    }
    return _sharedManager;
}

+(SRRandomUser*) getARandomUser{
    return [SRRandomUserGenerator getSeveralRandomUsers:1].firstObject;
}

+(NSArray *) getSeveralRandomUsers:(NSUInteger) numberOfUsers{
    
    AFHTTPSessionManager * sharedSessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:SRRandomUserAPIURL]
                                                                           sessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionTask * randomUserQuery = [sharedSessionManager GET:@""
                                                        parameters:@{ @"results" : @(numberOfUsers) }
                                                           success:^(NSURLSessionDataTask *task, id responseObject)
    {
        NSLog(@"Success: %@", responseObject);
    }
                                                           failure:^(NSURLSessionDataTask *task, NSError *error)
    {
        NSLog(@"Such fail, wow: %@", error);
    }];
    [randomUserQuery resume];
    
    return @[];
}

@end
