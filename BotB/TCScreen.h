//
//  TCScreen.h
//  BotB
//
//  Created by Paolo Simonazzi on 30/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCScreen : UIViewController {
    UIButton    *backButton;
}
@property (nonatomic, retain) IBOutlet UIScrollView *scrollableView;
@property (nonatomic, retain) IBOutlet UILabel      *labelTitle;
@property (nonatomic, retain) IBOutlet UIView       *TCStuff;


@end
