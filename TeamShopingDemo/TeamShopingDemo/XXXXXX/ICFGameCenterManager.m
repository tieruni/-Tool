//
//  ICFGameCenterManager.m
//  WhackACac
//
//  Created by Kyle Richter on 7/3/12.
//  Copyright (c) 2012 Dragon Forged Software. All rights reserved.
//

#import "ICFGameCenterManager.h"

@implementation ICFGameCenterManager

@synthesize delegate;

static ICFGameCenterManager *sharedManager = nil;

#pragma mark -
#pragma mark Overhead

+ (ICFGameCenterManager *)sharedManager
{
    @synchronized(self)
    {
        if (sharedManager == nil)
        {
            sharedManager = [[self alloc] init];
        }
    }
    
    return sharedManager;
}

- (void)callDelegateOnMainThread:(SEL)selector withArg:(id)arg error:(NSError*)error
{
	dispatch_async(dispatch_get_main_queue(), ^(void)
    {
        [self callDelegate: selector withArg: arg error: error];
    });
}

- (void)callDelegate: (SEL)selector withArg: (id)arg error:(NSError*)error
{
	assert([NSThread isMainThread]);
    
    if(delegate == nil)
    {
        NSLog(@"Game Center Manager Delegate has not been set");
        return;
    }
    
	if([delegate respondsToSelector: selector])
	{
		if(arg != NULL)
        {
			[delegate performSelector: selector withObject: arg withObject: error];
        }
		
		else
        {
			[delegate performSelector: selector withObject: error];
        }
	}
	
	else
    {
		NSLog(@"Unable to find delegate method '%s' in class %@", sel_getName(selector), [delegate class]);
    }
}


#pragma mark -
#pragma mark Authentication 

- (void) authenticateLocalUser
{
	if([GKLocalPlayer localPlayer].authenticated == NO)
	{
		[[GKLocalPlayer localPlayer] authenticateWithCompletionHandler:^(NSError *error)
		 {
             if(error != nil)
             {
                 if([error code] == GKErrorNotSupported)
                 {
                     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"This device does not support Game Center" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
                     [alert show];
                 }
                 
                 else if([error code] == GKErrorCancelled)
                 {
                     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"This device has failed login too many times from the app, you will need to login from the Game Center.app" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
                     [alert show];
                 }
                 
                 else
                 {
                     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
                     [alert show];
                 }
                 
                 
                 return;
             }
             
			 [self callDelegateOnMainThread: @selector(gameCenterLoggedIn:) withArg: NULL error: error];
             [self submitAllSavedScores];
		 }];
	}
}

-(void)authenticateLocalUseriOSSix
{
    if([GKLocalPlayer localPlayer].authenticateHandler == nil)
	{
       [[GKLocalPlayer localPlayer] setAuthenticateHandler:^(UIViewController *viewController, NSError *error)
        {
            if(error != nil)
            {
                if([error code] == GKErrorNotSupported)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"This device does not support Game Center" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
                    [alert show];
                }
                
                else if([error code] == GKErrorCancelled)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"This device has failed login too many times from the app, you will need to login from the Game Center.app" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
                    [alert show];
                }
                
                else
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
                    [alert show];
                }
            }

            else
            {
                if(viewController != nil)
                {
                    [(UIViewController *)delegate presentModalViewController:viewController animated:YES];
                }
                
                [self submitAllSavedScores];
            }
        }];
    }
    
}

#pragma mark -
#pragma mark Scores

- (void)reportScore:(int64_t)score forCategory:(NSString*)category
{
	GKScore *scoreReporter = [[GKScore alloc] initWithCategory:category];
	scoreReporter.value = score;
    
	[scoreReporter reportScoreWithCompletionHandler: ^(NSError *error)
	 {
		 if (error != nil)
		 {
			 NSData* savedScoreData = [NSKeyedArchiver archivedDataWithRootObject:scoreReporter];
             [self storeScoreForLater: savedScoreData];
		 }
		 
		 [self callDelegateOnMainThread:@selector(gameCenterScoreReported:) withArg:NULL error:error];
	 }];
}

- (void)storeScoreForLater:(NSData *)scoreData;
{
	NSMutableArray *savedScoresArray = [[NSMutableArray alloc] initWithArray: [[NSUserDefaults standardUserDefaults] objectForKey:@"savedScores"]];
	[savedScoresArray addObject: scoreData];
	[[NSUserDefaults standardUserDefaults] setObject:savedScoresArray forKey:@"savedScores"];
}

-(void)submitAllSavedScores
{
	NSMutableArray *savedScoreArray = [[NSMutableArray alloc] initWithArray: [[NSUserDefaults standardUserDefaults] objectForKey:@"savedScores"]];
	[[NSUserDefaults standardUserDefaults] removeObjectForKey: @"savedScores"];
	
	for(NSData *scoreData in savedScoreArray)
	{
		GKScore *scoreReporter = [NSKeyedUnarchiver unarchiveObjectWithData: scoreData];
		
		[scoreReporter reportScoreWithCompletionHandler: ^(NSError *error)
		 {
			 if (error != nil)
			 {
				 NSData* savedScoreData = [NSKeyedArchiver archivedDataWithRootObject:scoreReporter];
				 [self storeScoreForLater: savedScoreData];
			 }
			 
			 else
             {
				 NSLog(@"Successfully submitted scores that were pending submission");
                 [self callDelegateOnMainThread:@selector(gameCenterScoreReported:) withArg:NULL error:error];
             }
		 }];
	}
}

@end
