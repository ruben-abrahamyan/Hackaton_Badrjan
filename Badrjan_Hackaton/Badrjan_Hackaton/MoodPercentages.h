//
//  MoodPercentages.h
//  Badrjan_Hackaton
//
//  Created by Gevorg Sukiasyan on 10/27/16.
//  Copyright © 2016 Badrjan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface MoodPercentages : NSObject

@property (nonatomic) CGFloat happiness;
@property (nonatomic) CGFloat anger;
@property (nonatomic) CGFloat disgust;
@property (nonatomic) CGFloat contempt;
@property (nonatomic) CGFloat sadness;
@property (nonatomic) CGFloat neutral;
@property (nonatomic) CGFloat fear;
@property (nonatomic) CGFloat surprise;

- (id)initWithDictionary:(NSDictionary *) dict;

@end
