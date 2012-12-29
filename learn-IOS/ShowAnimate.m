//
//  ShowAnimate.m
//  learn-IOS
//
//  Created by mrj on 12-12-28.
//  Copyright (c) 2012年 mrj. All rights reserved.
//

#import "ShowAnimate.h"
#import <QuartzCore/QuartzCore.h>
@interface ShowAnimate ()

@end

@implementation ShowAnimate

CGFloat angle=0;

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
    
//    [UIView beginAnimations:@"ddd" context:nil];//设置动画
//    CGAffineTransform moveTransform=CGAffineTransformMakeTranslation(180, 200);
//    [UIView commitAnimations]; //提交动画
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:@"qian" context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:1.0];
    [self.image_view_anmiate1 setAlpha:0];//注意，这个对当前子视图设置显示属性
    [self.image_view_anmiate2 setAlpha:0];
    [self.image_view_anmiate3 setAlpha:0];
    [self.image_view_anmiate4 setAlpha:0];
    [self.image_view_anmiate5 setAlpha:0];
    [self.image_view_anmiate6 setAlpha:0];
    [self.image_view_anmiate7 setAlpha:0];
    [self.image_view_anmiate8 setAlpha:0];
    [UIView commitAnimations];
    
    NSTimer *timer1,*timer2,*timer3,*timer4;
    timer1= [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(showImage) userInfo:nil repeats:NO];
    timer2= [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(overturn) userInfo:nil repeats:NO];
    timer3= [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(moveImage) userInfo:nil repeats:NO];
    timer4= [NSTimer scheduledTimerWithTimeInterval:7.0 target:self selector:@selector(rotateImage) userInfo:nil repeats:NO];
}
-(void)showImage{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:@"shen" context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:1.0];
    [self.image_view_anmiate1 setAlpha:1];
    [self.image_view_anmiate2 setAlpha:1];
    [self.image_view_anmiate3 setAlpha:1];
    [self.image_view_anmiate4 setAlpha:1];
    [self.image_view_anmiate5 setAlpha:1];
    [self.image_view_anmiate6 setAlpha:1];
    [self.image_view_anmiate7 setAlpha:1];
    [self.image_view_anmiate8 setAlpha:1];
    [UIView commitAnimations];
}
-(void) overturn{
    [UIView beginAnimations:nil context:nil];   
    [UIView setAnimationDuration:1];       //设置动画时间  
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];                        // 动画效果   
    [UIView setAnimationDelegate:self];              //设置代理 
    [UIView setAnimationDidStopSelector:@selector(addScrollViewAction)];//动画停止后指向一个方法，必须添加了上一句代码，该行才有效果  
    [UIView commitAnimations];
}
-(void) moveImage{
    CGPoint translation = CGPointMake(156.0,0.0);
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:1.0];
    self.image_view_anmiate1.transform = CGAffineTransformMakeTranslation(translation.x,translation.y);
    self.image_view_anmiate2.transform = CGAffineTransformMakeTranslation(-translation.x,translation.y);
    self.image_view_anmiate3.transform = CGAffineTransformMakeTranslation(translation.x,translation.y);
    self.image_view_anmiate4.transform = CGAffineTransformMakeTranslation(-translation.x,translation.y);
    self.image_view_anmiate5.transform = CGAffineTransformMakeTranslation(translation.x,translation.y);
    self.image_view_anmiate6.transform = CGAffineTransformMakeTranslation(-translation.x,translation.y);
    self.image_view_anmiate7.transform = CGAffineTransformMakeTranslation(translation.x,translation.y);
    self.image_view_anmiate8.transform = CGAffineTransformMakeTranslation(-translation.x,translation.y);
    [UIView commitAnimations];
}
-(void) rotateImage{
//    more stuff in method
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
     NSTimer *timer;
    timer = [NSTimer scheduledTimerWithTimeInterval: 0.01 target: self selector:@selector(hadleTimer) userInfo: nil repeats: YES];
    [self rippleEffect];
    [UIView commitAnimations];
}
-(void)hadleTimer{
    angle += 0.01;
    if (angle > 6.283) {
        angle = 0;
    }
    CGAffineTransform transform=CGAffineTransformMakeRotation(angle);
    self.image_view_anmiate1.transform = transform;
    self.image_view_anmiate2.transform = transform;
    self.image_view_anmiate3.transform = transform;
    self.image_view_anmiate4.transform = transform;
    self.image_view_anmiate5.transform = transform;
    self.image_view_anmiate6.transform = transform;
    self.image_view_anmiate7.transform = transform;
    self.image_view_anmiate8.transform = transform;
}
-(void) rippleEffect{
//    水滴效果
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = 1.0;       //动画执行时间
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = @"rippleEffect";
    animation.subtype = kCATransitionFromRight;
    
// 这里添加你对UIView所做改变的代码
    [self.image_view_anmiate1.layer addAnimation:animation forKey:@"animation"];
    [self.image_view_anmiate2.layer addAnimation:animation forKey:@"animation"];
    [self.image_view_anmiate3.layer addAnimation:animation forKey:@"animation"];
    [self.image_view_anmiate4.layer addAnimation:animation forKey:@"animation"];
    [self.image_view_anmiate5.layer addAnimation:animation forKey:@"animation"];
    [self.image_view_anmiate6.layer addAnimation:animation forKey:@"animation"];
    [self.image_view_anmiate7.layer addAnimation:animation forKey:@"animation"];
    [self.image_view_anmiate8.layer addAnimation:animation forKey:@"animation"];
}
-(void) addScrollViewAction{
    NSLog(@"动画结束");
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_image_view_anmiate1 release];
    [_image_view_anmiate2 release];
    [_image_view_anmiate3 release];
    [_image_view_anmiate4 release];
    [_image_view_anmiate5 release];
    [_image_view_anmiate6 release];
    [_image_view_anmiate7 release];
    [_image_view_anmiate8 release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setImage_view_anmiate1:nil];
    [self setImage_view_anmiate2:nil];
    [self setImage_view_anmiate3:nil];
    [self setImage_view_anmiate4:nil];
    [self setImage_view_anmiate5:nil];
    [self setImage_view_anmiate6:nil];
    [self setImage_view_anmiate7:nil];
    [self setImage_view_anmiate8:nil];
    [super viewDidUnload];
}
@end
