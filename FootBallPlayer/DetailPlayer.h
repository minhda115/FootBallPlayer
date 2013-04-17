//
//  DetailPlayer.h
//  FootBallPlayer
//
//  Created by Anh Minh on 4/18/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailPlayer : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *logoClub;
@property int playerID;
@property (weak, nonatomic) IBOutlet UITextField *playerName;
@property (weak, nonatomic) IBOutlet UITextField *playerClub;
@property (weak, nonatomic) IBOutlet UITextField *playerHeight;
@property (weak, nonatomic) IBOutlet UIImageView *playerImage;
@end
