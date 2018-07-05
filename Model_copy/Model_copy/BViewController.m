//
//  BViewController.m
//  Model_copy
//
//  Created by sve on 2018/7/5.
//  Copyright © 2018年 sve. All rights reserved.
//  

#import "BViewController.h"

@interface BViewController ()
@property (nonatomic, strong) Person *personB;
@end

@implementation BViewController

- (instancetype)initWithPerson:(Person *)person {
    if (self = [super init]) {
        // 一:如果不实现NSCopy协议自定义对象直接调用copy会崩溃
        // 实现了copy协议,但是模型里面嵌套的模型如果没有实现copy协议, 这个内层的模型改变了之后,之前的模型也跟着变化了,除非内层的模型也实现copy
        // 内层模型还要单独调用copy 使用copy的目的是生成全新的对象,不希望影响到原来的对象
        self.personB = [person copy];
        self.personB.dog = [person.dog copy];
        

        // 二:嵌套的对象遵守NSCoding encode initWithCode 第一个对象也必须遵守NSCoding
//        self.personB = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:person]];
        
        
        // 三:AB控制器共享一个对象, B类修改了,A类也会跟着变化
//        self.personB = person;
    
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"B控制器";
    self.view.backgroundColor = [UIColor whiteColor];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"B控制器touchu之前:%@的狗%zd岁了",self.personB.name, self.personB.dog.age);
    self.personB.name = @"我改名了叫王五";
    self.personB.dog.age = 20;
    NSLog(@"B控制器touchu之后后后:%@的狗%zd岁了",self.personB.name, self.personB.dog.age);
}


@end
