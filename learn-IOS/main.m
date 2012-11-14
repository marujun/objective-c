//
//  main.m
//  learn-IOS
//
//  Created by mrj on 12-11-14.
//  Copyright (c) 2012年 mrj. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import "MyClass.h"//引入头文件

int main(int argc, char *argv[])
{
    MyClass* me=[[MyClass new ] autorelease];//new 调用默认构造方法
    //    MyClass* me=[[MyClass alloc]initWithName:@"qiuqiu－球球" AndAge:24];//alloc调用自定义构造方法
    
    NSLog(@"%@",me->name);//直接访问公开的成员变量，%@是对象的占位符
    
    NSLog(@"myname is %@, age is %d",[me getName], [me age]);//%d是数字的占位符
    
    [MyClass className];//调用类静态方法
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
