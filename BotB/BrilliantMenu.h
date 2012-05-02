//
//  BrilliantMenu.h
//  BotB
//
//  Created by Paolo Simonazzi on 27/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrilliantMenu : UIViewController <UIScrollViewDelegate> {
    int currentTab;
    UIButton    *backButton;
    BOOL        justTab;
    

}

@property (nonatomic, retain) IBOutlet UIView       *slidingView;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollablePages;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollableCarsSpec;
@property (nonatomic, retain) IBOutlet UILabel      *titleLabel;
@property (nonatomic, retain) IBOutlet UIView       *secondTab;
@property (nonatomic, retain) IBOutlet UIView       *firstTab;
@property (nonatomic, retain) IBOutlet UIView       *thirdTab;


-(IBAction)menuAction:(id)sender;

-(IBAction)ticketPrices:(id)sender;

@end
