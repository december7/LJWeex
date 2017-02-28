//
//  MyViewComponent.h
//  LJWeex
//
//  Created by imac on 2017/2/27.
//  Copyright © 2017年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WeexSDK/WeexSDK.h>

@interface MyViewComponent : UIViewController

@property (nonatomic, strong) WXSDKInstance *instance;
@property (nonatomic, strong) UIView *weexView;
@property (nonatomic, strong) NSURL *url;

@end
