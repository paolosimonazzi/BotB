//
//  TicketPurchasing.h
//  BotB
//
//  Created by Paolo Simonazzi on 30/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TicketPurchasing : UIViewController {

    UIButton    *backButton;

}

@property (nonatomic, retain) IBOutlet UILabel  *titleLabel;

-(IBAction)buttonAction10:(id)sender;
-(IBAction)buttonAction20:(id)sender;
-(IBAction)buttonAction30:(id)sender;
-(IBAction)buttonAction50:(id)sender;

@end
