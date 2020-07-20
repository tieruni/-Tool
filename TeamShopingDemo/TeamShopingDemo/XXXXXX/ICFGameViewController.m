//
//  ICFGameViewController.m
//  WhackACac
//
//  Created by Kyle Richter on 7/2/12.
//  Copyright (c) 2012 Dragon Forged Software. All rights reserved.
//

#import "ICFGameViewController.h"

#define kLifeImageTag 100

#define kGameOverAlert 1
#define kPauseAlert 2

@implementation ICFGameViewController

- (void)viewDidLoad
{
    [[ICFGameCenterManager sharedManager] setDelegate: self];
    
    score = 0;
    life = 5;
    gameOver = NO;
    paused = NO;
    
    [super viewDidLoad];
    
    [self updateLife];
        
    //make one cactus right away
    [self performSelector: @selector(spawnCactus)];
    [self performSelector:@selector(spawnCactus) withObject:nil afterDelay:1.0];
}

#pragma mark -暂停
#pragma mark Actions

- (IBAction)pause:(id)sender 
{
    paused = YES;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Game Paused!" delegate:self cancelButtonTitle:@"Exit" otherButtonTitles:@"Resume", nil];
    alert.tag = kPauseAlert;
    [alert show];
}

#pragma mark -生成仙人掌
#pragma mark Game Play

- (void)spawnCactus;
{
    if(gameOver)
    {
        return;
    }
    
    if(paused)
    {
        [self performSelector:@selector(spawnCactus) withObject:nil afterDelay:1];
        return;
    }
    
    int rowToSpawnIn = arc4random()%3;
    int horizontalLocation = (arc4random()%1024);
        
    int cactusSize = arc4random()%3;
    UIImage *cactusImage = nil;
    
    switch (cactusSize) 
    {
        case 0:
            cactusImage = [UIImage imageNamed: @"CactusLarge.png"];
            break;
        case 1:
            cactusImage = [UIImage imageNamed: @"CactusMed.png"];
            break;
        case 2:
            cactusImage = [UIImage imageNamed: @"CactusSmall.png"];
            break;
        default:
            break;
    }
    
    if(horizontalLocation > 1024 - cactusImage.size.width)
        horizontalLocation = 1024 - cactusImage.size.width;
        
    UIImageView *duneToSpawnBehind = nil;
    
    switch (rowToSpawnIn) 
    {
        case 0:
            duneToSpawnBehind = duneOne;
            break;
        case 1:
            duneToSpawnBehind = duneTwo;
            break;
        case 2:
            duneToSpawnBehind = duneThree;
            break;
        default:
            break;
    }
                         
    float cactusHeight = cactusImage.size.height;
    float cactusWidth = cactusImage.size.width;

    UIButton *cactus = [[UIButton alloc] initWithFrame:CGRectMake(horizontalLocation, (duneToSpawnBehind.frame.origin.y), cactusWidth, cactusHeight)];
    [cactus setImage:cactusImage forState: UIControlStateNormal];
    [cactus addTarget:self action:@selector(cactusHit:) forControlEvents:UIControlEventTouchDown];
    [self.view insertSubview:cactus belowSubview:duneToSpawnBehind];
    
    [UIView beginAnimations: @"slideInCactus" context:nil];
    [UIView setAnimationCurve: UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration: 0.25];
    cactus.frame = CGRectMake(horizontalLocation, (duneToSpawnBehind.frame.origin.y)-cactusHeight/2, cactusWidth, cactusHeight);
    [UIView commitAnimations];
    //2秒后仙人掌消失
    [self performSelector:@selector(cactusMissed:) withObject:cactus afterDelay:2.0];
    
}

#pragma mark - 移除旧的仙人掌，生成新的仙人掌
- (void)cactusMissed:(UIButton *)sender;
{
    if([sender superview] == nil)
    {
        return;
    }
    
    if(paused)
    {
        return;
    }
    
    
    CGRect frame = sender.frame;
    frame.origin.y += sender.frame.size.height;
    
    
    [UIView animateWithDuration:0.1
                          delay:0.0
                        options: UIViewAnimationCurveLinear | UIViewAnimationOptionBeginFromCurrentState
                     animations:^
     {
         sender.frame = frame;     
     } 
                     completion:^(BOOL finished)
     {
         [sender removeFromSuperview];
         [self performSelector:@selector(spawnCactus) withObject:nil afterDelay:(arc4random()%3) + .5];//移除仙人掌后，又随机0-2.5秒生成新的仙人掌
         life--;//生命值
         [self updateLife];
     }];
}

#pragma mark -击中仙人掌
- (IBAction)cactusHit:(id)sender;
{
    [UIView animateWithDuration:0.1
                          delay:0.0
                        options: UIViewAnimationCurveLinear | UIViewAnimationOptionBeginFromCurrentState
                     animations:^
                     {
                        [sender setAlpha: 0];
                     } 
                     completion:^(BOOL finished)
                     {
                         [sender removeFromSuperview];
                     }];
    
    score++;
    [self displayNewScore: score];
    
    [self performSelector:@selector(spawnCactus) withObject:nil afterDelay:(arc4random()%3) + .5];

}

#pragma mark - 更新生命值
-(void)updateLife
{
    UIImage *lifeImage = [UIImage imageNamed:@"heart.png"];
    
    for(UIView *view in [self.view subviews])
    {
        if(view.tag == kLifeImageTag)
        {
            [view removeFromSuperview];
        }
    }
    
    for (int x = 0; x < life; x++)
    {
        UIImageView *lifeImageView = [[UIImageView alloc] initWithImage: lifeImage];
        lifeImageView.tag = kLifeImageTag;
        
        CGRect frame = lifeImageView.frame;
        frame.origin.x = 985 - (x * 30);
        frame.origin.y = 20;
        lifeImageView.frame = frame;
    
        [self.view addSubview: lifeImageView];
    }

    if(life == 0)
    {
        //report score
        [[ICFGameCenterManager sharedManager] reportScore: (int64_t)score forCategory:@"com.dragonforged.whackacac.leaderboard"];
        
        gameOver = YES;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Game Over!" message: [NSString stringWithFormat: @"You scored %0.0f points!", score] delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        alert.tag = kGameOverAlert;
        [alert show];
    }
}

#pragma mark - 更新得分
- (void)displayNewScore:(float)updatedScore;
{
    int scoreInt = score;
    
    if(scoreInt % 10 == 0 && score <= 50)
    {
        [self spawnCactus];
    }
    
    scoreLabel.text = [NSString stringWithFormat: @"%06.0f", updatedScore];
}


#pragma mark -
#pragma mark UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(alertView.tag == kGameOverAlert)
    {
        [self.navigationController popViewControllerAnimated: YES];
    }
    
    else if (alertView.tag == kPauseAlert)
    {
        if(buttonIndex == 0) //exit
        {
            //report score
            [[ICFGameCenterManager sharedManager] reportScore: (int64_t)score forCategory:@"com.dragonforged.whackacac.leaderboard"];

            [self.navigationController popViewControllerAnimated: YES];
        }
        else //resume
        {
            paused = NO;
        }
    }
}

#pragma mark -
#pragma mark GameCenterManagerDelegate

-(void)gameCenterScoreReported:(NSError *)error;
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

#pragma mark -
#pragma mark Cleanup

- (void)viewDidUnload 
{
    scoreLabel = nil;
    duneOne = nil;
    duneTwo = nil;
    duneThree = nil;
    [super viewDidUnload];
}


@end
