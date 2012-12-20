//
//  WebViewController_local.m
//  learn-IOS
//
//  Created by mrj on 12-12-19.
//  Copyright (c) 2012年 mrj. All rights reserved.
//

#import "WebViewController_local.h"
#import "WebViewJavascriptBridge.h"

@interface WebViewController_local ()

@end

@implementation WebViewController_local

@synthesize javascriptBridge = _bridge;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:@"witmob"];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:filePath]]];
    
    
    _bridge = [WebViewJavascriptBridge bridgeForWebView:webView handler:^(id data, WVJBResponseCallback responseCallback) {
        NSLog(@"ObjC received message from JS: %@", data);
        responseCallback(@"send from oc!");
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSURL* url=[request URL];
    NSLog(@"----------%@",url);
    if ([[url scheme] isEqualToString:@"youdao"]) {
        UIAlertView * alertView = [[[UIAlertView alloc] initWithTitle:@"test" message:[url absoluteString] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease];
        [alertView show];
        return NO;
    }
    return YES;
}

- (void)dealloc {
    [webView release];
    [super dealloc];
}

@end
