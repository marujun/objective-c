//
//  WebViewController_local.h
//  learn-IOS
//
//  Created by mrj on 12-12-19.
//  Copyright (c) 2012年 mrj. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "WebViewJavascriptBridge.h"
@class WebViewJavascriptBridge;

@interface WebViewController_local : UIViewController<UIWebViewDelegate>{
    
    IBOutlet UIWebView *webView;
    
}

@property (strong, nonatomic) WebViewJavascriptBridge *javascriptBridge;

@end
