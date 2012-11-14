//
//  MyClass.m
//  test
//
//  Created by mrj on 12-11-14.
//  Copyright (c) 2012年 mrj. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass//@implementation 实现类

-(id)initWithName:(NSString*) newName AndAge:(int) newAge{//实现构造方法
    
    self=[super init];//调用基类的构造方法，self相当于java中的this，super相当于java中的super
    
    if(self){
        
        name=newName;
        
        age=newAge;
        
    }
    
    return self;
    
}

- (id)init{//默认的构造方法，要么返回完整的对象，要么抛出异常
    
    return [self initWithName:@"fred" AndAge:24];//调用其他构造方法
    
}

-(NSString*) getName{//成员方法，返回name
    
    return name;
    
}

-(int) age{//成员方法，返回age
    
    return age;
    
}

- (void)dealloc//销毁,java中有垃圾回收机制，不需要管理对象销毁，类似于C＋＋中的析构方法

{
    
    [name release];//先销毁成员变量
    
    [super dealloc];//最后掉用基类的销毁
    
}

+(void)className{//实现类静态方法
    
    NSLog(@"MyClass");
    
}

@end//结束实现
