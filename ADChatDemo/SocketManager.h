//
//  SocketManager.h
//  ADChatDemo
//
//  Created by guoyi on 16/5/4.
//  Copyright © 2016年 帅毅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SocketManager : NSObject

+ (instancetype)sharedInstance;

- (void)connectHost;

- (void)sendMessage:(NSString *)message;

@end
