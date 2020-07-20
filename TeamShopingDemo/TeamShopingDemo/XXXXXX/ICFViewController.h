//
//  ICFViewController.h
//  WhackACac
//
//  Created by Kyle Richter on 7/2/12.
//  Copyright (c) 2012 Dragon Forged Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICFGameCenterManager.h"

@interface ICFViewController : UIViewController <GameCenterManagerDelegate, GKLeaderboardViewControllerDelegate, GKAchievementViewControllerDelegate>
{
    
    
}

- (IBAction)play:(id)sender;
- (IBAction)leaderboards:(id)sender;
- (IBAction)achievements:(id)sender;

@end
