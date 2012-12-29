//
//  animateViewGather.h
//  learn-IOS
//
//  Created by mrj on 12-12-29.
//  Copyright (c) 2012年 mrj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface animateViewGather : UIViewController<UITabBarControllerDelegate>
@property (retain, nonatomic) IBOutlet UIImageView *lImage;
@property (retain, nonatomic) IBOutlet UIImageView *mImage;
- (IBAction)viewPress:(id)sender;
- (IBAction)blockPress:(id)sender;
- (IBAction)caPress:(id)sender;

@end
