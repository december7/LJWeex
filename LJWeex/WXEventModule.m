//
//  WXEventModule.m
//  LJWeex
//
//  Created by imac on 2017/2/27.
//  Copyright © 2017年 imac. All rights reserved.
//

#import "WXEventModule.h"

@implementation WXEventModule

@synthesize weexInstance;
WX_EXPORT_METHOD(@selector(openURL:callback:))
- (void)openURL:(NSString *)url callback:(WXModuleCallback)callback
{
    NSString *newURL = url;
    if ([url hasPrefix:@"//"]) {
        newURL = [NSString stringWithFormat:@"http:%@", url];
    } else if (![url hasPrefix:@"http"]) {
        newURL = [NSURL URLWithString:url relativeToURL:weexInstance.scriptURL].absoluteString;
    }
    UIViewController *controller = [[WXDemoViewController alloc] init];
    ((WXDemoViewController *)controller).url = [NSURL URLWithString:newURL];
    [[weexInstance.viewController navigationController] pushViewController:controller animated:YES];
    callback(@{@"result":@"success"});
}

@end
