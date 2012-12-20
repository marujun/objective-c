//
//  First_Na_ViewController.m
//  learn-IOS
//
//  Created by mrj on 12-12-20.
//  Copyright (c) 2012年 mrj. All rights reserved.
//

#import "First_Na_ViewController.h"
#import "First_ViewController.h"

@interface First_Na_ViewController ()

@end

@implementation First_Na_ViewController

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
    // Do any additional setup after loading the view from its nib.
    
    UINavigationController *aNav = [[UINavigationController alloc] init];
    UIViewController *aView = [[[First_ViewController alloc] initWithNibName:@"First_ViewController" bundle:nil] autorelease];
    [aNav pushViewController:aView animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
