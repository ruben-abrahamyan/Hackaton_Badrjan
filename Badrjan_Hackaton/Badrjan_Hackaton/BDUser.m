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
#define kSadnessFactorX -1
#define kAngerFactorX -0.5
#define kDisgustFactorX -0.2
#define kFearFactorX 0.5
#define kSurpriseFactorX 0.5
#define kNeutralFactorX 0
#define kContemptFactorX -0.5

#define kHappinessFactorY 1
#define kSadnessFactorY -1
#define kAngerFactorY 1
#define kDisgustFactorY 0.5
#define kFearFactorY 0.5
#define kSurpriseFactorY 0.5
#define kNeutralFactorY -0.5
#define kContemptFactorY 0


- (CGPoint)getCoordinatesOfMood {
    CGFloat CoordinateX, CoordinateY;
    
    if (self.moodPercentages.Neutral > 0.5) {
        CoordinateX = self.moodPercentages.Happiness * kHappinessFactorX + self.moodPercentages.Sadness * kSadnessFactorX + self.moodPercentages.Anger * kAngerFactorX + self.moodPercentages.Disgust * kDisgustFactorX + self.moodPercentages.Fear * kFearFactorX + self.moodPercentages.Surprise * kSurpriseFactorX + self.moodPercentages.Neutral * kNeutralFactorX + self.moodPercentages.Contempt * kContemptFactorX;
        
        CoordinateX *= 2;
        
        CoordinateX = MIN(MAX(CoordinateX, -1), 1);
        CoordinateX = ((CoordinateX + 1) / 2.0) * 999999;
        
        CoordinateY = self.moodPercentages.Happiness * kHappinessFactorY + self.moodPercentages.Sadness * kSadnessFactorY + self.moodPercentages.Anger * kAngerFactorY + self.moodPercentages.Disgust * kDisgustFactorY + self.moodPercentages.Fear * kFearFactorY + self.moodPercentages.Surprise * kSurpriseFactorY + self.moodPercentages.Neutral * kNeutralFactorY + self.moodPercentages.Contempt * kContemptFactorY;
        
        CoordinateY *=2;
        
        CoordinateY = MIN(MAX(CoordinateY, -1), 1);
        CoordinateY = ((CoordinateY + 1) / 2.0) * 999999;
        
    } else {
        CoordinateX = self.moodPercentages.Happiness * kHappinessFactorX + self.moodPercentages.Sadness * kSadnessFactorX + self.moodPercentages.Anger * kAngerFactorX + self.moodPercentages.Disgust * kDisgustFactorX + self.moodPercentages.Fear * kFearFactorX + self.moodPercentages.Surprise * kSurpriseFactorX + self.moodPercentages.Neutral * kNeutralFactorX + self.moodPercentages.Contempt * kContemptFactorX;
        
        CoordinateX = MIN(MAX(CoordinateX, -1), 1);
        CoordinateX = ((CoordinateX + 1) / 2.0) * 999999;
        
        CoordinateY = self.moodPercentages.Happiness * kHappinessFactorY + self.moodPercentages.Sadness * kSadnessFactorY + self.moodPercentages.Anger * kAngerFactorY + self.moodPercentages.Disgust * kDisgustFactorY + self.moodPercentages.Fear * kFearFactorY + self.moodPercentages.Surprise * kSurpriseFactorY + self.moodPercentages.Neutral * kNeutralFactorY + self.moodPercentages.Contempt * kContemptFactorY;
        
        CoordinateY = MIN(MAX(CoordinateY, -1), 1);
        CoordinateY = ((CoordinateY + 1) / 2.0) * 999999;
    }
    
    
    return CGPointMake(CoordinateX, CoordinateY);
}

@end
