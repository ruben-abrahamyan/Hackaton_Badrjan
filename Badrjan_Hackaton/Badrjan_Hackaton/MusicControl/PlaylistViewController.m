//
//  PlaylistViewController.m
//  Badrjan_Hackaton
//
//  Created by Nare Muradyan on 27/10/2016.
//  Copyright © 2016 Badrjan. All rights reserved.
//

#import "PlaylistViewController.h"
#import "SongTableViewCell.h"
#import "MusicAPI.h"
#import "Song.h"
#import <AVFoundation/AVFoundation.h>

@interface PlaylistViewController () <UITableViewDelegate, UITableViewDataSource, SongTableViewCellDelegate>
@property (nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) NSDictionary *receivedDictionary;
@property (nonatomic) NSMutableArray *songsArray;
@property (strong, nonatomic) AVPlayer *audioPlayer;
@property (strong, nonatomic) Song *selectedSong;
@property (strong, nonatomic) NSMutableArray *downloads;
@end

@implementation PlaylistViewController

- (NSMutableArray *)songsArray {
    if (!_songsArray) {
        _songsArray = [[NSMutableArray alloc] init];
    }
    return _songsArray;
}

- (NSMutableArray *)downloads {
    if (!_downloads) {
        _downloads = [[NSMutableArray alloc] init];
    }
    return _downloads;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // [self.tableView registerClass:[SongTableViewCell class] forCellReuseIdentifier:@"SongCell"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    NSString *genreNo = @"";
    if (self.genresToExclude.count) {
        for (NSString *string in self.genresToExclude) {
            [genreNo stringByAppendingString:[NSString stringWithFormat:@",%@", string]];
        }
    } else {
        genreNo = @"rock";
    }
    
    NSString *valence = @"";
    NSString *arousal = @"";
    
    if (self.pointForMood) {
        valence = [NSString stringWithFormat:@"%f", self.pointForMood->x];
        arousal = [NSString stringWithFormat:@"%f", self.pointForMood->y];
    } else {
        valence = @"900000";
        arousal = @"100000";
    }
    
    if (!valence) {
        valence = @"900000";
        arousal = @"100000";
    }
    
    [MusicAPI getPlaylistFromMoodWithMaxPopularity:[NSString stringWithFormat:@"100"] minPopularity:[NSString stringWithFormat:@"50"] genreNo:genreNo trackValence:valence trackArousal:arousal resultNumber:[NSString stringWithFormat:@"7"] withCompletion:^(id result, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else if ([result isKindOfClass:[NSDictionary class]]) {
            
            NSDictionary *rootDictionary = result[@"root"];
            NSDictionary *tracksDictionary = rootDictionary[@"tracks"];
            NSArray *trackArray = tracksDictionary[@"track"];
            
            for (NSDictionary *songDict in trackArray) {
                Song *song = [[Song alloc] init];
                song.songTitle = songDict[@"title"];
                song.artistName = [songDict[@"artist"] objectForKey:@"name"];
                song.itunesID = [songDict[@"itunes"] objectForKey:@"id"];
                song.itunesUrl = [NSURL URLWithString:[songDict[@"itunes"] objectForKey:@"url"]];
                song.genre = songDict[@"genre"];
                
                NSString *artistString = [song.artistName stringByReplacingOccurrencesOfString:@" " withString:@"+"];
                NSString *songString = [song.songTitle stringByReplacingOccurrencesOfString:@" " withString:@"+"];
                
                NSString *urlString = [NSString stringWithFormat:@"https://itunes.apple.com/search?term=%@+%@&media=music", artistString, songString];
                NSURL *url = [NSURL URLWithString:urlString];
                song.itunesUrl = url;
                if (song.itunesUrl != nil) {
                    [self.songsArray addObject:song];
                }
            }
            [self.tableView reloadData];
        }
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.songsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SongTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"SongCell"];
    
    Song *song = self.songsArray[indexPath.row];
    cell.delegate = self;
    cell.index = indexPath.row;
    cell.playButton.enabled = NO;
    [cell configureCellWithSong:song];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 56.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SongTableViewCell *selectedCell = [self.tableView cellForRowAtIndexPath:indexPath];
    self.selectedSong = [self.songsArray objectAtIndex:indexPath.row];
    
    NSError *creationError;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *dataPath = [documentsDirectory stringByAppendingPathComponent:@"DownloadedSongsInitial"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:dataPath]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:dataPath
                                  withIntermediateDirectories:NO
                                                   attributes:nil
                                                        error:&creationError];
    }
    
    // NSString *songPath = [dataPath stringByAppendingString:[NSString stringWithFormat:@"/%@-%@.%@", self.selectedSong.artist, self.selectedSong.title,self.selectedSong.previewUrl.lastPathComponent]];
    NSString *songFileName = [NSString stringWithFormat:@"%@-%@.%@", self.selectedSong.artistName, self.selectedSong.songTitle, self.selectedSong.itunesUrl.pathExtension];
    NSString *songPath = [dataPath stringByAppendingPathComponent:songFileName];
    
    self.selectedSong.downloadedPath = songPath;
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:songPath]) {
        [[[NSURLSession sharedSession] dataTaskWithURL:self.selectedSong.itunesUrl
                                     completionHandler:^(NSData * _Nullable data,
                                                         NSURLResponse * _Nullable response,
                                                         NSError * _Nullable error) {
                                         
                                         if (data) {
                                             NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                             NSDictionary *firstDict = [json[@"results"] objectAtIndex:0];
                                             self.selectedSong.itPlayableUrl = [NSURL URLWithString:firstDict[@"previewUrl"]] ;
                                             
                                             dispatch_async(dispatch_get_main_queue(), ^{
                                                 [data writeToFile:songPath atomically:YES];
                                                 [self.audioPlayer pause];
                                                 selectedCell.playButton.enabled = YES;
                                             });
                                         } else {
                                             NSLog(@"NO ITUNES!");
                                         }
                                         
                                     }] resume];
    }
    
    
}

- (void)playAudioPlayerWithURL:(NSURL *)songUrl {
    if (self.audioPlayer) {
        self.audioPlayer.rate = 0;
    }
    self.audioPlayer = [AVPlayer playerWithURL:songUrl];
    [self.audioPlayer play];
}

- (void)didPressPlayCellAtIndex:(NSInteger)index {


    [self playAudioPlayerWithURL:self.selectedSong.itPlayableUrl];

    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
