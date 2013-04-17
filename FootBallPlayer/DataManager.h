//
//  DataManager.h
//  FootBallPlayer
//
//  Created by Anh Minh on 4/17/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface DataManager : NSObject
{
    NSMutableArray* players;
}
+ (id) sharedManager;
- (NSMutableArray*) getPlayer;
@end
