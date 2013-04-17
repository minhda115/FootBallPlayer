//
//  MainView.m
//  FootBallPlayer
//
//  Created by Anh Minh on 4/17/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "MainView.h"
#import "DataManager.h"
#import "DetailPlayer.h"

@interface MainView ()
{
     DetailPlayer * _detailPlayer;
}
@end

@implementation MainView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Football Players";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    DataManager* dataManager = [DataManager sharedManager];
    _playerArray = dataManager.getPlayer;
    playerTableView.dataSource = self;
    playerTableView.delegate = self;
   
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_playerArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleSubtitle
                reuseIdentifier:CellIdentifier];
    }
    
    Player *player = [_playerArray objectAtIndex: [indexPath row]];
    
    NSString *name = player.namePlayer;
    if (name != NULL)
    {
        UIImage *playerImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@", player.image]];
        
        cell.imageView.image = playerImage;
        
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Club: %@", player.club];
        cell.AccessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        cell.textLabel.text = name;
    }
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(!_detailPlayer){
        _detailPlayer = [[DetailPlayer alloc] initWithNibName:@"DetailPlayer"  bundle:[NSBundle mainBundle]];
    }
    UIBarButtonItem* barButton = [UIBarButtonItem new];
    [barButton setTitle:@"Back"];
    self.navigationItem.backBarButtonItem = barButton;
    _detailPlayer.playerID = [indexPath row];
    [self.navigationController pushViewController:_detailPlayer animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
