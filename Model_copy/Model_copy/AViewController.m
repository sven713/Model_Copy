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
#import "UIAlertView+Block.h"

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
 
    
    [self runTimeUsage];
    
}

- (void)runTimeUsage {
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(30, 90, 200, 100)];
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:@"带Block回调的alertView" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(showAlert) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)showAlert {
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"alertView Block" message:@"带block的AlertView" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定",@"不知道",@"沙发沙发上",@"大发发多少",@"大发发答", nil];
    
    UIAlertView *alert = [[UIAlertView alloc] sv_initWithTitle:@"alertView Block" message:@"带block的AlertView" cancelButtonTitle:@"取消" otherButtonTitles:@[@"1111",@"2222",@"3333",@"4444",@"555"] actionBlock:^(UIAlertView * _Nullable alertView, NSInteger index) {
      
        NSLog(@"点击了第几个idx: %zd",index);
    }];
    
    [alert show];
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
