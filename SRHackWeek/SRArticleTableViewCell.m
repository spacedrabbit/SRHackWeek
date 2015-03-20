//
//  SRArticleTableViewCell.m
//  SRHackWeek
//
//  Created by Tur, Louis on 3/19/15.
//  Copyright (c) 2015 Tur, Louis. All rights reserved.
//

#import "SRArticleTableViewCell.h"
#import "SRNYTimesStyle.h"

#import <UIImageView+AFNetworking.h>

@interface SRArticleTableViewCell()

@property (strong, nonatomic) UIView * topContentContainer;
@property (strong, nonatomic) UIView * articleTextContainer;

@end

@implementation SRArticleTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _articleTitle           = [[UILabel alloc]      initWithFrame:CGRectZero];
        _articleAbstractField   = [[UITextView alloc]   initWithFrame:CGRectZero];
        _multimediaImageView    = [[UIImageView alloc]  initWithFrame:CGRectZero];
        _tagContainer           = [[UIView alloc]       initWithFrame:CGRectZero];
        _bylineView             = [[UILabel alloc]      initWithFrame:CGRectZero];
        
        _topContentContainer    = [[UIView alloc]       initWithFrame:CGRectZero];
        _articleTextContainer   = [[UIView alloc]       initWithFrame:CGRectZero];
        
         [self setupLayout];
    }
    return self;
}

-(void) setupLayout{
    
    NSDictionary * viewsMetrics = @{ @"tagHeight" : @(22.0),
                                     @"imageSideLength" : @(100.0),
                                     @"bylineHeight" : @(12.0)
                                     
                                     };
    NSDictionary * viewsDictionary = NSDictionaryOfVariableBindings(_topContentContainer, _tagContainer, self.contentView,
                                                                    _multimediaImageView, _articleTextContainer, _bylineView,
                                                                    _articleAbstractField, _articleTitle);
    
    
    // --       Index 0 containters       |-[TOP]-[TAG]-|               -- //
    [self.tagContainer          setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.topContentContainer   setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.contentView addSubview:self.topContentContainer];
    [self.contentView addSubview:self.tagContainer];
    
    //[self.tagContainer          setBackgroundColor:[SRNYTimesStyle redBreakingNews]];
    //[self.topContentContainer   setBackgroundColor:[SRNYTimesStyle blueApplicationTint]];
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_topContentContainer]-[_tagContainer(==tagHeight)]-|"
                                                                             options:NSLayoutFormatAlignAllCenterX
                                                                             metrics:viewsMetrics
                                                                               views:viewsDictionary]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_topContentContainer]-|"
                                                                             options:0
                                                                             metrics:viewsMetrics
                                                                               views:viewsDictionary]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_tagContainer]-|"
                                                                             options:0
                                                                             metrics:viewsMetrics
                                                                               views:viewsDictionary]];
    
    
    // -- Index 1 containers |-[articleTextContainer]-[image]-|
    [self.articleTextContainer setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.multimediaImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.topContentContainer addSubview:self.articleTextContainer];
    [self.topContentContainer addSubview:self.multimediaImageView];
    
    //[self.articleTextContainer setBackgroundColor:[SRNYTimesStyle gray102]];
    //[self.multimediaImageView setBackgroundColor:[SRNYTimesStyle gray246]];
    [self.multimediaImageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.multimediaImageView setClipsToBounds:YES];
    
    [self.topContentContainer addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_articleTextContainer]|"
                                                                                     options:0
                                                                                     metrics:viewsMetrics
                                                                                       views:viewsDictionary]];
    [self.topContentContainer addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_multimediaImageView]|"
                                                                                     options:0
                                                                                     metrics:viewsMetrics
                                                                                       views:viewsDictionary]];
    [self.topContentContainer addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_articleTextContainer][_multimediaImageView(>=imageSideLength)]|"
                                                                                     options:NSLayoutFormatAlignAllCenterY
                                                                                     metrics:viewsMetrics
                                                                                       views:viewsDictionary]];
    // -- Index 2 containers |-[title]-[byline]-[abstract]-| --//
    [self.articleTitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.articleAbstractField setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.bylineView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //self.articleTitle.backgroundColor = [UIColor orangeColor];
    //self.articleAbstractField.backgroundColor = [UIColor purpleColor];
    //self.bylineView.backgroundColor = [UIColor brownColor];
    
    [self.articleTextContainer addSubview:self.articleTitle];
    [self.articleTextContainer addSubview:self.articleAbstractField];
    [self.articleTextContainer addSubview:self.bylineView];
    
    [self.articleTextContainer addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:
                                               @"V:|[_articleTitle][_bylineView(==bylineHeight)]-[_articleAbstractField]|"
                                                                                      options:NSLayoutFormatAlignAllLeading|NSLayoutFormatAlignAllTrailing
                                                                                      metrics:viewsMetrics
                                                                                        views:viewsDictionary]];
    [self.articleTextContainer addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_articleTitle]|"
                                                                                      options:0
                                                                                      metrics:viewsMetrics
                                                                                        views:viewsDictionary]];
    // -- TEXT FIELD ADJUSTMENTS -- //
    self.articleTitle.numberOfLines = 0;
    self.articleTitle.textAlignment = NSTextAlignmentLeft;

    [self.bylineView setAdjustsFontSizeToFitWidth:YES];
    
    self.articleAbstractField.editable = NO;
    self.articleAbstractField.textAlignment = NSTextAlignmentLeft;
    self.articleAbstractField.userInteractionEnabled = NO;
    [self.articleAbstractField.textContainer setMaximumNumberOfLines:10];
    
    // -- FONTS -- //
    UIFont * hiraMin6 = [UIFont fontWithName:@"HiraMinProN-W6" size:20.0];
    UIFont * franklinMedium = [UIFont fontWithName:@"AppleSDGothicNeo-Regular" size:12.0];
    UIFont * imperialBody = [UIFont fontWithName:@"Baskerville " size:13.0];
    
    self.articleTitle.font = hiraMin6;
    self.bylineView.font = franklinMedium;
    self.articleAbstractField.font = imperialBody;

}

-(void)displayThumbnail:(NSString *)thumbnail{
    [self.multimediaImageView setImageWithURL:[NSURL URLWithString:thumbnail] placeholderImage:[UIImage imageNamed:@"NYTLogo"]];
}

-(void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [super setSelected:NO animated:animated];
}

+(BOOL)requiresConstraintBasedLayout{
    return YES;
}
@end
