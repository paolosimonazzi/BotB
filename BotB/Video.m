//
//  Video.m
//  BotB
//
//  Created by Paolo Simonazzi on 26/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Video.h"
#import "AppDelegate.h"

@implementation YouTubeView

- (YouTubeView *)initWithStringAsURL:(NSString *)urlString frame:(CGRect)frame;
{
    if (self = [super init]) 
    {
        // Create webview with requested frame size
        self = [[UIWebView alloc] initWithFrame:frame];
        
        // HTML to embed YouTube video
        NSString *youTubeVideoHTML = @"<html><head>\
        <body style=\"margin:0\">\
        <embed id=\"yt\" src=\"%@\" type=\"application/x-shockwave-flash\" \
        width=\"%0.0f\" height=\"%0.0f\"></embed>\
        </body></html>";
        
        // Populate HTML with the URL and requested frame size
        NSString *html = [NSString stringWithFormat:youTubeVideoHTML, urlString, frame.size.width, frame.size.height];
        
        // Load the html into the webview
        [self loadHTMLString:html baseURL:nil];
    }
    return self;  
}
@end

@implementation Video

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) startVideo {
}
-(void)back {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = NO;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    backButton = [delegate createBackButton:@""];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    //[self.navigationItem setRightBarButtonItem:barButton animated:YES];
    self.navigationItem.leftBarButtonItem = barButton;

    YouTubeView *youtubeVideo = [[YouTubeView alloc] initWithStringAsURL:@"http://www.youtube.com/v/3frgULXnE7M?fs=1&amp:hl=en_GB" frame:CGRectMake(-2, -2, 324, 420)];
    [self.view addSubview:youtubeVideo];
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
