//
//  Second_ViewController.m
//  learn-IOS
//
//  Created by mrj on 12-12-20.
//  Copyright (c) 2012年 mrj. All rights reserved.
//

#import "Second_ViewController.h"

@interface Second_ViewController ()

@end

@implementation Second_ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSLog(@"----adads----------");
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSLog(@"----adadasadasds----------");
        self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"4.jpg"]];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSLog(@"----sasa-----------");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    NSLog(@"----sasa3444-----------");
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSLog(@"----sasa32224-----------");
    }
    return self;
}

@end
