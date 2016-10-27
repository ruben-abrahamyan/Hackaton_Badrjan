//
//  BDUser.m
//  Badrjan_Hackaton
//
//  Created by Gevorg Sukiasyan on 10/27/16.
//  Copyright © 2016 Badrjan. All rights reserved.
//

#import "BDUser.h"

@interface BDUser()

@property (strong, nonatomic) NSString *username;

@property (strong, nonatomic) NSMutableArray *preferredStyles;

@property (strong, nonatomic) UIImage *thumbnail;

@property (strong, nonatomic) UIImage *targetPhoto;

@property (strong, nonatomic) MoodPercentages *moodPercentages;

@property (strong, nonatomic) NSMutableArray *currentPlaylist;

@property (strong, nonatomic) NSMutableArray *receivedSongs;

@property (strong, nonatomic) NSMutableArray *chosenMoods;

@property (nonatomic) CGPoint moodCoordinates;

@end

@implementation BDUser



+ (instancetype)sharedUser {
    static BDUser *sharedUser = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedUser = [[self alloc] init];
    });
    return sharedUser;
}

- (id)init {
    if (self = [super init]) {
        self.username = @"Default Nickname";
        self.moodPercentages = [[MoodPercentages alloc] init];
    }
    return self;
}


- (NSString *)getUsername {
    return _username;
}

- (void)setUsername:(NSString *)username {
    _username = username;
}


- (NSMutableArray *)getPreferredStyles {
    return _preferredStyles;
}

- (void)setPreferredStyles:(NSMutableArray *)preferredStyles {
    _preferredStyles = preferredStyles;
}


- (UIImage *)getThumbnail {
    return _thumbnail;
}

- (void)setThumbnail:(UIImage *)thumbnail {
    _thumbnail = thumbnail;
}


- (UIImage *)getTargetPhoto {
    return _targetPhoto;
}

- (void)setTargetPhoto:(UIImage *)targetPhoto {
    _targetPhoto = targetPhoto;
}


- (MoodPercentages *)getMoodPercentages {
    return _moodPercentages;
}

- (void)setMoodPercentages:(MoodPercentages *)moodPercentages {
    _moodPercentages = moodPercentages;
}


- (NSMutableArray *)getCurrentPlaylist {
    return _currentPlaylist;
}

- (void)setCurrentPlaylist:(NSMutableArray *)currentPlaylist {
    _currentPlaylist = currentPlaylist;
}

- (NSMutableArray *)getReceivedSongs {
    return _receivedSongs;
}


- (void)setReceivedSongs:(NSMutableArray *)receivedSongs {
    _receivedSongs = receivedSongs;
}

- (NSMutableArray *)getChosenMoods {
    return _chosenMoods;
}

- (void)setChosenMods:(NSMutableArray *)chosenMoods {
    _chosenMoods = chosenMoods;
}

#define kHappinessFactorX 1
#define kSadnessFactorX 1
#define kAngerFactorX 1
#define kDisgustFactorX 1
#define kFearFactorX 1
#define kSurpriseFactorX 1
#define kNeutralFactorX 1
#define kContemptFactorX 1

#define kHappinessFactorY 1
#define kSadnessFactorY 1
#define kAngerFactorY 1
#define kDisgustFactorY 1
#define kFearFactorY 1
#define kSurpriseFactorY 1
#define kNeutralFactorY 1
#define kContemptFactorY 1


- (CGPoint)getCoordinatesOfMood {
    CGFloat CoordinateX, CoordinateY;
    //TODO
    
    return CGPointMake(CoordinateX, CoordinateY);
}

@end
