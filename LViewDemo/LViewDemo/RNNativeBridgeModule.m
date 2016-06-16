//
//  RNNativeBridgeModule.m
//  LViewDemo
//
//  Created by 黄成 on 16/6/14.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "RNNativeBridgeModule.h"
#import "RCTBridge.h"
#import "RCTEventDispatcher.h"

@implementation RNNativeBridgeModule

RCT_EXPORT_MODULE()

@synthesize bridge = _bridge;

RCT_EXPORT_METHOD(AddEvent:(NSDictionary *)dictionary)
{
    NSLog(@"接收到RN传过来的数据为:%@",dictionary);
    // Date is ready to use!
}

RCT_EXPORT_METHOD(RNInvokeOCCallBack:(NSDictionary *)dictionary callback:(RCTResponseSenderBlock)callback){
    NSLog(@"接收到RN传过来的数据为:%@",dictionary);
    NSArray *events = [[NSArray alloc] initWithObjects:@"native",@"返回数据了", nil];
    callback(@[[NSNull null], events]);
}

RCT_EXPORT_METHOD(VCOpenRN:(NSDictionary *)dictionary){
    [self.bridge.eventDispatcher sendAppEventWithName:@"EventReminder" body:@{@"msg":@"native发送消息"}];
}
@end
