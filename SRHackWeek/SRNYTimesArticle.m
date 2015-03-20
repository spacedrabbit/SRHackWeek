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
@interface SRNYTimesArticleMultimedia ()
@end

@implementation SRNYTimesArticleMultimedia

+(NSArray *)extractMediaItemsFromArticle:(NSArray *)article{
    
    NSMutableArray * mediaArray = [[NSMutableArray alloc] init];
    if ([article isKindOfClass:[NSArray class]]) {
        for (NSDictionary * mediaInfo in article) {
            NSString * caption = mediaInfo[@"caption"];
            NSString * copyright = mediaInfo[@"copyright"];
            NSString * format = mediaInfo[@"format"];
            NSString * url = mediaInfo[@"url"];
            NSString * type = mediaInfo[@"type"];
            CGSize dimension = CGSizeMake([mediaInfo[@"width"] integerValue], [mediaInfo[@"height"] integerValue]);
            
            [mediaArray addObject:[[SRNYTimesArticleMultimedia alloc] initMediaWithCaption:caption copyright:copyright format:format type:type size:dimension andURL:url]];
        }
    }
    return mediaArray;
}

-(instancetype) initMediaWithCaption:(NSString *)caption copyright:(NSString *)copyrightInfo
                              format:(NSString *)format  type:(NSString *)type size:(CGSize)dimensions andURL:(NSString *)mediaURL {
    
    self = [super init];
    if (self) {
        _caption = caption;
        _copyrightInfo = copyrightInfo;
        _format = format;
        _mediaURL = mediaURL;
        _imageDimensions = dimensions;
        _mediaType = type;
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
    
    // grabs single article JSON, looks for *_facet and interrates over string/array to pull out all tags
    for (NSString * key in articleKeys) {
        
        SRNYTimesArticleTag * articleTag = nil;
        if ([key containsString:@"facet"] ) {
            
            if ( [article[key] isKindOfClass:[NSArray class]] ) { // multiple tags
                
                for (NSString * facetString in article[key]) {
                    
                    articleTag = [[SRNYTimesArticleTag alloc] initTagWithName:facetString andKey:key];
                }
            }
            else if ( [article[key] isKindOfClass:[NSString class]] ){ // single tag
                articleTag = [[SRNYTimesArticleTag alloc] initTagWithName:article[key] andKey:key];
            }
            
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

@property (strong, nonatomic) NSString * NYTCopyrightInfo;

@end

@implementation SRNYTimesArticle

+(instancetype)createArticleWithTitle:(NSString *)title abstract:(NSString *)abstract byLine:(NSString *)byLine urlString:(NSString *)urlString publishDate:(NSString *)date multimedia:(NSArray *)multimedia andTags:(NSArray *)tags copyright:(NSString *)copyright{
    return [[SRNYTimesArticle alloc] initWithTitle:title abstract:abstract
                                            byLine:byLine urlString:urlString
                                       publishDate:date multimedia:multimedia andTags:tags copyright:copyright];
}

+(NSArray *)createArticlesFromJSONResponse:(NSDictionary *) topStoriesJSON{
    
    NSString * copyrightInfo = topStoriesJSON[@"copyright"];
    NSDictionary * topStoriesDictionary = topStoriesJSON[@"results"];
    NSMutableArray * allArticlesFound = [[NSMutableArray alloc] init];
    
    for (NSDictionary * newsStory in topStoriesDictionary) {
        
        NSString * title = newsStory[@"title"];
        NSString * byLine = newsStory[@"byline"];
        NSString * url = newsStory[@"url"];
        NSString * date = newsStory[@"created_date"];
        NSString * abstract = newsStory[@"abstract"];
        NSArray * tags  = [SRNYTimesArticleTag extractTagsFromArticle:newsStory];
        
        NSArray * media = nil;
        if ([newsStory[@"multimedia"] isKindOfClass:[NSArray class]]) {
            media = [SRNYTimesArticleMultimedia extractMediaItemsFromArticle:newsStory[@"multimedia"]];
        }

        SRNYTimesArticle * newArticle = [[self class] createArticleWithTitle:title
                                                                    abstract:abstract
                                                                      byLine:byLine
                                                                   urlString:url
                                                                 publishDate:date
                                                                  multimedia:media
                                                                     andTags:tags
                                                                   copyright:copyrightInfo];
        [allArticlesFound addObject:newArticle];
    }
    return allArticlesFound;
}

-(instancetype) initWithTitle:(NSString *)title abstract:(NSString *)abstract byLine:(NSString *)byLine urlString:(NSString *)urlString publishDate:(NSString *)date multimedia:(NSArray *)multimedia andTags:(NSArray *)tags copyright:(NSString *)copyright{
    
    self = [super init];
    if (self) {
        _articleTitle = title;
        _articleAbstract = abstract;
        _articleByLine = byLine;
        _articleURLString = urlString;
        _articlePublishDate = date;
        _multimedia = multimedia;
        _tags = tags;
        _NYTCopyrightInfo = copyright;
    }
    return self;
}

-(BOOL) hasPresentableMediaImage{
    return [self.multimedia count] ? YES : NO;
}

-(void) displayMultimediaForArticleWithCompletion:(void(^)(SRNYTimesArticleMultimedia *))mediaBlock{
    
    if ([self.multimedia count] >=1 ) {
        
        [self.multimedia enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            SRNYTimesArticleMultimedia * currentMediaItem = (SRNYTimesArticleMultimedia *)obj;
            if ([currentMediaItem.format isEqualToString:@"thumbLarge"]) {
                mediaBlock(currentMediaItem);
                *stop = YES;
            }
                /*
            }else if (  [currentMediaItem.format isEqualToString:@"Normal"]){
                mediaBlock(currentMediaItem);
            }
            else if ( [currentMediaItem.format isEqualToString:@"mediumThreeByTwo210"]){
                mediaBlock(currentMediaItem);
            }
            else if ( [currentMediaItem.format isEqualToString:@"Standard Thumbnail"]){
                mediaBlock(currentMediaItem);
            }*/
        }];
    }else{
        mediaBlock(nil);
    }
    
}

@end
