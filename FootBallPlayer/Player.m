//
//  Player.m
//  FootBallPlayer
//
//  Created by Anh Minh on 4/17/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "Player.h"

@implementation Player
- (id) initWithDictionary:(NSDictionary *)dictionary{
    if (self = [super init]) {
        self.logoClub =  [dictionary objectForKey:@"logoclub"];
        self.image =  [dictionary objectForKey:@"image"];
        self.namePlayer = [dictionary objectForKey:@"name"];
        self.club = [dictionary objectForKey:@"club"];
        self.heightPlayer = [dictionary objectForKey:@"height"];
    }
    return self;
}
@end
