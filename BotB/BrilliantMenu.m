//
//  BrilliantMenu.m
//  BotB
//
//  Created by Paolo Simonazzi on 27/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BrilliantMenu.h"
#import "AppDelegate.h"
#import "TicketPurchasing.h"

@implementation BrilliantMenu

@synthesize slidingView, secondTab, firstTab, thirdTab, scrollablePages, scrollableCarsSpec, titleLabel;

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
- (void)viewDidLoad {
    
    [super viewDidLoad];
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    backButton = [delegate createBackButton:@""];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    //[self.navigationItem setRightBarButtonItem:barButton animated:YES];
    self.navigationItem.leftBarButtonItem = barButton;

    // Do any additional setup after loading the view from its nib.
    
    scrollablePages.contentSize                     = CGSizeMake(960, 302);
    scrollablePages.showsVerticalScrollIndicator    = NO;
    scrollablePages.showsHorizontalScrollIndicator  = NO;
    
    scrollablePages.delegate = self;
    
    scrollableCarsSpec.contentSize                     = CGSizeMake(280, 200);
    scrollableCarsSpec.showsVerticalScrollIndicator    = NO;
    scrollableCarsSpec.showsHorizontalScrollIndicator  = NO;
    
    self.navigationItem.titleView = titleLabel;
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (void) animationFinished {
    if (justTab) {
        return;
    }

    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration: 0.4];
    [UIView setAnimationBeginsFromCurrentState:YES];
    //[UIView setAnimationDelegate:self];
    //[UIView setAnimationDidStopSelector:@selector(animationFinished)];
   
    CGRect scrollRect = CGRectMake(currentTab*320, 50, 320, 302);
    [scrollablePages scrollRectToVisible:scrollRect animated:YES];
    [UIView commitAnimations];

}
- (void) moveMenuTab:(int)where {
    
    float xOffset = 0;
    switch (where) {
        case 0: 
            xOffset = 0;
            titleLabel.text = @"            Prize";
            break;
        case 1:
            xOffset = 107;
            titleLabel.text = @"     Specifications";
            break;
        case 2:
            xOffset = 214;
            titleLabel.text = @"         Reviews";
            break;            
        default:
            break;
    }
    CGRect rect = slidingView.frame;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration: 0.2];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationFinished)];
    
    slidingView.frame = CGRectMake(xOffset, rect.origin.y, rect.size.width, rect.size.height);
    [UIView commitAnimations];

}

- (IBAction)menuAction:(id)sender {
    justTab = NO;
    UIView *viewButton = (UIView *)sender;
    currentTab = viewButton.tag;
    [self moveMenuTab:currentTab];
    NSLog(@"butt:%d", viewButton.tag);
}

- (void)viewDidAppear:(BOOL)animated {
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.navigationController.view.alpha = 1;
    
    //self.view.frame = CGRectMake(0, 50, 320, 400);
}
- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = NO;
    
}



- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    justTab = YES;
    int menuTab = scrollablePages.contentOffset.x/320;
    [self moveMenuTab:menuTab];
}

- (IBAction)ticketPrices:(id)sender {
    TicketPurchasing *ticketPurchasing = [[TicketPurchasing alloc] initWithNibName:@"TicketPurchasing" bundle:nil];
    [self.navigationController pushViewController:ticketPurchasing animated:YES];
}

@end
