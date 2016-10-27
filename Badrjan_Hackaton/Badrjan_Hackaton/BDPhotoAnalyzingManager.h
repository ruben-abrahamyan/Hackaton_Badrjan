//
//  BDPhotoAnalyzingManager.h
//  Badrjan_Hackaton
//
//  Created by AnnaSakhlyan on 10/27/16.
//  Copyright © 2016 Badrjan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDPhotoAnalyzingManager : NSObject
- (void)analyzeImage:(NSData *)image withCompletion:(void(^)(BOOL success, NSDictionary *result))completion;

@end
