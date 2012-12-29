//
//  jumpAnimate.h
//  learn-IOS
//
//  Created by mrj on 12-12-29.
//  Copyright (c) 2012年 mrj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface jumpAnimate : UIViewController{
    CGMutablePathRef path;
}
-(void)initPath;

@property(assign) CGMutablePathRef path;

@end
