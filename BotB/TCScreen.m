//
//  TCScreen.m
//  BotB
//
//  Created by Paolo Simonazzi on 30/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TCScreen.h"
#import "AppDelegate.h"

@interface TCScreen ()

@end

@implementation TCScreen

@synthesize scrollableView, labelTitle, TCStuff;

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
    scrollableView.contentSize = CGSizeMake(320, 6900);
    scrollableView.showsVerticalScrollIndicator   = YES;
    scrollableView.showsHorizontalScrollIndicator = NO;

    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    backButton = [delegate createBackButton:@""];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    //[self.navigationItem setRightBarButtonItem:barButton animated:YES];
    self.navigationItem.leftBarButtonItem = barButton;

    // Do any additional setup after loading the view from its nib.
    /*
    UIImageView *label = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Logo.png"]];
    U*/
    self.navigationItem.titleView = labelTitle;  
    [self.scrollableView addSubview:TCStuff];
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
