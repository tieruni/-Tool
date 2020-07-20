//
//  ICFGameViewController.h
//  WhackACac
//
//  Created by Kyle Richter on 7/2/12.
//  Copyright (c) 2012 Dragon Forged Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICFGameCenterManager.h"

@interface ICFGameViewController : UIViewController <GameCenterManagerDelegate, UIAlertViewDelegate>
{
    IBOutlet UILabel *scoreLabel;
    
    float score;
    int life;
    
    BOOL gameOver;
    BOOL paused;

    
    IBOutlet UIImageView *duneOne;
    IBOutlet UIImageView *duneTwo;
    IBOutlet UIImageView *duneThree;
}

- (IBAction)pause:(id)sender;
- (IBAction)cactusHit:(id)sender;
- (void)displayNewScore:(float)updatedScore;
- (void)spawnCactus;
- (void)cactusMissed:(UIButton *)sender;
-(void)updateLife;
@end
