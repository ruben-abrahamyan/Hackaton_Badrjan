//
//  BDMoodTableViewCell.m
//  Badrjan_Hackaton
//
//  Created by Gevorg Sukiasyan on 10/28/16.
//  Copyright © 2016 Badrjan. All rights reserved.
//

#import "BDMoodTableViewCell.h"

@implementation BDMoodTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.moodLabel.frame = CGRectMake(16, self.moodLabel.frame.origin.y, 200, self.moodLabel.bounds.size.height);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
