//
//  DemoBridgeModule.m
//  LViewDemo
//
//  Created by 黄成 on 16/6/14.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "DemoBridgeModule.h"
#import "RCTBridge.h"

@implementation DemoBridgeModule

RCT_EXPORT_MODULE()

@synthesize bridge = _bridge;

RCT_EXPORT_METHOD(AddEvent:(NSDictionary *)dictionary)
{
    NSLog(@"接收到RN传过来的数据为:%@",dictionary);
    // Date is ready to use!
}

RCT_EXPORT_METHOD(RNInvokeOCCallBack:(NSDictionary *)dictionary callback:(RCTResponseSenderBlock)callback){
    NSLog(@"接收到RN传过来的数据为:%@",dictionary);
    NSArray *events = [[NSArray alloc] initWithObjects:@"张三",@"李四", nil];
    callback(@[[NSNull null], events]);
}
@end
