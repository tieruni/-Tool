//
//  ICFViewController.m
//  WhackACac
//
//  Created by Kyle Richter on 7/2/12.
//  Copyright (c) 2012 Dragon Forged Software. All rights reserved.
//

#import "ICFViewController.h"
#import "ICFGameViewController.h"
#import "AppDelegate.h"

@interface ICFViewController ()

@end

@implementation ICFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[ICFGameCenterManager sharedManager] setDelegate: self];
    
    //Depending upon OS requirements either method may be used. 
    
    [[ICFGameCenterManager sharedManager] authenticateLocalUser];
    //[[ICFGameCenterManager sharedManager] authenticateLocalUseriOSSix];

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    AppDelegate *appDel = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appDel.allowRotation = YES;
    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIInterfaceOrientationLandscapeRight] forKey:@"orientation"];
    [UIViewController attemptRotationToDeviceOrientation];//屏幕方向与设备方向保持一致
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear: animated];
    
    [[ICFGameCenterManager sharedManager] setDelegate: self];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark -
#pragma mark Actions

- (IBAction)play:(id)sender 
{
    
    ICFGameViewController *gameVC = [[ICFGameViewController alloc] init];
    [self.navigationController pushViewController:gameVC animated:YES];
    
}

- (IBAction)leaderboards:(id)sender 
{
    GKLeaderboardViewController *leaderboardViewController = [[GKLeaderboardViewController alloc] init];
    if(leaderboardViewController == nil)
    {
        NSLog(@"Unable to create leaderboard view controller");
        return;
    }
    
    leaderboardViewController.category = @"com.dragonforged.whackacac.leaderboard";
    leaderboardViewController.timeScope = GKLeaderboardTimeScopeAllTime;
    leaderboardViewController.leaderboardDelegate = self;
    
    [self presentModalViewController:leaderboardViewController animated:YES];
}

- (IBAction)achievements:(id)sender
{
    GKAchievementViewController *achievementViewController = [[GKAchievementViewController alloc] init];
    
    if(achievementViewController == nil)
    {
        NSLog(@"Unable to create achivement view controller");
        return;
    }
    
    achievementViewController.achievementDelegate = self;
    
    [self presentModalViewController:achievementViewController animated:YES];
    
}

#pragma mark -
#pragma mark GameCenterManagerDelegate

- (void)achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
    [self dismissModalViewControllerAnimated: YES];
}

#pragma mark -
#pragma mark GKLeaderboardViewControllerDelegate

- (void)leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
    [self dismissModalViewControllerAnimated: YES];
}

#pragma mark -
#pragma mark GKAchievementViewControllerDelegate

- (void)gameCenterLoggedIn:(NSError*)error
{
    if(error != nil)
    {
		NSLog(@"An error occurred trying to log into Game Center: %@", [error localizedDescription]);
    }

    else
    {
        NSLog(@"Successfully logged into Game Center!");
    }
}

-(void)gameCenterScroreReported:(NSError *)error;
{
    if(error != nil)
    {
		NSLog(@"An error occurred trying to report a score to Game Center: %@", [error localizedDescription]);
    }
    
    else
    {
        NSLog(@"Successfully submitted score");
    }
}


@end
