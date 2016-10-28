//
//  Song.h
//  Badrjan_Hackaton
//
//  Created by Nare Muradyan on 27/10/2016.
//  Copyright © 2016 Badrjan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Song : NSObject

@property (nonatomic) NSString *songTitle;
@property (nonatomic) NSString *artistName;
@property (nonatomic) NSString *itunesID;
@property (nonatomic) NSURL *itunesUrl;
@property (nonatomic) NSString *genre;

@property (nonatomic) NSURL *itPlayableUrl;

@property (strong, nonatomic) NSString *downloadedPath;

@end
