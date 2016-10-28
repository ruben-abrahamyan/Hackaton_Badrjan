//
//  MusicAPI.m
//  Badrjan_Hackaton
//
//  Created by Nare Muradyan on 27/10/2016.
//  Copyright © 2016 Badrjan. All rights reserved.
//

#import "MusicAPI.h"

#define MUSICOVERY_API_BASE_URL @"http://musicovery.com/api/V3/playlist.php?&fct=getfrommood"
//http://musicovery.com/api/V3/playlist.php?&fct=getfrommood&popularitymax=100&popularitymin=50&starttrackid=&date70=true&trackvalence=900000&trackarousal=100000&resultsnumber=15&format=json

//http://musicovery.com/api/V3/playlist.php?&fct=getfrommood&popularitymax=100&popularitymin=0&genreNo=jazz,rock,metal&trackvalence=900000&trackarousal=100000&resultsnumber=100&bucket=id:itunes&limittobucket=true&format=json

@implementation MusicAPI


+ (void)getPlaylistFromMoodWithMaxPopularity:(NSString *)maxPopularity
                               minPopularity:(NSString *)minPopularity
                                     genreNo:(NSString *)genreNo
                                trackValence:(NSString *)trackValence
                                trackArousal:(NSString *)trackArousal
                                resultNumber:(NSString *)resultNumber
                              withCompletion:(NetworkServiceResultBlock)completion {
    
    NSString *playlistUrlString = [NSString stringWithFormat:@"%@&popularitymax=%@&popularitymin=%@&genreNo=%@&trackvalence=%@&trackarousal=%@&resultsnumber=%@&format=json", MUSICOVERY_API_BASE_URL, maxPopularity, minPopularity, genreNo, trackValence, trackArousal, resultNumber];
    NSURL *playlistURL = [NSURL URLWithString:playlistUrlString];
    [[[NSURLSession sharedSession] dataTaskWithURL:playlistURL
                                 completionHandler:^(NSData * _Nullable data,
                                                     NSURLResponse * _Nullable response,
                                                     NSError * _Nullable error) {
#warning error handling
                                     id playlist = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                     dispatch_async(dispatch_get_main_queue(), ^{
                                         if (completion) {
                                             completion(playlist, error);
                                         }
                                     });
        
    }] resume];
    
    
}

@end
