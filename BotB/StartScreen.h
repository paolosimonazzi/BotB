//
//  StartScreen.h
//  BotB
//
//  Created by Paolo Simonazzi on 26/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Video, Game ,BrilliantMenu;


@interface StartScreen : UIViewController {
    Video           *videoScreen;
    UIButton        *TCButton;
    Game            *game;
    BrilliantMenu   *menu;
}
-(IBAction)videoButton:(id)sender;
-(IBAction)gameButton:(id)sender;

@end
