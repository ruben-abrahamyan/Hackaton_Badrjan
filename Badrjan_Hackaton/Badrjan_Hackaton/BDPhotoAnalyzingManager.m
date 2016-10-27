//
//  BDPhotoAnalyzingManager.m
//  Badrjan_Hackaton
//
//  Created by AnnaSakhlyan on 10/27/16.
//  Copyright © 2016 Badrjan. All rights reserved.
//

#import "BDPhotoAnalyzingManager.h"

#define  EMOTION_API_BASE_URL @"https://api.projectoxford.ai/emotion/v1.0/recognize"

@implementation BDPhotoAnalyzingManager

- (void)analyzeImage:(NSData *)image withCompletion:(void(^)(BOOL success, NSDictionary *result))completion {
    NSString* path = EMOTION_API_BASE_URL;
    NSArray* array = @[@"entities=true",];
    NSString* string = [array componentsJoinedByString:@"&"];
    path = [path stringByAppendingFormat:@"?%@", string];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"POST"];
    [request setURL:[NSURL URLWithString:path]];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/octet-stream" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"7d1e6fd7efd24a83899d05be2ccf8d79" forHTTPHeaderField:@"Ocp-Apim-Subscription-Key"];
    [request setHTTPBody:image];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSString *requestReply = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
        NSData *jsonData = [requestReply dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
        completion(YES, json);
    }] resume];
}


@end
