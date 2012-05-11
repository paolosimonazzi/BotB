//
//  Game.m
//  BotB
//
//  Created by Paolo Simonazzi on 26/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Game.h"
#import "AppDelegate.h"
#import "BrilliantMenu.h"

BrilliantMenu *brilliantMenu;

#define degreesToRadian(x) (M_PI * (x) / 180.0)
int appStatus;
@implementation Game
@synthesize webGame, spinner, numT;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void) startGame:(int)numTickets {
    
    NSString *urlAddress = [NSString stringWithFormat:@"http:////mobile.staging.botb.com//Integration//AppPlay.aspx?id=2ACF7D76-8EFB-46CB-AEE0-938E2135C453&play=%d", numTickets];
    
    /*
    NSString *urlAddress = @"https://mobile.staging.botb.com/test_iframe1.html?id=2ACF7D76-8EFB-46CB-AEE0-938E2135C453&play=3";
     */
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    //Load the request in the UIWebView.
    [webGame loadRequest:requestObj];
}
- (void) animationFinished {
    //[self.navigationController popViewControllerAnimated:YES];

    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];  

    [self.navigationController popToViewController:brilliantMenu animated:YES];
}
- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    // the user clicked one of the OK/Cancel buttons
    if (buttonIndex == 0) {
        NSLog(@"cancel");
        //[self startGame:numT];  
    } else {
        NSLog(@"ok");
        [self leavingTheGame];
    }
}
- (void) leaveTheGameWithoutMessage:(BOOL)val {

    //[[UIApplication sharedApplication] setStatusBarHidden:NO animated:NO];  
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];  
    
    if (val) {
        //[self startGame:numT];
        [self.navigationController popToRootViewControllerAnimated:NO];
        [self leavingTheGame];

    } else {

        [self leavingTheGame];
    }

}
- (void) rotateMessage {
    message.hidden = NO;
    //message.center = CGPointMake(50, 100);

    if (self.interfaceOrientation == UIInterfaceOrientationPortrait) {      
        message.transform = CGAffineTransformIdentity;
        message.transform = CGAffineTransformMakeRotation(degreesToRadian(90));
    }
}

-(void) leaveTheGame {
    
    message = [[UIAlertView alloc] initWithTitle:@"Best Of The Best"
                                                      message:@"Do you want to quit the game?"
                                                     delegate:self
                                            cancelButtonTitle:@"Cancel"
                                            otherButtonTitles:@"Yes", nil];
    
    message.hidden = YES;
    [message show];
    [self performSelector:@selector(rotateMessage) withObject:nil afterDelay:0.5];
    
}
-(void)leavingTheGame {

    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration: 0.5];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationFinished)];
    
    self.navigationController.view.alpha = 0;
    [UIView commitAnimations];
}
-(IBAction)back:(id)sender {
    [self leaveTheGame];
    /*
    if (self.interfaceOrientation == UIInterfaceOrientationPortrait) {      
        webGame.transform = CGAffineTransformIdentity;
        webGame.transform = CGAffineTransformMakeRotation(degreesToRadian(0));
        //webGame.bounds = CGRectMake(0.0, +20.0, 480, 340);
    }
     */
}
- (void)viewDidAppear:(BOOL)animated {

    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration: 1];
    [UIView setAnimationBeginsFromCurrentState:YES]; 
    self.navigationController.view.alpha = 1;
    [UIView commitAnimations];
}

- (void)viewWillAppear:(BOOL)animated {

    //[[UIApplication sharedApplication] setStatusBarHidden:YES animated:NO];  
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];  

    [self startGame:self.numT];

    webGame.frame = CGRectMake(0, 0, 460, 288);
    webGame.center = CGPointMake(144, 230);

    if (self.interfaceOrientation == UIInterfaceOrientationPortrait) {      
        webGame.transform = CGAffineTransformIdentity;
        webGame.transform = CGAffineTransformMakeRotation(degreesToRadian(90));
        //webGame.bounds = CGRectMake(0.0, +20.0, 480, 340);
        /*
        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        backButton = [delegate createBackButton:@""];
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        //[self.navigationItem setRightBarButtonItem:barButton animated:YES];
        self.navigationItem.leftBarButtonItem = barButton;
        backButton.frame = CGRectMake(100, 100, 100, 100);
        [self.navigationController.view addSubview:backButton];
         */
        //webGame.bounds = CGRectMake(0.0, 0.0, 290, 480);
         //webGame.frame = CGRectMake(0, 0, 295, 480);
    }
}
 
- (void)viewDidLoad
{
    [super viewDidLoad];
    webGame.delegate = self;
    appStatus = 0;
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    delegate.game = self;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return NO;
    return (interfaceOrientation == UIDeviceOrientationLandscapeRight);
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [spinner stopAnimating];
}
- (NSString*) getToken:(NSString*)str {
    
    NSArray *splitting = [str componentsSeparatedByCharactersInSet: 
                          [NSCharacterSet characterSetWithCharactersInString:@"="]];
    if ([splitting count]<1) {
        return nil;
    }

    return [splitting objectAtIndex:1];
  
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSString *urlStr = [[request URL] absoluteString];
    NSLog(@"game request:%@", urlStr);
    
    if (!([urlStr rangeOfString:@"AppPlayComplete"].location == NSNotFound)) {
        
        NSString *urlWithToken = [NSString stringWithFormat:
                         @"http://mobile.staging.botb.com/Integration/AppCheckout.aspx?token=%@", 
                         [self getToken:urlStr]];
         
        NSLog(@"urlToken:%@", urlWithToken);
        NSURL *url = [NSURL URLWithString:urlWithToken];
        
        [[UIApplication sharedApplication] openURL:url];
        return NO;
    } else if (!([urlStr rangeOfString:@"AppPlayQuit"].location == NSNotFound)) {
        appStatus = 1;
        [self leaveTheGame];
    }
    return YES;
    //NSLog(@"request: %@", [[request fURL] absoluteString]);
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    int app=0;
}

@end

/*
 self.navigationController.view.frame = CGRectMake(0, 0, 480, 320);
 self.navigationController.view.center = CGPointMake(160, 240);
 
 
 if (self.interfaceOrientation == UIInterfaceOrientationPortrait) {      
 self.navigationController.view.transform = CGAffineTransformIdentity;
 self.navigationController.view.transform = CGAffineTransformMakeRotation(degreesToRadian(90));
 self.navigationController.view.bounds = CGRectMake(0.0, +20.0, 480, 340);
 AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
 backButton = [delegate createBackButton:@""];
 [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
 UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
 //[self.navigationItem setRightBarButtonItem:barButton animated:YES];
 self.navigationItem.leftBarButtonItem = barButton;
 backButton.frame = CGRectMake(100, 100, 100, 100);
 [self.navigationController.view addSubview:backButton];
 }
 */

