//
//  SRNYTimesArticle.m
//  SRHackWeek
//
//  Created by Tur, Louis on 3/19/15.
//  Copyright (c) 2015 Tur, Louis. All rights reserved.
//

#import "SRNYTimesArticle.h"

@interface SRNYTimesArticleMultimedia : NSObject

@end

@implementation SRNYTimesArticleMultimedia

@end


@interface SRNYTimesArticle ()

@property (strong, nonatomic) NSString * articleTitle;
@property (strong, nonatomic) NSString * articleAbstract;
@property (strong, nonatomic) NSString * articleByLine;
@property (strong, nonatomic) NSString * articleURLString;
@property (strong, nonatomic) NSString * articlePublishDate;
@property (strong, nonatomic) NSDictionary * multimedia;
@property (strong, nonatomic) NSDictionary * tags;

@end

@implementation SRNYTimesArticle

+(instancetype)createArticleWithTitle:(NSString *)title abstract:(NSString *)abstract byLine:(NSString *)byLine urlString:(NSString *)urlString publishDate:(NSString *)date multimedia:(NSDictionary *)multimedia andTags:(NSDictionary *)tags{
    
    
    
    return nil;
}

-(instancetype) initWithTitle:(NSString *)title abstract:(NSString *)abstract byLine:(NSString *)byLine urlString:(NSString *)urlString publishDate:(NSString *)date multimedia:(NSDictionary *)multimedia andTags:(NSDictionary *)tags{
    
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end
