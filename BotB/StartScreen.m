//
//  StartScreen.m
//  BotB
//
//  Created by Paolo Simonazzi on 26/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StartScreen.h"
#import "Video.h"
#import "Game.h"
#import "AppDelegate.h"
#import "BrilliantMenu.h"
#import "TCScreen.h"

#define degreesToRadian(x) (M_PI * (x) / 180.0)

extern BrilliantMenu *brilliantMenu;

@interface StartScreen ()

@end

@implementation StartScreen

@synthesize fakeSplash;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void) TCButtonAction {
    TCScreen *Tc = [[TCScreen alloc] initWithNibName:@"TCScreen" bundle:nil];
    [self.navigationController pushViewController:Tc animated:YES];

}
- (void) createRightButton {
    UIImage *img = [UIImage imageNamed: @"buttonT&Cs.png"];
    UIImage *img2 = [UIImage imageNamed:@"buttonT&CsActive.png"];
    TCButton = [UIButton buttonWithType:UIButtonTypeCustom];
    TCButton.bounds = CGRectMake(0,0,img.size.width,img.size.height);
    [TCButton setBackgroundImage:img forState:UIControlStateNormal];
    [TCButton setBackgroundImage:img2 forState:UIControlStateHighlighted];
    UIBarButtonItem *optionButtonItem = [[UIBarButtonItem alloc] initWithCustomView:TCButton];
    [TCButton addTarget:self action:@selector(TCButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = optionButtonItem;
}
- (void)viewWillAppear:(BOOL)animated {

    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    //[[UIApplication sharedApplication] setStatusBarHidden:NO animated:YES];  
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];  

    self.navigationController.navigationBar.hidden = NO;
    //self.navigationController.
    //topItem.title = @"title text";

    UIImageView *label = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];

    self.navigationItem.titleView = label;  
    [self createRightButton];
}
- (void) removeSplash {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration: 1];
    [UIView setAnimationBeginsFromCurrentState:YES]; 
    fakeSplash.alpha = 0;
    [UIView commitAnimations];
}

- (void)viewDidAppear:(BOOL)animated {
    self.navigationController.view.alpha = 1;
    [self performSelector:@selector(removeSplash) withObject:nil afterDelay:2];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController.view addSubview:fakeSplash];

    //videoScreen = [[Video alloc] initWithNibName:@"Video" bundle:nil]; 
    // Do any additional setup after loading the view from its nib.
}
-(IBAction)videoButton:(id)sender {
    videoScreen = [[Video alloc] initWithNibName:@"Video" bundle:nil];

    [self.navigationController pushViewController:videoScreen animated:YES];
}
-(IBAction)gameButton:(id)sender {
    //game = [[Game alloc] initWithNibName:@"Game" bundle:nil];
    menu = [[BrilliantMenu alloc] initWithNibName:@"BrilliantMenu" bundle:nil];
    brilliantMenu = menu;
    //self.navigationController.view.alpha = 0;
    [self.navigationController pushViewController:menu animated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
