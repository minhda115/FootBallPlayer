//
//  DataManager.m
//  FootBallPlayer
//
//  Created by Anh Minh on 4/17/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

- (NSMutableArray*) getPlayer
{
    if (!players){
        players = [[NSMutableArray alloc] init];
    }
    NSString* filePath = [[NSBundle mainBundle]pathForResource: @"Data" ofType: @"plist"];
    NSArray* playerArray = [NSArray arrayWithContentsOfFile: filePath];
    for (NSDictionary* aPlayer in playerArray ) {
        Player* player = [[Player alloc] initWithDictionary:aPlayer];
            [players addObject: player];
        }
    return players;
}

+(id)sharedManager{
    static DataManager* dataManager;
    static dispatch_once_t dispatchOnce;
    dispatch_once(&dispatchOnce, ^{
        dataManager = [self new];
    });
    return dataManager;
}

@end
