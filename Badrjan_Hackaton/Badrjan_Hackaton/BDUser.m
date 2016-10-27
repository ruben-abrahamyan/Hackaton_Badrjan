//
//  BDUser.m
//  Badrjan_Hackaton
//
//  Created by Gevorg Sukiasyan on 10/27/16.
//  Copyright © 2016 Badrjan. All rights reserved.
//

#import "BDUser.h"

@implementation BDUser

+ (id)sharedUser {
    static BDUser *sharedUser = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedUser = [[self alloc] init];
    });
    return sharedUser;
}

- (id)init {
    if (self = [super init]) {
        self.username = @"Default Nickname ";
    }
    return self;
}

@end
