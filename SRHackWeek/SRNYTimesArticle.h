//
//  SRNYTimesArticle.h
//  SRHackWeek
//
//  Created by Tur, Louis on 3/19/15.
//  Copyright (c) 2015 Tur, Louis. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreGraphics;

@interface SRNYTimesArticleMultimedia : NSObject

@property (strong, nonatomic, readonly) NSString * caption;
@property (strong, nonatomic, readonly) NSString * copyrightInfo;
@property (strong, nonatomic, readonly) NSString * format;
@property (strong, nonatomic, readonly) NSString * mediaURL;
@property (strong, nonatomic, readonly) NSString * mediaType;
@property (nonatomic)         CGSize   imageDimensions;

+(NSArray *) extractMediaItemsFromArticle:(NSArray *)article;
-(instancetype) initMediaWithCaption:(NSString *)caption
                           copyright:(NSString *)copyrightInfo
                              format:(NSString *)format
                                type:(NSString *)mediaType
                                size:(CGSize)dimensions
                              andURL:(NSString *)mediaURL;

@end

@interface SRNYTimesArticle : NSObject

@property (strong, nonatomic, readonly) NSString * articleTitle;
@property (strong, nonatomic, readonly) NSString * articleAbstract;
@property (strong, nonatomic, readonly) NSString * articleByLine;
@property (strong, nonatomic, readonly) NSString * articleURLString;
@property (strong, nonatomic, readonly) NSString * articlePublishDate;


@property (strong, nonatomic, readonly) NSArray * multimedia;
@property (strong, nonatomic, readonly) NSArray * tags;


+(NSArray *)createArticlesFromJSONResponse:(NSDictionary *) topStoriesJSON;
+(instancetype) createArticleWithTitle:(NSString *)title
                              abstract:(NSString *)abstract
                                byLine:(NSString *)byLine
                             urlString:(NSString *)urlString
                           publishDate:(NSString *)date
                            multimedia:(NSArray *)multimedia
                               andTags:(NSArray *)tags
                             copyright:(NSString *)copyright;

-(instancetype) initWithTitle:(NSString *)title
                     abstract:(NSString *)abstract
                       byLine:(NSString *)byLine
                    urlString:(NSString *)urlString
                  publishDate:(NSString *)date
                   multimedia:(NSArray *)multimedia
                      andTags:(NSArray *)tags
                    copyright:(NSString *)copyright;

-(BOOL) hasPresentableMediaImage;
-(void) displayMultimediaForArticleWithCompletion:(void(^)(SRNYTimesArticleMultimedia *))mediaBlock;

@end
