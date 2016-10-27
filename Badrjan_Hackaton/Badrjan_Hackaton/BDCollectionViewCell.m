//
//  BDCollectionViewCell.m
//  Badrjan_Hackaton
//
//  Created by Ruben Abrahamyan on 10/27/16.
//  Copyright © 2016 Badrjan. All rights reserved.
//

#import "BDCollectionViewCell.h"


@interface BDCollectionViewCell ()
@end

@implementation BDCollectionViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void) changeCellSize {
    if(self.cellIsSelected) {
        CGFloat width = self.frame.size.width - 8;
        CGFloat cellHeight = 138.f/159.f * self.frame.size.width - 8;
        CGFloat imageWidth = width - 2;
        CGFloat imageHeight= cellHeight - 2;
        self.containerView.frame = CGRectMake(4, 4, width, cellHeight);
        self.backgroundImage.frame = CGRectMake(5, 5, imageWidth, imageHeight);
    } else {
        CGFloat width = (self.superview.frame.size.width - 2)/2.f;
        CGFloat cellHeight = 138.f/159.f * width;
        self.containerView.frame = CGRectMake(0, 0, width, cellHeight);
        self.backgroundImage.frame = CGRectMake(0, 0, width, cellHeight);
        
    }
    [self.backgroundImage updateConstraints];
    [self.containerView updateConstraints];
}




@end
