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

@interface StartScreen ()

@end

@implementation StartScreen

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
    UIImage *img = [UIImage imageNamed:@"T&CsButtonUnpressed.png"];
    UIImage *img2 = [UIImage imageNamed:@"T&CsButtonPressed.png"];
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
    [[UIApplication sharedApplication] setStatusBarHidden:NO animated:YES];  
    self.navigationController.navigationBar.hidden = NO;
    //self.navigationController.
    //topItem.title = @"title text";
    /*
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:20.0];
    //label.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    label.textAlignment = UITextAlignmentCenter;
    label.textColor     = [UIColor darkGrayColor];
    label.text          = @"           prova";  
     */
    UIImageView *label = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Logo.png"]];

    self.navigationItem.titleView = label;  
}
- (void)viewDidAppear:(BOOL)animated {
    self.navigationController.view.alpha = 1;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createRightButton];
    videoScreen = [[Video alloc] initWithNibName:@"Video" bundle:nil];

    //videoScreen = [[Video alloc] initWithNibName:@"Video" bundle:nil]; 
    // Do any additional setup after loading the view from its nib.
}
-(IBAction)videoButton:(id)sender {
    [self.navigationController pushViewController:videoScreen animated:YES];
}
-(IBAction)gameButton:(id)sender {
    //game = [[Game alloc] initWithNibName:@"Game" bundle:nil];
    menu = [[BrilliantMenu alloc] initWithNibName:@"BrilliantMenu" bundle:nil];
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
