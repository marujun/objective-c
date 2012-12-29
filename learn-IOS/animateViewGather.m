//
//  animateViewGather.m
//  learn-IOS
//
//  Created by mrj on 12-12-29.
//  Copyright (c) 2012年 mrj. All rights reserved.
//

#import "animateViewGather.h"
#import <QuartzCore/QuartzCore.h>

@interface animateViewGather ()

@end

@implementation animateViewGather


@synthesize lImage;
@synthesize mImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)viewDidUnload
{
    [self setLImage:nil];
    [self setMImage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [lImage release];
    [mImage release];
    [super dealloc];
}

-(void)stop
{
    [UIView setAnimationsEnabled:NO];
}

- (IBAction)viewPress:(id)sender {
    UIViewAnimationTransition transition = UIViewAnimationOptionTransitionNone;
    switch (((UIButton*)sender).tag) {
        case 101:
            transition = UIViewAnimationTransitionCurlDown;
            break;
        case 102:
            transition = UIViewAnimationTransitionCurlUp;
            break;
        case 103:
            transition = UIViewAnimationTransitionFlipFromLeft;
            break;
        case 104:
            transition = UIViewAnimationTransitionFlipFromRight;
            break;
        default:
            break;
    }
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDuration:2.7];
    [UIView setAnimationTransition:transition forView:self.view cache:YES];
    
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    
    [UIView commitAnimations];
}

- (IBAction)blockPress:(id)sender {
    if (((UIButton*)sender).tag == 201) {
        [UIView animateWithDuration:0.7 delay:0 options:0 animations:^(){
            self.view.alpha = 0.2;
            [self.view exchangeSubviewAtIndex:1 withSubviewAtIndex:0];
            self.view.alpha = 1;
        } completion:^(BOOL finished)
         {
             
         }];
    }
    else {
        UIViewAnimationOptions options = UIViewAnimationOptionTransitionNone;
        switch (((UIButton*)sender).tag) {
            case 202:
                options = UIViewAnimationOptionTransitionCrossDissolve;
                break;
            case 203:
                options = UIViewAnimationOptionTransitionFlipFromTop;
                break;
            case 204:
                options = UIViewAnimationOptionTransitionFlipFromBottom;
                break;
            default:
                break;
        }
        
        [self.view bringSubviewToFront:lImage];
        [UIView transitionFromView:lImage toView:mImage duration:0.7 options:options completion:^(BOOL finished)
         {
             if (finished) {
                 [self.view addSubview:lImage];
                 [self.view sendSubviewToBack:lImage];
                 [self.view sendSubviewToBack:mImage];
             }
         }];
    }
}

- (IBAction)caPress:(id)sender {
    CATransition *transition = [CATransition animation];
	transition.duration = 0.7;
	transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	
	NSString *types[4] = {kCATransitionMoveIn, kCATransitionPush, kCATransitionReveal, kCATransitionFade};
	NSString *subtypes[4] = {kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom};
    NSString *moreTypes[]={@"cube",@"suckEffect",@"oglFlip",@"rippleEffect",@"pageCurl",@"pageUnCurl",@"cameraIrisHollowOpen",@"cameraIrisHollowClose"};
    
    
	int rnd = random() % 4;
	transition.type = types[rnd];
	
    int btag = ((UIButton*)sender).tag;
    
    if (btag<400) {
        transition.type = types[btag-300-1];
    }
    else
    {
        transition.type = moreTypes[btag-400-1];
    }
    
    transition.subtype = subtypes[random() % 4];
    
	transition.delegate = self;
	
	[self.view.layer addAnimation:transition forKey:nil];
    [self.view exchangeSubviewAtIndex:1 withSubviewAtIndex:0];
}

-(void)animationDidStart:(CAAnimation *)anim
{
    
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    
}

@end
