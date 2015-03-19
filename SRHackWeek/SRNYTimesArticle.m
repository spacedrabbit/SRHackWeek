//
//  SRNYTimesArticle.m
//  SRHackWeek
//
//  Created by Tur, Louis on 3/19/15.
//  Copyright (c) 2015 Tur, Louis. All rights reserved.
//

#import "SRNYTimesArticle.h"
@import CoreGraphics;


#pragma mark - NYTIMES MULTIMEDIA -

@interface SRNYTimesArticleMultimedia : NSObject

+(NSArray *) extractMediaItemsFromArticle:(NSArray *)article;

@end

@interface SRNYTimesArticleMultimedia ()

@property (strong, nonatomic) NSString * caption;
@property (strong, nonatomic) NSString * copyrightInfo;
@property (strong, nonatomic) NSString * format;
@property (strong, nonatomic) NSString * mediaURL;
@property (nonatomic)         CGSize   * imageDimensions;

@end

@implementation SRNYTimesArticleMultimedia

+(NSArray *)extractMediaItemsFromArticle:(NSArray *)article{
    
    // might be passed a string
    if (![article respondsToSelector:@selector(objectForKey:)]) {
        return nil;
    }else{
        
    }
    return nil;
}

-(instancetype) initMediaWithCaption:(NSString *)caption copyright:(NSString *)copyrightInfo
                              format:(NSString *)format  size:(CGSize)dimensions andURL:(NSString *)mediaURL {
    
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end




#pragma mark - NYTIMES TAGS -

@interface SRNYTimesArticleTag : NSObject

+(NSArray *) extractTagsFromArticle:(NSDictionary *)article;

@end
@interface SRNYTimesArticleTag ()

@property (strong, nonatomic) NSString * tagName;
@property (strong, nonatomic) NSString * tagKeyName;

@end

@implementation SRNYTimesArticleTag

+(NSArray *)extractTagsFromArticle:(NSDictionary *)article{
    
    NSMutableArray * locatedTags = [[NSMutableArray alloc] init];
    NSArray * articleKeys = [article allKeys];
    for (NSString * key in articleKeys) {
        if ([key containsString:@"facet"]) {
            SRNYTimesArticleTag * articleTag = [[SRNYTimesArticleTag alloc] initTagWithName:article[key] andKey:key];
            [locatedTags addObject:articleTag];
        }
    }
    return locatedTags;
}

-(instancetype) initTagWithName:(NSString *)name andKey:(NSString *)tagKey {
    
    self = [super init];
    if (self) {
        _tagKeyName = tagKey;
        _tagName = name;
    }
    return self;
}

@end



#pragma mark - NYTIMES ARTICLE -

@interface SRNYTimesArticle ()

@property (strong, nonatomic) NSString * articleTitle;
@property (strong, nonatomic) NSString * articleAbstract;
@property (strong, nonatomic) NSString * articleByLine;
@property (strong, nonatomic) NSString * articleURLString;
@property (strong, nonatomic) NSString * articlePublishDate;
@property (strong, nonatomic) NSDictionary * multimedia;
@property (strong, nonatomic) NSDictionary * tags;

@property (strong, nonatomic) NSString * NYTCopyrightInfo;

@end

@implementation SRNYTimesArticle

+(instancetype)createArticleWithTitle:(NSString *)title abstract:(NSString *)abstract byLine:(NSString *)byLine urlString:(NSString *)urlString publishDate:(NSString *)date multimedia:(NSDictionary *)multimedia andTags:(NSDictionary *)tags{
    
    
    
    
    return nil;
}

+(instancetype)createArticleFromJSONResponse:(NSDictionary *) topStoriesJSON{
    
    NSDictionary * topStoriesDictionary = topStoriesJSON[@"results"];
    
    for (NSDictionary * newsStory in topStoriesDictionary) {
        
        NSString * title = newsStory[@"title"];
        NSString * byLine = newsStory[@"byline"];
        NSString * url = newsStory[@"url"];
        NSString * date = newsStory[@"created_date"];
        NSString * abstract = newsStory[@"abstract"];
        
        NSArray * media = [SRNYTimesArticleMultimedia extractMediaItemsFromArticle:newsStory[@"multimedia"]];
        NSArray * tags  = [SRNYTimesArticleTag extractTagsFromArticle:newsStory];
        
    }
    
    return nil;
}


-(instancetype) initWithTitle:(NSString *)title abstract:(NSString *)abstract byLine:(NSString *)byLine urlString:(NSString *)urlString publishDate:(NSString *)date multimedia:(NSDictionary *)multimedia andTags:(NSDictionary *)tags{
    
    self = [super init];
    if (self) {
        
        
        
        
    }
    return self;
}

@end
