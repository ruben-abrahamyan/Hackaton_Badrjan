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

@property (strong, nonatomic) NSMutableArray *topMoods;

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
    }
    return self;
}

- (NSString *)getUserName {
    return self.username;
}

- (NSMutableArray *)getPreferredStyles {
    return self.preferredStyles;
}

- (UIImage *)getThumbnail {
    return self.thumbnail;
}

- (UIImage *)getTargetPhoto {
    return self.targetPhoto;
}

- (NSMutableArray *)getTopMoods {
    return self.topMoods;
}

- (NSMutableArray *)getCurrentPlaylist {
    return self.currentPlaylist;
}

- (NSMutableArray *)getReceivedSongs {
    return self.receivedSongs;
}

- (NSMutableArray *)getChosenMoods {
    return self.getChosenMoods;
}

#define kHappinessFactor
#define kSadnessFactor
#define kAngerFactor
#define kDisgustFactor
#define kFearFactor
#define kSurpriseFactor
#define kNeutralFactor
#define kContemptFactor



- (CGPoint)getCoordinatesOfMood {
    CGFloat CoordinateX, CoordinateY;
//    for (NSString *moodPercentage in self.topMoods) {
//        CGFloat percentage = [moodPercentage floatValue];
//        
//    }
    
    return CGPointMake(CoordinateX, CoordinateY);
}

@end
