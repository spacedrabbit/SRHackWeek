//
//  SRArticleTableViewCell.h
//  SRHackWeek
//
//  Created by Tur, Louis on 3/19/15.
//  Copyright (c) 2015 Tur, Louis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SRArticleTableViewCell : UITableViewCell

@property (strong, nonatomic) UILabel * articleTitle;
@property (strong, nonatomic) UITextView * articleAbstractField;
@property (strong, nonatomic) UIImageView * multimediaImageView;
@property (strong, nonatomic) UIView * tagContainer;
@property (strong, nonatomic) UILabel * bylineView;

@end
