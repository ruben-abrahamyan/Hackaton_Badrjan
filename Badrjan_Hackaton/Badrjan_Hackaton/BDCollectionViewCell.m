//
//  BDCollectionViewCell.m
//  Badrjan_Hackaton
//
//  Created by Ruben Abrahamyan on 10/27/16.
//  Copyright © 2016 Badrjan. All rights reserved.
//

#import "BDCollectionViewCell.h"
#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface BDCollectionViewCell ()
@end

@implementation BDCollectionViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    blurEffectView.frame = self.backgroundImage.bounds;
    blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    blurEffectView.alpha = 0.3;
    
    [self.backgroundImage addSubview:blurEffectView];
}

-(void)changeCellSize {
    if(self.cellIsSelected) {
        CGFloat width = self.frame.size.width - 8;
        CGFloat cellHeight = 138.f/159.f * self.frame.size.width - 8;
        CGFloat imageWidth = width - 2;
        CGFloat imageHeight= cellHeight - 2;
        self.containerView.frame = CGRectMake(4, 4, width, cellHeight);
        self.backgroundImage.frame = CGRectMake(5, 5, imageWidth, imageHeight);
        self.title.textColor = UIColorFromRGB(0x8FD945);
    } else {
        CGFloat width = (self.superview.frame.size.width - 2)/2.f;
        CGFloat cellHeight = 138.f/159.f * width;
        self.containerView.frame = CGRectMake(0, 0, width, cellHeight);
        self.backgroundImage.frame = CGRectMake(0, 0, width, cellHeight);
        self.title.textColor = UIColorFromRGB(0xFFFFFF);
        
    }
    [self.backgroundImage updateConstraints];
    [self.containerView updateConstraints];
}




@end
