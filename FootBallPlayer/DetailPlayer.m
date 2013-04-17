//
//  DetailPlayer.m
//  FootBallPlayer
//
//  Created by Anh Minh on 4/18/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "DetailPlayer.h"
#import "DataManager.h"
#import "Player.h"
@interface DetailPlayer ()
{
    Player *_player;
}
@end

@implementation DetailPlayer

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createNavButton];
    [_playerName setDelegate:self];
    [_playerClub setDelegate:self];
    [_playerHeight setDelegate:self];
}

- (void) viewDidAppear:(BOOL)animated
{
    _player = [[[DataManager sharedManager] getPlayer] objectAtIndex:_playerID];
    _playerName.text = _player.namePlayer;
    _playerClub.text = _player.club;
    _playerHeight.text = _player.heightPlayer;
    _playerName.enabled = false;
    _playerClub.enabled = false;
    _playerHeight.enabled = false;
    UIImage *playerImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@", _player.image]];
    _playerImage.image = playerImage;
    UIImage *logoClub = [UIImage imageNamed:[NSString stringWithFormat:@"%@", _player.logoClub]];
    _logoClub.image = logoClub;
}

- (void)createNavButton
{
    UIBarButtonItem* editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editFootballer:)];
    [editButton setTitle:@"Edit"];
    self.navigationItem.rightBarButtonItem = editButton;
    [self.playerName resignFirstResponder];
    [self.playerClub resignFirstResponder];
    [self.playerHeight resignFirstResponder];
    self.navigationItem.leftBarButtonItem = nil;
}
-(IBAction) editFootballer :(id)sender
{
    _playerName.enabled = true;
    _playerClub.enabled = true;
    _playerHeight.enabled = true;
    
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneEdit:)];
    [doneButton setTitle:@"Done"];
    
    self.navigationItem.rightBarButtonItem = doneButton;
    
    UIBarButtonItem* cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelEdit:)];
    [cancelButton setTitle:@"Done"];
    
    self.navigationItem.leftBarButtonItem = cancelButton;
}
-(IBAction) cancelEdit :(id)sender
{
    [self createNavButton];
    _playerName.enabled = false;
    _playerClub.enabled = false;
    _playerHeight.enabled = false;
    _player.namePlayer = _playerName.text;
    _player.club = _playerClub.text;
    _player.heightPlayer = _playerHeight.text;
}
-(IBAction) doneEdit :(id)sender
{
    [self createNavButton];
    _playerName.enabled = false;
    _playerClub.enabled = false;
    _playerHeight.enabled = false;
    _player.namePlayer = _playerName.text;
    _player.club = _playerClub.text;
    _player.heightPlayer = _playerHeight.text;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch * touch = [touches anyObject];
    if(touch.phase == UITouchPhaseBegan) {
        [self.playerName resignFirstResponder];
        [self.playerClub resignFirstResponder];
        [self.playerHeight resignFirstResponder];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
