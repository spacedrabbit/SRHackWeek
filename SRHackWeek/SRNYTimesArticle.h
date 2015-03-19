//
//  SRNYTimesArticle.h
//  SRHackWeek
//
//  Created by Tur, Louis on 3/19/15.
//  Copyright (c) 2015 Tur, Louis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SRNYTimesArticle : NSObject

+(instancetype) createArticleWithTitle:(NSString *)title
                              abstract:(NSString *)abstract
                                byLine:(NSString *)byLine
                             urlString:(NSString *)urlString
                           publishDate:(NSString *)date
                            multimedia:(NSDictionary *)multimedia
                               andTags:(NSDictionary *)tags;
+(instancetype)createArticleFromJSONResponse:(NSDictionary *) topStoriesJSON;

-(instancetype) initWithTitle:(NSString *)title
                     abstract:(NSString *)abstract
                       byLine:(NSString *)byLine
                    urlString:(NSString *)urlString
                  publishDate:(NSString *)date
                   multimedia:(NSDictionary *)multimedia
                      andTags:(NSDictionary *)tags;
@end
