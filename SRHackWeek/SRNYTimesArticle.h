//
//  SRNYTimesArticle.h
//  SRHackWeek
//
//  Created by Tur, Louis on 3/19/15.
//  Copyright (c) 2015 Tur, Louis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SRNYTimesArticle : NSObject

+(NSArray *)createArticlesFromJSONResponse:(NSDictionary *) topStoriesJSON;
+(instancetype) createArticleWithTitle:(NSString *)title
                              abstract:(NSString *)abstract
                                byLine:(NSString *)byLine
                             urlString:(NSString *)urlString
                           publishDate:(NSString *)date
                            multimedia:(NSArray *)multimedia
                               andTags:(NSArray *)tags;

-(instancetype) initWithTitle:(NSString *)title
                     abstract:(NSString *)abstract
                       byLine:(NSString *)byLine
                    urlString:(NSString *)urlString
                  publishDate:(NSString *)date
                   multimedia:(NSArray *)multimedia
                      andTags:(NSArray *)tags;

@end
