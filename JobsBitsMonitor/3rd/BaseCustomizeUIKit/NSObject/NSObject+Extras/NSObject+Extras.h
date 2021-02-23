//
//  NSObject+Extras.h
//  TestDemo
//
//  Created by AaltoChen on 15/10/31.
//  Copyright © 2015年 AaltoChen. All rights reserved.
//

#import <Foundation/Foundation.h>

#if __has_include(<WHToast/WHToast.h>)
#import <WHToast/WHToast.h>
#else
#import "WHToast.h"
#endif

#if __has_include(<GKPhotoBrowser/GKPhotoBrowser.h>)
#import <GKPhotoBrowser/GKPhotoBrowser.h>
#else
#import "GKPhotoBrowser.h"
#endif

//#if __has_include(<YYImage/YYImage.h>)
//#import <YYImage/YYImage.h>
//#else
//#import "YYImage.h"
//#endif
//
//#if __has_include(<SDWebImage/SDWebImage.h>)
//#import <SDWebImage/SDWebImage.h>
//#else
//#import "SDWebImage.h"
//#endif
/**
 @param weakSelf 方便使用，用来打破循环引用。使用时需要改成实际类型，否则没有代码提示.
 @param arg 事件默认传递的对象，比如`NSNotification`，`UIButton`。
 */
typedef void (^callback)(id _Nullable weakSelf, id _Nullable arg);

@interface NSObject (Extras)
///震动特效反馈
+(void)feedbackGenerator;
/*
 * 检测用户是否锁屏：根据屏幕光线来进行判定，而不是系统通知
 * 作用范围:在sceneDidEnterBackground（iOS 13及其以上版本有效） && applicationDidEnterBackground（iOS 13以下版本有效）
 * 调试是否进入后台，要断开于Xcode的连接，否则屏幕常亮
 */
+(BOOL)didUserPressLockButton;
/// iOS 限制自动锁屏 lockSwitch:YES(关闭自动锁屏)
+(void)autoLockedScreen:(BOOL)lockSwitch;
/// 打印请求体
+(void)printRequestMessage:(NSURLSessionDataTask *_Nullable)task;
/// 保存图片
+(void)savePic:(GKPhotoBrowser *_Nullable)browser;
/// 获取当前 UIViewController
+(UIViewController *_Nonnull)getCurrentViewController;
/// 用block来代替selector
SEL _Nullable selectorBlocks(callback _Nonnull ,id _Nullable target);
/// 获取当前设备可用内存
+(double)availableMemory;
/// 获取当前任务所占用内存
+(double)usedMemory;

@end
