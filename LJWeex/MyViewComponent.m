//
//  MyViewComponent.m
//  LJWeex
//
//  Created by imac on 2017/2/27.
//  Copyright © 2017年 imac. All rights reserved.
//

#import "MyViewComponent.h"

@interface MyViewComponent ()

@end

@implementation MyViewComponent

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _instance = [[WXSDKInstance alloc] init];
    _instance.viewController = self;
    _instance.frame = self.view.frame;
    __weak typeof(self) weakSelf = self;
    _instance.onCreate = ^(UIView *view) {
        [weakSelf.weexView removeFromSuperview];
        [weakSelf.view addSubview:weakSelf.weexView];
    };
    _instance.onFailed = ^(NSError *error) {
        //process failure
    };
    _instance.renderFinish = ^ (UIView *view) {
        //process renderFinish
    };
    [_instance renderWithURL:self.url options:@{@"bundleUrl":[self.url absoluteString]} data:nil];
    
}

- (void)dealloc
{
    [_instance destroyInstance];
}


@end
