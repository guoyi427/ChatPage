//
//  SocketManager.m
//  ADChatDemo
//
//  Created by guoyi on 16/5/4.
//  Copyright © 2016年 帅毅. All rights reserved.
//

#import "SocketManager.h"

#import "AsyncSocket.h"

#import <sys/socket.h>
#import <netinet/in.h>
#import <arpa/inet.h>
#import <unistd.h>

@interface SocketManager () <AsyncSocketDelegate>
{
    AsyncSocket *_socket;
}

@end

@implementation SocketManager

+ (instancetype)sharedInstance {
    static SocketManager *m_socket = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        m_socket = [[self alloc] init];
    });
    return m_socket;
}

- (void)connectHost {
    _socket = [[AsyncSocket alloc] initWithDelegate:self];
    NSError *error = nil;
    [_socket connectToHost:@"192.168.1.106" onPort:9090 withTimeout:10 error:&error];
    
}

- (void)sendMessage:(NSString *)message {
    
    NSData *data = [message dataUsingEncoding:NSUTF8StringEncoding];
    
    [_socket writeData:data withTimeout:5 tag:1];
}

#pragma  mark - AsyncSocket - Delegate

- (void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port {
    NSLog(@"connect is ok");
    
}

- (void)onSocketDidDisconnect:(AsyncSocket *)sock {
    
}

- (void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag {
    
}

- (void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag {
    
}


@end
