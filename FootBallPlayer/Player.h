//
//  Player.h
//  FootBallPlayer
//
//  Created by Anh Minh on 4/17/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject
@property (nonatomic) NSString* logoClub;
@property (nonatomic) NSString* image;
@property (nonatomic) NSString* namePlayer;
@property (nonatomic) NSString* club;
@property (nonatomic) NSString* heightPlayer;
- (id) initWithDictionary: (NSDictionary*) dictionary;
@end
