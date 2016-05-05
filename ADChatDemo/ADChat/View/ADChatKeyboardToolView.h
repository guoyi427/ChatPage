//
//  ADChatKeyboardToolView.h
//  ADChatDemo
//
//  Created by guoyi on 16/5/5.
//  Copyright © 2016年 帅毅. All rights reserved.
//

#import <UIKit/UIKit.h>

static CGFloat Height_ToolBar = 50;

@interface ADChatKeyboardToolView : UIView

@property(nonatomic, strong) UITextField *textField;

+ (instancetype)toolView;

@end
