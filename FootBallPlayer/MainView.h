//
//  MainView.h
//  FootBallPlayer
//
//  Created by Anh Minh on 4/17/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainView : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *playerTableView;
}
@property NSArray* playerArray;
@end
