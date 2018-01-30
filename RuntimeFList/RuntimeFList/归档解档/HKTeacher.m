//
//  AppDelegate.h
//  RuntimeFList
//
//  Created by ZhangDong on 2018/1/30.
//  Copyright © 2018年 东之家人. All rights reserved.
//
// 在C语言里面 只要看到了 copy Creat New 就需要释放指针

#import "HKTeacher.h"
#import <objc/runtime.h>

@implementation HKTeacher
//告诉系统归档哪些属性
- (void)encodeWithCoder:(NSCoder *)coder
{
    //利用runtime进行归档
    unsigned int count = 0;
    Ivar * ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++) {
        //取出对应的成员变量
        Ivar ivar = ivars[i];
        //查看成员变量
        const char * name = ivar_getName(ivar);
        NSString * key = [NSString stringWithUTF8String:name];
//        [self valueForKey:key] 属性
//        NSLog(@"%@",[self valueForKey:key]);
        // key 属性名称
        [coder encodeObject:[self valueForKey:key] forKey:key];
    }
    //释放指针
    free(ivars);
}

//告诉系统要解档哪些属性
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        //利用runtime进行解档
        unsigned int count = 0;
        Ivar * ivars = class_copyIvarList([self class], &count);
        for (int i = 0; i < count; i++) {
            //取出对应的成员变量
            Ivar ivar = ivars[i];
            //查看成员变量
            const char * name = ivar_getName(ivar);
            NSString * key = [NSString stringWithUTF8String:name];
            //解档  KVC
            id value = [coder decodeObjectForKey:key];
            //KVC 设置上去
            [self setValue:value forKey:key];
        }
        free(ivars);
    }
    return self;
}

@end
