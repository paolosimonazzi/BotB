//
//  TicketPurchasing.m
//  BotB
//
//  Created by Paolo Simonazzi on 30/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TicketPurchasing.h"
#import "Game.h"
#import "AppDelegate.h"
#import "AppDelegate.h"
@interface TicketPurchasing ()

@end

@implementation TicketPurchasing

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)back {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    backButton = [delegate createBackButton:@""];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    //[self.navigationItem setRightBarButtonItem:barButton animated:YES];
    self.navigationItem.leftBarButtonItem = barButton;

}
- (void)viewDidAppear:(BOOL)animated {
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.navigationController.view.alpha = 1;

    //self.view.frame = CGRectMake(0, 50, 320, 400);
}
- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = NO;

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
-(IBAction)buttonAction10:(id)sender {
    self.navigationController.view.alpha = 0;
    //*game = nil;
    self.navigationController.navigationBar.hidden = YES;

    Game *game = [[Game alloc] initWithNibName:@"Game" bundle:nil];

    [self.navigationController pushViewController:game animated:YES];

}
-(IBAction)buttonAction20:(id)sender {

}
-(IBAction)buttonAction30:(id)sender {
}

-(IBAction)buttonAction50:(id)sender {

}

@end
