//
//  SRNYTimesArticle.m
//  SRHackWeek
//
//  Created by Tur, Louis on 3/19/15.
//  Copyright (c) 2015 Tur, Louis. All rights reserved.
//

#import "SRNYTimesArticle.h"
@import CoreGraphics;

/***********************************************************************************************************
 *
 *
 *                          NYTIMES MULTIMEDIA
 *
 *
 ***********************************************************************************************************/

#pragma mark - NYTIMES MULTIMEDIA -
@interface SRNYTimesArticleMultimedia : NSObject

+(NSArray *) extractMediaItemsFromArticle:(NSArray *)article;
-(instancetype) initMediaWithCaption:(NSString *)caption copyright:(NSString *)copyrightInfo
                              format:(NSString *)format  size:(CGSize)dimensions andURL:(NSString *)mediaURL;

@end

@interface SRNYTimesArticleMultimedia ()

@property (strong, nonatomic) NSString * caption;
@property (strong, nonatomic) NSString * copyrightInfo;
@property (strong, nonatomic) NSString * format;
@property (strong, nonatomic) NSString * mediaURL;
@property (nonatomic)         CGSize   imageDimensions;

@end

@implementation SRNYTimesArticleMultimedia

+(NSArray *)extractMediaItemsFromArticle:(NSArray *)article{
    
    // might be passed a string
    
    NSMutableArray * mediaArray = [[NSMutableArray alloc] init];
    if (![article respondsToSelector:@selector(objectForKey:)]) {
        return nil;
    }else{
        for (NSDictionary * mediaInfo in article) {
            NSString * caption = mediaInfo[@"caption"];
            NSString * copyright = mediaInfo[@"copyright"];
            NSString * format = mediaInfo[@"format"];
            NSString * url = mediaInfo[@"url"];
            CGSize dimension = CGSizeMake([mediaInfo[@"width"] integerValue], [mediaInfo[@"height"] integerValue]);
            
            [mediaArray addObject:[[SRNYTimesArticleMultimedia alloc] initMediaWithCaption:caption copyright:copyright format:format size:dimension andURL:url]];
        }
    }
    return mediaArray;
}

-(instancetype) initMediaWithCaption:(NSString *)caption copyright:(NSString *)copyrightInfo
                              format:(NSString *)format  size:(CGSize)dimensions andURL:(NSString *)mediaURL {
    
    self = [super init];
    if (self) {
        _caption = caption;
        _copyrightInfo = copyrightInfo;
        _format = format;
        _mediaURL = mediaURL;
        _imageDimensions = dimensions;
    }
    return self;
}

@end


/***********************************************************************************************************
 *
 *
 *                          NYTIMES TAGS
 *
 *
 ***********************************************************************************************************/
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


/***********************************************************************************************************
 *
 *
 *                          NYTIMES ARTICLE
 *
 *
 ***********************************************************************************************************/
#pragma mark - NYTIMES ARTICLE -

@interface SRNYTimesArticle ()

@property (strong, nonatomic) NSString * articleTitle;
@property (strong, nonatomic) NSString * articleAbstract;
@property (strong, nonatomic) NSString * articleByLine;
@property (strong, nonatomic) NSString * articleURLString;
@property (strong, nonatomic) NSString * articlePublishDate;
@property (strong, nonatomic) NSArray * multimedia;
@property (strong, nonatomic) NSArray * tags;

@property (strong, nonatomic) NSString * NYTCopyrightInfo;

@end

@implementation SRNYTimesArticle

+(instancetype)createArticleWithTitle:(NSString *)title abstract:(NSString *)abstract byLine:(NSString *)byLine urlString:(NSString *)urlString publishDate:(NSString *)date multimedia:(NSArray *)multimedia andTags:(NSArray *)tags{
    return [[SRNYTimesArticle alloc] initWithTitle:title abstract:abstract
                                            byLine:byLine urlString:urlString
                                       publishDate:date multimedia:multimedia andTags:tags];
}

+(NSArray *)createArticlesFromJSONResponse:(NSDictionary *) topStoriesJSON{
    
    NSDictionary * topStoriesDictionary = topStoriesJSON[@"results"];
    NSMutableArray * allArticlesFound = [[NSMutableArray alloc] init];
    for (NSDictionary * newsStory in topStoriesDictionary) {
        
        NSString * title = newsStory[@"title"];
        NSString * byLine = newsStory[@"byline"];
        NSString * url = newsStory[@"url"];
        NSString * date = newsStory[@"created_date"];
        NSString * abstract = newsStory[@"abstract"];
        
        NSArray * media = [SRNYTimesArticleMultimedia extractMediaItemsFromArticle:newsStory[@"multimedia"]];
        NSArray * tags  = [SRNYTimesArticleTag extractTagsFromArticle:newsStory];
        
        SRNYTimesArticle * newArticle = [[self class] createArticleWithTitle:title
                                                                    abstract:abstract
                                                                      byLine:byLine
                                                                   urlString:url
                                                                 publishDate:date
                                                                  multimedia:media
                                                                     andTags:tags];
        [allArticlesFound addObject:newArticle];
    }
    return allArticlesFound;
}

-(instancetype) initWithTitle:(NSString *)title abstract:(NSString *)abstract byLine:(NSString *)byLine urlString:(NSString *)urlString publishDate:(NSString *)date multimedia:(NSArray *)multimedia andTags:(NSArray *)tags{
    
    self = [super init];
    if (self) {
        _articleTitle = title;
        _articleAbstract = abstract;
        _articleByLine = byLine;
        _articleURLString = urlString;
        _articlePublishDate = date;
        _multimedia = multimedia;
        _tags = tags;
    }
    return self;
}

@end
