//
//  BDFakeUser.h
//  Badrjan_Hackaton
//
//  Created by AnnaSakhlyan on 10/28/16.
//  Copyright © 2016 Badrjan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDFakeUser : NSObject

@property (nonatomic,assign) float longitude;
@property (nonatomic,assign) float latitude;
@property (nonatomic) NSString *currentTrack;
@property (nonatomic) NSString *currentMood;

@end
