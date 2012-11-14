//
//  MyClass.h
//  test
//
//  Created by mrj on 12-11-14.
//  Copyright (c) 2012年 mrj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyClass : NSObject {//@interface申明一个新类 类名：基类
    
@public//公开成员变量
    
    NSString *name;//字符串成员变量声明
    
@private//私有成员变量
    
    int age;//整形成员变量
    
}

-(NSString*)getName;//定义类成员方法 － （返回类型）方法名

-(int)age;//获取age的方法，通常Object－C里面取值不用getXXX的形式，直接用XXX

-(id)initWithName:(NSString*)newName AndAge:(int)newAge;//定义构造方法 － （返回类型）方法名：（类型）参数名：（类型）参数名

+(void)className;//定义静态方法，与类方法不一样，使用＋

@end//类定义结束
