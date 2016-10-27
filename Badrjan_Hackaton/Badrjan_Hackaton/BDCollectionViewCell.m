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
        CGFloat imageWidth = width - 2;
        self.containerView.frame = CGRectMake(4, 4, width, width);
        self.backgroundImage.frame = CGRectMake(5, 5, imageWidth, imageWidth);
    } else {
        CGFloat width = (self.superview.frame.size.width - 2)/2.f;
        self.containerView.frame = CGRectMake(0, 0, width, width);
        self.backgroundImage.frame = CGRectMake(0, 0, width, width);
        
    }
    [self.backgroundImage updateConstraints];
    [self.containerView updateConstraints];
}




@end
