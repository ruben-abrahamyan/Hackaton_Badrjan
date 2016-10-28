//
//  SongTableViewCell.h
//  Badrjan_Hackaton
//
//  Created by Nare Muradyan on 27/10/2016.
//  Copyright © 2016 Badrjan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Song.h"

@protocol SongTableViewCellDelegate <NSObject>
- (void)didPressPlayCellAtIndex:(NSInteger)index;
@end

@interface SongTableViewCell : UITableViewCell

- (void)configureCellWithSong:(Song *)song;

@property (strong, nonatomic) IBOutlet UIButton *playButton;

@property (weak, nonatomic) id <SongTableViewCellDelegate> delegate;
@property (nonatomic) NSInteger index;

@end
