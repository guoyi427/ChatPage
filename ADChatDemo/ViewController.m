//
//  ViewController.m
//  ADChatDemo
//
//  Created by guoyi on 16/5/4.
//  Copyright © 2016年 帅毅. All rights reserved.
//

#import "ViewController.h"

#import "SocketManager.h"
#import "ADChatMessageViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[SocketManager sharedInstance] connectHost];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 50, 50);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(sendMessageButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sendMessageButtonAction {
    ADChatMessageViewController *messageVC = [[ADChatMessageViewController alloc] init];
    [self presentViewController:messageVC animated:YES completion:nil];
}

@end
