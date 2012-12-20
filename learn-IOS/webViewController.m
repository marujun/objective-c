//
//  webViewController.m
//  learn-IOS
//
//  Created by mrj on 12-12-18.
//  Copyright (c) 2012年 mrj. All rights reserved.
//

#import "webViewController.h"

@interface webViewController ()

@end

@implementation webViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)loadWebPageWithString:(NSString*)urlString
{
    NSLog(@"input url: %@",urlString);
//    urlString=@"http://www.baidu.com";
    NSURL *url =[NSURL URLWithString:urlString];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}
- (IBAction)go_to_url:(id)sender {
    [textField resignFirstResponder];
    [self loadWebPageWithString:textField.text];
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    UIAlertView *alterview = [[UIAlertView alloc] initWithTitle:@"" message:[error localizedDescription]  delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alterview show];
    [alterview release];
}
- (IBAction)return_home:(id)sender {
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}

@end
