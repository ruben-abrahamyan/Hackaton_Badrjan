//
//  SongTableViewCell.m
//  Badrjan_Hackaton
//
//  Created by Nare Muradyan on 27/10/2016.
//  Copyright © 2016 Badrjan. All rights reserved.
//

#import "SongTableViewCell.h"

@interface SongTableViewCell ()


@property (strong, nonatomic) IBOutlet UILabel *songNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *durationLabel;
@property (strong, nonatomic) IBOutlet UIButton *shareButton;

@end

@implementation SongTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureCellWithSong:(Song *)song {
    self.songNameLabel.text = [NSString stringWithFormat:@"%@ - %@", song.artistName, song.songTitle];
    self.durationLabel.text = [NSString stringWithFormat:@"00:10"];
}

- (void)prepareForReuse {
    self.songNameLabel.text = nil;
    self.durationLabel.text = nil;
}

- (IBAction)playButtonPressed:(id)sender {
    if ([self.delegate respondsToSelector:@selector(didPressPlayCellAtIndex:)]) {
        [self.delegate didPressPlayCellAtIndex:self.index];
    }
}

@end
