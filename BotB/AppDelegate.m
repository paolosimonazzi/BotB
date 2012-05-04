//
//  AppDelegate.m
//  BotB
//
//  Created by Paolo Simonazzi on 26/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "Game.h"

@implementation AppDelegate

@synthesize window = _window, orientation, game;

-(UIButton*)createBackButton:(NSString*)str {
    UIImage *img = [UIImage imageNamed:@"buttonBack.png"];
    UIImage *img2 = [UIImage imageNamed:@"buttonBackActive.png"];
    UIButton *temp = [UIButton buttonWithType:UIButtonTypeCustom];
    temp.bounds = CGRectMake(0,0,img.size.width,img.size.height);
    [temp setBackgroundImage:img forState:UIControlStateNormal];
    [temp setBackgroundImage:img2 forState:UIControlStateHighlighted];
    [temp setTitle:[NSString stringWithFormat:@"  %@", str] forState:UIControlStateNormal];
    //[temp setTitle:@"Back" forState:UIControlStateNormal];
    temp.titleLabel.font = [UIFont systemFontOfSize:11.0f];
    return temp;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}
				
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    
    NSString *str = [url absoluteString];
    [game leaveTheGameWithoutMessage:YES];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    //[[UIApplication sharedApplication] setStatusBarHidden:YES animated:NO];  
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
