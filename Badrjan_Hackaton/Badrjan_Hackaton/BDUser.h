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

@property (strong, nonatomic) NSString *username;

@property (strong, nonatomic) NSMutableArray *preferredStyle;

@property (strong, nonatomic) UIImage *thumbnail;

@property (strong, nonatomic) UIImage *targetPhoto;

@property (strong, nonatomic) NSMutableArray *topMoods;

@property (strong, nonatomic) NSMutableArray *currentPlaylist;

@property (strong, nonatomic) NSMutableArray *receivedSongs;

@property (strong, nonatomic) NSMutableArray *chosenMoods;




@end
