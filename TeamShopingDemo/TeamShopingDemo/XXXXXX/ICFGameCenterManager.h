//
//  ICFGameCenterManager.h
//  WhackACac
//
//  Created by Kyle Richter on 7/3/12.
//  Copyright (c) 2012 Dragon Forged Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>

@protocol GameCenterManagerDelegate <NSObject>
@optional
-(void)gameCenterLoggedIn:(NSError *)error;
-(void)gameCenterScoreReported:(NSError *)error;
-(void)scoreDataUpdated: (NSArray *)scores error:(NSError *)error;
@end

@interface ICFGameCenterManager : NSObject
{
    id <NSObject, GameCenterManagerDelegate> delegate;
}

@property(nonatomic, strong) id <GameCenterManagerDelegate, NSObject> delegate;

+ (ICFGameCenterManager *)sharedManager;
- (void)authenticateLocalUser;
-(void)authenticateLocalUseriOSSix;
- (void)reportScore:(int64_t)score forCategory:(NSString*)category;

@end
