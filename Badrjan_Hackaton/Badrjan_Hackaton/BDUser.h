//
//  BDUser.h
//  Badrjan_Hackaton
//
//  Created by Gevorg Sukiasyan on 10/27/16.
//  Copyright © 2016 Badrjan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface BDUser : NSObject

- (NSString *)getUserName;

- (NSMutableArray *)getPreferredStyles;

- (UIImage *)getThumbnail;

- (UIImage *)getTargetPhoto;

- (NSMutableArray *)getTopMoods;

- (NSMutableArray *)getCurrentPlaylist;

- (NSMutableArray *)getReceivedSongs;

- (NSMutableArray *)getChosenMoods;

- (CGPoint)getCoordinatesOfMood;

@end
