//
//  jumpAnimate.m
//  learn-IOS
//
//  Created by mrj on 12-12-29.
//  Copyright (c) 2012年 mrj. All rights reserved.
//

#import "jumpAnimate.h"
#import <QuartzCore/QuartzCore.h>

@interface jumpAnimate ()

@end

@implementation jumpAnimate
@synthesize path;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(10, 40, 300, 400)];
    bgView.backgroundColor = [UIColor lightGrayColor];
    bgView.tag = 150;
    
    //需要跳动的图片
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"YHY010.jpg.png"]];
    [bgView addSubview:imgView];
    imgView.tag = 151;
    imgView.center = CGPointMake(150, 300);
    
    //Go
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"跳跃" forState:UIControlStateNormal];
    button.frame = CGRectMake(10, 10, 80, 25);
    [button addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];
    
//    drift
    UIButton *driftButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [driftButton setTitle:@"飘荡" forState:UIControlStateNormal];
    driftButton.frame = CGRectMake(110, 10, 80, 25);
    [driftButton addTarget:self action:@selector(drift:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:bgView];
    [self.view addSubview:button];
    [self.view addSubview:driftButton];
    
    [bgView release];
    [imgView release];
    
    [super viewDidLoad];
}


- (void) go:(id) sender{
    UIView *img = [self.view viewWithTag:151];
    [CATransaction begin];
    [CATransaction setValue:[NSNumber numberWithFloat:4.0] forKey:kCATransactionAnimationDuration];
    
    // scale it down
    CABasicAnimation *shrinkAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    shrinkAnimation.delegate = self;
    shrinkAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    shrinkAnimation.toValue = [NSNumber numberWithFloat:0.0];
    [[img layer] addAnimation:shrinkAnimation forKey:@"shrinkAnimation"];
    
    // fade it out
    CABasicAnimation *fadeAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeAnimation.toValue = [NSNumber numberWithFloat:0.0];
    fadeAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [[img layer] addAnimation:fadeAnimation forKey:@"fadeAnimation"];
    
    // make it jump a couple of times
    CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGMutablePathRef positionPath = (__typeof(CGPathCreateMutable()))[NSMakeCollectable(CGPathCreateMutable()) autorelease];
    CGPathMoveToPoint(positionPath, NULL, [img layer].position.x, [img layer].position.y);
    
    //落下3次
    CGPathAddQuadCurveToPoint(positionPath, NULL, [img layer].position.x, -[img layer].position.y, [img layer].position.x, [img layer].position.y);
    CGPathAddQuadCurveToPoint(positionPath, NULL, [img layer].position.x, -[img layer].position.y * 1.5, [img layer].position.x, [img layer].position.y);
    CGPathAddQuadCurveToPoint(positionPath, NULL, [img layer].position.x, -[img layer].position.y * 1.25, [img layer].position.x, [img layer].position.y);
    
    positionAnimation.path = positionPath;
    positionAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [[img layer] addAnimation:positionAnimation forKey:@"positionAnimation"];
    
    [CATransaction commit];
}
- (void) drift:(id) sender{
    UIView *img = [self.view viewWithTag:151];
    [self initPath];
    CAKeyframeAnimation* animation;
    animation = [CAKeyframeAnimation animation];
	animation.path = path;
	CGPathRelease(path);
	animation.duration = 10;
	animation.repeatCount = 10;
 	animation.calculationMode = @"paced";
    
    CABasicAnimation* fadeInOutAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
	fadeInOutAnimation.duration = 7;
	fadeInOutAnimation.repeatCount =10000;
	fadeInOutAnimation.toValue = [NSNumber numberWithFloat:.1];
	fadeInOutAnimation.autoreverses = YES;
    
    [img.layer addAnimation:animation forKey:@"position"];
	[img.layer addAnimation:fadeInOutAnimation forKey:@"opacity"];
	
	img.layer.needsDisplayOnBoundsChange = YES;
	[UIView setAnimationCurve:UIViewAnimationCurveLinear];
	img.layer.position = CGPointMake(100, 100);
	img.layer.opacity = .9;
}
-(void)initPath{
	path = CGPathCreateMutable();
	int udCount = 5;
	int width = self.view.frame.size.width / udCount ;
	int xOffset = 150;
	int yOffset = 200;
	int waveHeight = 50;
	CGPoint p1 = CGPointMake(width * -1 + xOffset, self.view.frame.origin.y + yOffset);
	CGPoint p2 = CGPointMake(width * 0 + xOffset, self.view.frame.origin.y + yOffset);
	CGPoint p3 = CGPointMake(width * 1 + xOffset, self.view.frame.origin.y + yOffset);
	CGPoint p4 = CGPointMake(width * 2 + xOffset, self.view.frame.origin.y + yOffset);
	CGPoint p5 = CGPointMake(width * 3 + xOffset, self.view.frame.origin.y + yOffset);
	CGPoint p6 = CGPointMake(width * 4 + xOffset, self.view.frame.origin.y + yOffset);
	CGPoint p7 = CGPointMake(width * 5 + xOffset, self.view.frame.origin.y + yOffset);
	CGPoint p8 = CGPointMake(width * 7 + xOffset, self.view.frame.origin.y + yOffset);
	
    
	CGPathMoveToPoint(path, NULL, p1.x,p1.y);
    
	CGPathAddQuadCurveToPoint(path, NULL, p1.x+width/2, p1.y - waveHeight, p2.x, p2.y);
	CGPathAddQuadCurveToPoint(path, NULL, p2.x+width/2, p2.y + waveHeight, p3.x, p3.y);
	CGPathAddQuadCurveToPoint(path, NULL, p3.x+width/2, p3.y - waveHeight, p4.x, p4.y);
	CGPathAddQuadCurveToPoint(path, NULL, p4.x+width/2, p4.y + waveHeight, p5.x, p5.y);
	CGPathAddQuadCurveToPoint(path, NULL, p5.x+width/2, p5.y - waveHeight, p6.x, p6.y);
	CGPathAddQuadCurveToPoint(path, NULL, p6.x+width/2, p6.y + waveHeight, p7.x, p7.y);
	CGPathAddQuadCurveToPoint(path, NULL, p7.x+width/2, p7.y - waveHeight, p8.x, p8.y);
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc
{
    [super dealloc];
}

@end
