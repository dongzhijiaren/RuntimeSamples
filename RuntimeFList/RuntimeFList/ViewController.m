//
//  ViewController.m
//  RuntimeFList
//
//  Created by ZhangDong on 2018/1/30.
//  Copyright © 2018年 东之家人. All rights reserved.
//

#import "ViewController.h"
#import "HKTeacher.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)save:(id)sender {
    //创建一个对象
    HKTeacher * t = [HKTeacher new];
    t.name =@"hankV587";
    t.age = 18;
    t.age6 = 99;
    //获取需要保存的路径
    NSString * tempPath = NSTemporaryDirectory();
    //    NSLog(@"%@",tempPath);
    NSString * filePath = [tempPath stringByAppendingPathComponent:@"teacher.data"];
    //归档
    [NSKeyedArchiver archiveRootObject:t toFile:filePath];
    
}
//取数据
- (IBAction)read:(id)sender {
    NSString * tempPath = NSTemporaryDirectory();
    NSString * filePath = [tempPath stringByAppendingPathComponent:@"teacher.data"];
    HKTeacher * t = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"%@",t.name);
    NSLog(@"%d",t.age);
    NSLog(@"%d",t.age6);
    NSLog(@"%d",t.age1);
    NSLog(@"%d",t.age2);
    NSLog(@"%d",t.age3);
    NSLog(@"%d",t.age4);
    NSLog(@"%d",t.age5);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
