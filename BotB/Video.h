//
//  Video.h
//  BotB
//
//  Created by Paolo Simonazzi on 26/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YouTubeView : UIWebView <UIWebViewDelegate>{

}
- (YouTubeView *)initWithStringAsURL:(NSString *)urlString frame:(CGRect)frame;

@end

@interface Video : UIViewController {
    UIButton    *backButton;

}

@end
