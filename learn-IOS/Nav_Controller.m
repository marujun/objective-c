//
//  Nav_Controller.m
//  learn-IOS
//
//  Created by mrj on 12-12-20.
//  Copyright (c) 2012年 mrj. All rights reserved.
//

#import "Nav_Controller.h"
#import "First_ViewController.h"
#import "Second_ViewController.h"


@interface Nav_Controller ()

@end

@implementation Nav_Controller

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
	// Do any additional setup after loading the view.
    
    First_ViewController *aView=[[[First_ViewController alloc] initWithNibName:@"First_ViewController" bundle:nil] autorelease];
    [self pushViewController:aView animated:NO];
//开启底边栏
    [self  setToolbarHidden:NO animated:NO];
    
    aView.title = @"witmob";
    UIBarButtonItem *callModalViewButton = [[UIBarButtonItem alloc]
                                            initWithTitle:@"首页"
                                            style:UIBarButtonItemStyleBordered
                                            target:self
                                            action:@selector(return_home)];
    aView.navigationItem.leftBarButtonItem = callModalViewButton;
    UIBarButtonItem *nextModalViewButton = [[UIBarButtonItem alloc]
                                            initWithTitle:@"下一页"
                                            style:UIBarButtonItemStyleBordered
                                            target:self
                                            action:@selector(next_view)];
    aView.navigationItem.leftBarButtonItem = callModalViewButton;
    aView.navigationItem.rightBarButtonItem  =nextModalViewButton;
    [callModalViewButton release];
    [nextModalViewButton release];
    UIBarButtonItem *backButton = [[[UIBarButtonItem alloc] initWithTitle:@"上一页"
                                                                    style:UIButtonTypeCustom
                                                                   target:nil
                                                                   action:nil] autorelease];
    aView.navigationItem.backBarButtonItem=backButton;
    
}

- (void)backBarAction
{
    NSLog(@"--1212121");
    [self  setToolbarHidden:NO animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)return_home
{
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}

- (void)next_view{
    Second_ViewController *bView=[[[Second_ViewController alloc] initWithNibName:@"Second_ViewController" bundle:nil] autorelease];
    [self pushViewController:bView animated:YES];
    
}
- (void)dealloc
{
    [super dealloc];
}

@end
