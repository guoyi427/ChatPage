//
//  ADChatKeyboardToolView.m
//  ADChatDemo
//
//  Created by guoyi on 16/5/5.
//  Copyright © 2016年 帅毅. All rights reserved.
//

#import "ADChatKeyboardToolView.h"

#import "Masonry.h"
#import "ADChatMediaKeyboardView.h"

@interface ADChatKeyboardToolView () <UITextFieldDelegate>
{
    UIButton *_moreButton;
    ADChatMediaKeyboardView *_mediaView;
    UITextField *_textField;
}
@end

@implementation ADChatKeyboardToolView

+ (instancetype)toolView {
    ADChatKeyboardToolView *view = [[ADChatKeyboardToolView alloc]
                                    initWithFrame:CGRectMake(0,
                                                             [UIScreen mainScreen].bounds.size.height -
                                                             Height_ToolBar,
                                                             [UIScreen mainScreen].bounds.size.width,
                                                             Height_ToolBar)];
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        UIButton *recorderButton = [UIButton buttonWithType:UIButtonTypeCustom];
        recorderButton.backgroundColor = [UIColor redColor];
        [recorderButton addTarget:self action:@selector(recorderButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:recorderButton];
        
        _textField = [[UITextField alloc] init];
        _textField.delegate = self;
        [self addSubview:_textField];
        
        _moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_moreButton setImage:[UIImage imageNamed:@"keyboard_1"] forState:UIControlStateNormal];
        [_moreButton setImage:[UIImage imageNamed:@"keyboard_2"] forState:UIControlStateSelected];
        [_moreButton addTarget:self
                       action:@selector(moreButtonAction)
             forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_moreButton];
        
        /// 自动布局
        __weak ADChatKeyboardToolView *weakSelf = self;
        [recorderButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf).offset(10);
            make.centerY.equalTo(weakSelf);
            make.size.mas_equalTo(CGSizeMake(Height_ToolBar, Height_ToolBar));
        }];
        
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(recorderButton.mas_right).offset(10);
            make.right.equalTo(_moreButton.mas_left).offset(-10);
            make.centerY.equalTo(weakSelf);
            make.height.equalTo(weakSelf).offset(-10);
        }];
        
        [_moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(weakSelf).offset(-10);
            make.centerY.equalTo(weakSelf);
            make.size.mas_equalTo(CGSizeMake(Height_ToolBar, Height_ToolBar));
        }];
        
        //  通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrameNotification:) name:UIKeyboardWillChangeFrameNotification object:nil];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    if (_mediaView) {
        [_mediaView removeFromSuperview];
    }
}

#pragma mark - Public - Metods

- (void)hideKeyboard {
    [_textField resignFirstResponder];
    if (_mediaView) {
        [_mediaView removeFromSuperview];
    }
    
    CGRect rect = self.frame;
    rect.origin.y = CGRectGetHeight(self.superview.frame) - Height_ToolBar;
    self.frame = rect;
}

#pragma mark - Button - Action

- (void)recorderButtonAction {
 
}

- (void)moreButtonAction {
    _moreButton.selected = !_moreButton.selected;
    if (_moreButton.selected) {
        //  显示媒体键盘 隐藏文字键盘
        [_textField resignFirstResponder];
        if (!_mediaView) {
            _mediaView = [ADChatMediaKeyboardView mediaView];
            [self.superview addSubview:_mediaView];
        }
        [_mediaView show];
        
        //  更新 toolView的frame
        CGRect rect = self.frame;
        rect.origin.y = [UIScreen mainScreen].bounds.size.height  - Height_MediaView - Height_ToolBar;
        self.frame = rect;
    } else {
        //  显示文字键盘 隐藏媒体键盘
        [_textField becomeFirstResponder];
        if (_mediaView) {
            [_mediaView removeFromSuperview];
            _mediaView = nil;
        }
    }
}

#pragma mark - TextField - Delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    _moreButton.selected = NO;
    [_mediaView removeFromSuperview];
    _mediaView = nil;
}

#pragma mark - Notification

- (void)keyboardWillChangeFrameNotification:(NSNotification *)notification {
    CGFloat y = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].origin.y;
    
    CGRect rect = self.frame;
    rect.origin.y = y - Height_ToolBar;
    
    self.frame = rect;
}

@end
