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

    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"second.jpg"]];
    NSLog(@"----second view----------");
    
    NSArray *array = [NSArray arrayWithObjects:@"IOS",@"Android", nil];
    UISegmentedControl *segmentedController = [[UISegmentedControl alloc] initWithItems:array];
    segmentedController.segmentedControlStyle = UISegmentedControlSegmentCenter;
    
    [segmentedController addTarget:self
                            action:@selector(segmentAction:)
                  forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = segmentedController;
    
//    add toolBar

    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
                                                                            target:self action:@selector(search)];
    
//    用代码重新写一个toolBar
//    [self.navigationController  setToolbarHidden:YES animated:YES];
//    toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0, self.view.frame.size.height - toolBar.frame.size.height - 44.0, self.view.frame.size.width, 44.0)];
//    [toolBar setBarStyle:UIBarStyleDefault];
//    toolBar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
//    [toolBar setItems:[NSArray arrayWithObject:addButton]];
//    [self.view addSubview:toolBar];
    
    
    [self setToolbarItems:[NSArray arrayWithObjects:addButton, nil]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)search
{
    NSLog(@"touched searchBar!");
}

-(void)segmentAction:(id)sender
{
    switch ([sender selectedSegmentIndex]) {
        case 0:
        {
            self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"ios.png"]];
            
        }
            break;
        case 1:
        {
            self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"android.png"]];
        }
            break;
            
        default:
            break;
    }  
}

- (void)dealloc
{
    
    [super dealloc];
}
@end
