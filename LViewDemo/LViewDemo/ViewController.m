//
//  ViewController.m
//  LViewDemo
//
//  Created by 黄成 on 16/5/30.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "ViewController.h"
//#import "LView.h"
#import "RCTRootView.h"
#import "RCTViewManager.h"
#import "RNNativeBridgeModule.h"

@interface ViewController ()

@property (nonatomic,strong) RCTRootView *rtView;

@end

@implementation ViewController

//RCT_EXPORT_VIEW_PROPERTY(onChange, RCTBubblingEventBlock)

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.rtView];
}
- (void)click:(id)sender{
    [self.rtView.bridge.eventDispatcher sendAppEventWithName:@"EventReminder" body:@{@"msg":@"native发送消息给react"}];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (RCTRootView *)rtView{
    if (_rtView == nil) {
//        NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.ios.bundle?platform=ios&dev=true"];
        NSURL *jsCodeLocation = [[NSBundle mainBundle] URLForResource:@"index.ios" withExtension:@"jsbundle"];
        RCTRootView *view = [[RCTRootView alloc]initWithBundleURL:jsCodeLocation moduleName:@"Model" initialProperties:nil launchOptions:nil];
        view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height );
        _rtView = view;
    }
    return _rtView;
}
@end
