//
//  ADChatMediaKeyboardView.m
//  ADChatDemo
//
//  Created by guoyi on 16/5/9.
//  Copyright © 2016年 帅毅. All rights reserved.
//

#import "ADChatMediaKeyboardView.h"

static CGFloat Size_Button = 80;
//static CGFloat Height_MediaView = 100;

@implementation ADChatMediaKeyboardView

+ (instancetype)mediaView {
    ADChatMediaKeyboardView *view = [[ADChatMediaKeyboardView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 100)];
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIButton *pictureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        pictureButton.frame = CGRectMake(10, 10, Size_Button, Size_Button);
        [pictureButton setImage:[UIImage imageNamed:@"keyboard_1"] forState:UIControlStateNormal];
        [pictureButton addTarget:self action:@selector(pictureButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:pictureButton];
        
        UIButton *cameraButton = [UIButton buttonWithType:UIButtonTypeCustom];
        cameraButton.frame = CGRectMake(20 + Size_Button, 10, Size_Button, Size_Button);
        [cameraButton setImage:[UIImage imageNamed:@"keyboard_1"] forState:UIControlStateNormal];
        [cameraButton addTarget:self action:@selector(cameraButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cameraButton];
        
    }
    return self;
}

#pragma mark - Public - Methods

- (void)show {
    self.frame = CGRectMake(0, CGRectGetHeight(self.superview.frame) - Height_MediaView, [UIScreen mainScreen].bounds.size.width, Height_MediaView);
}

#pragma mark - Button - Action

- (void)pictureButtonAction {
    
}

- (void)cameraButtonAction {
    
}

@end
