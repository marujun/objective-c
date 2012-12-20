//
//  webViewController.h
//  learn-IOS
//
//  Created by mrj on 12-12-18.
//  Copyright (c) 2012年 mrj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface webViewController : UIViewController<UIWebViewDelegate> {
    IBOutlet UIWebView *webView;
    IBOutlet UITextField *textField;
}
- (IBAction)go_to_url:(id)sender;

- (void)loadWebPageWithString:(NSString*)urlString;


@end
