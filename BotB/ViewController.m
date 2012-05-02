//
//  ViewController.m
//  BotB
//
//  Created by Paolo Simonazzi on 26/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "Video.h"
#import "StartScreen.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    startScreen = [[StartScreen alloc] initWithNibName:@"StartScreen" bundle:nil];
    [self pushViewController:startScreen animated:NO];


	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
- (void)viewWillAppear:(BOOL)animated {
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO (@"5.0")) {
        UIImage *NavigationPortraitBackground = [UIImage imageNamed:@"navBar"];                              //resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        [self.navigationBar setBackgroundImage:NavigationPortraitBackground 
                                 forBarMetrics:UIBarMetricsDefault];
    }
    /*
     UIImage *NavigationPortraitBackground = [UIImage imageNamed:@"navBar"];
    [[UINavigationBar appearance] setBackgroundImage:NavigationPortraitBackground forBarMetrics:UIBarMetricsDefault];
     */

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{

    if (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown)
        return NO;
    else {
        YES;
    }
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(IBAction)videoButton:(id)sender {
    
}

-(IBAction)gameButton:(id)sender {

}

@end
