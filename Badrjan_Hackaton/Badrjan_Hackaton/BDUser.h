//
//  BDUser.h
//  Badrjan_Hackaton
//
//  Created by Gevorg Sukiasyan on 10/27/16.
//  Copyright © 2016 Badrjan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "MoodPercentages.h"

@interface BDUser : NSObject

- (NSString *)getUsername;
- (void)setUsername:(NSString *)username;

- (NSMutableArray *)getPreferredStyles;
- (void)setPreferredStyles:(NSMutableArray *)preferredStyles;

- (UIImage *)getThumbnail;
- (void)setThumbnail:(UIImage *)thumbnail;

- (UIImage *)getTargetPhoto;
- (void)setTargetPhoto:(UIImage *)targetPhoto;

- (MoodPercentages *)getMoodPercentages;
- (void)setMoodPercentages:(MoodPercentages *)moodPercentages;

- (NSMutableArray *)getCurrentPlaylist;
- (void)setCurrentPlaylist:(NSMutableArray *)currentPlaylist;

- (NSMutableArray *)getReceivedSongs;
- (void)setReceivedSongs:(NSMutableArray *)receivedSongs;

- (NSMutableArray *)getChosenMoods;
- (void)setChosenMods:(NSMutableArray *)chosenMoods;

- (CGPoint)getCoordinatesOfMood;

@end
