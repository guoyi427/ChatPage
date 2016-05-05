//
//  ADChatModel.h
//  ADChatDemo
//
//  Created by guoyi on 16/5/4.
//  Copyright © 2016年 帅毅. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    ADChatModelCellType_Send = 1,
    ADChatModelCellType_Receive,
    ADChatModelCellType_Time,
} ADChatModelCellType;

typedef enum : NSUInteger {
    ADChatModelMessageType_Text = 1,
    ADChatModelMessageType_Picture,
    ADChatModelMessageType_Audio,
} ADChatModelMessageType;

@interface ADChatModel : NSObject

@property (nonatomic, strong) NSString *content;
/// 文字 图片 语音
@property (nonatomic, assign) NSInteger messageType;
/// 发送方 接收方 时间
@property (nonatomic, assign) ADChatModelCellType cellType;
@property (nonatomic, assign) ADChatModelMessageType createTime;

@end
