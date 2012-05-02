//
//  Game.h
//  BotB
//
//  Created by Paolo Simonazzi on 26/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Game : UIViewController <UIWebViewDelegate> {

    UIButton    *backButton;
    UIAlertView *message;
    
}
-(IBAction)back:(id)sender;

@property (nonatomic, retain) IBOutlet UIWebView   *webGame;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *spinner;
@property (nonatomic) int numT;

- (void) leaveTheGame;
- (void) leaveTheGameWithoutMessage:(BOOL)val;


@end
