//
//  MusicAPI.h
//  Badrjan_Hackaton
//
//  Created by Nare Muradyan on 27/10/2016.
//  Copyright © 2016 Badrjan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^NetworkServiceResultBlock)(id result, NSError *error);

@interface MusicAPI : NSObject

+ (void)getPlaylistFromMoodWithMaxPopularity:(NSString *)maxPopularity
                               minPopularity:(NSString *)minPopularity
                                trackValence:(NSString *)trackValence
                                trackArousal:(NSString *)trackArousal
                                resultNumber:(NSString *)resultNumber
                              withCompletion:(NetworkServiceResultBlock)completion;

@end
