//
//  MoodPercentages.m
//  Badrjan_Hackaton
//
//  Created by Gevorg Sukiasyan on 10/27/16.
//  Copyright © 2016 Badrjan. All rights reserved.
//

#import "MoodPercentages.h"

@implementation MoodPercentages

- (id)initWithDictionary:(NSDictionary *) dict {
    if (self = [super init]) {
        self.happiness = [dict[@"happiness"] floatValue];
        self.anger = [dict[@"anger"] floatValue];
        self.disgust = [dict[@"disgust"] floatValue];
        self.contempt = [dict[@"contempt"] floatValue];
        self.sadness = [dict[@"sadness"] floatValue];
        self.neutral = [dict[@"neutral"] floatValue];
        self.fear = [dict[@"fear"] floatValue];
        self.surprise = [dict[@"surprise"] floatValue];
    }
    return self;
}

- (NSArray *)getArrayOfMoodsWithValues {
    return [NSArray arrayWithObjects: [NSNumber numberWithFloat:self.happiness],[NSNumber numberWithFloat:self.anger], [NSNumber numberWithFloat:self.disgust], [NSNumber numberWithFloat:self.contempt], [NSNumber numberWithFloat:self.sadness], [NSNumber numberWithFloat:self.neutral], [NSNumber numberWithFloat:self.fear], [NSNumber numberWithFloat:self.surprise], nil];
}

@end
