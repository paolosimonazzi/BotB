//
//  AppDelegate.h
//  BotB
//
//  Created by Paolo Simonazzi on 26/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Game;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

-(UIButton*)createBackButton:(NSString*)str;

@property (nonatomic) BOOL orientation;

@property (nonatomic, retain) Game *game;

@end
