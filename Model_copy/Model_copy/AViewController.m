//
//  AViewController.m
//  Model_copy
//
//  Created by sve on 2018/7/5.
//  Copyright © 2018年 sve. All rights reserved.
//

#import "AViewController.h"
#import "BViewController.h"
#import "Person.h"

@interface AViewController ()
@property (nonatomic, strong) Person *person;
@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"A控制器";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.person = [[Person alloc] init];
    self.person.name = @"张三";
    Dog *dog = [[Dog alloc] init];
    dog.age = 10;
    self.person.dog = dog;
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"push之前%@的狗%zd岁了",self.person.name, self.person.dog.age);
    
    BViewController *bvc = [[BViewController alloc] initWithPerson:self.person];
    [self.navigationController pushViewController:bvc animated:YES];
}

-(void)viewWillAppear:(BOOL)animated {
    NSLog(@"viewAppear:%@的狗%zd岁了",self.person.name, self.person.dog.age);
}

@end
