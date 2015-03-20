//
//  SRArticleTableViewCell.m
//  SRHackWeek
//
//  Created by Tur, Louis on 3/19/15.
//  Copyright (c) 2015 Tur, Louis. All rights reserved.
//

#import "SRArticleTableViewCell.h"
#import "SRNYTimesStyle.h"

@interface SRArticleTableViewCell()

@property (strong, nonatomic) UIView * topContentContainer;
@property (strong, nonatomic) UIView * articleTextContainer;

@end

@implementation SRArticleTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSLog(@"Style");
        _titleLabel             = [[UILabel alloc]      initWithFrame:CGRectZero];
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
    
    // --       Index 0 containters       |-[TOP]-[TAG]-|               -- //
    [self.tagContainer          setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.topContentContainer   setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.contentView addSubview:self.topContentContainer];
    [self.contentView addSubview:self.tagContainer];
    
    [self.tagContainer setBackgroundColor:[SRNYTimesStyle redBreakingNews]];
    [self.topContentContainer setBackgroundColor:[SRNYTimesStyle blueApplicationTint]];
    
    NSDictionary * viewsMetrics = @{ @"tagHeight" : @(22.0)
                                    
                                    
                                    };
    NSDictionary * viewsDictionary = NSDictionaryOfVariableBindings(_topContentContainer, _tagContainer, self.contentView );
    
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
    
    // -- Index 1 containers |-[title]-[abstract]-[byline]-[image]-|
    
    
    
    
    
}

+(BOOL)requiresConstraintBasedLayout{
    return YES;
}
@end
