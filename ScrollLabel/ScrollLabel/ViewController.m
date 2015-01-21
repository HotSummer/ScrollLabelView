//
//  ViewController.m
//  ScrollLabel
//
//  Created by zbq on 15-1-21.
//  Copyright (c) 2015年 zbq. All rights reserved.
//

#import "ViewController.h"
#import "ScrollLabelView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ScrollLabelView *scrollView = [[ScrollLabelView alloc] initWithFrame:CGRectMake(100, 100, 200, 22)];
    scrollView.content = @"测试数据";
    [self.view addSubview:scrollView];
    [scrollView startAnimation];
    
    ScrollLabelView *scrollView1 = [[ScrollLabelView alloc] initWithFrame:CGRectMake(100, 200, 200, 22)];
    scrollView1.content = @"测试数据1测试数据2测试数据3测试数据4测试数据5";
    [self.view addSubview:scrollView1];
    [scrollView1 startAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
