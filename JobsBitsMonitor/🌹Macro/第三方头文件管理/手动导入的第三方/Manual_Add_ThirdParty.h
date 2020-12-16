//
//  Manual_Add_ThirdParty.h
//  JobsBitsMonitor
//
//  Created by Jobs on 2020/12/13.
//

#ifndef Manual_Add_ThirdParty_h
#define Manual_Add_ThirdParty_h

#pragma mark ======================================== 本地化字符串 ========================================
/** NSLocalizedString宏做的其实就是在当前bundle中查找资源文件名“Localizable.strings”(参数:键＋注释) */
#define LocalString(x, ...)     NSLocalizedString(x, nil)
#define StringFormat(format,...) [NSString stringWithFormat:format, ##__VA_ARGS__]
#pragma mark ======================================== UserDefault ========================================
#define SetUserDefaultKeyWithValue(key,value) [[NSUserDefaults standardUserDefaults] setValue:value forKey:key]
#define SetUserDefaultKeyWithObject(key,object) [[NSUserDefaults standardUserDefaults] setObject:object forKey:key]
#define SetUserBoolKeyWithObject(key,object) [[NSUserDefaults standardUserDefaults] setBool:object forKey:key]
#define GetUserDefaultValueForKey(key) [[NSUserDefaults standardUserDefaults] valueForKey:key]
#define GetUserDefaultObjForKey(key) [[NSUserDefaults standardUserDefaults] objectForKey:key]
#define GetUserDefaultBoolForKey(key) [[NSUserDefaults standardUserDefaults] boolForKey:key]
#define DeleUserDefaultWithKey(key) [[NSUserDefaults standardUserDefaults] removeObjectForKey:key]
#define UserDefaultSynchronize  [[NSUserDefaults standardUserDefaults] synchronize]
#pragma mark ======================================== 常见颜色 ========================================
#define kClearColor     [UIColor clearColor]
#define kBlackColor     [UIColor blackColor]
#define kBlueColor      [UIColor blueColor]
#define kWhiteColor     [UIColor whiteColor]
#define kCyanColor      [UIColor cyanColor]
#define kGrayColor      [UIColor grayColor]
#define kOrangeColor    [UIColor orangeColor]
#define kRedColor       [UIColor redColor]
#define KBrownColor     [UIColor brownColor]
#define KDarkGrayColor  [UIColor darkGrayColor]
#define KDarkTextColor  [UIColor darkTextColor]
#define KYellowColor    [UIColor yellowColor]
#define KPurpleColor    [UIColor purpleColor]
#define KLightTextColor [UIColor lightTextColor]
#define KLightGrayColor [UIColor lightGrayColor]
#define KGreenColor     [UIColor greenColor]
#define KMagentaColor   [UIColor magentaColor]
#pragma mark ======================================== 屏幕大小、宽、高 ========================================
#ifndef SCREEN_BOUNDS
#define SCREEN_BOUNDS [UIScreen mainScreen].bounds
#endif
#ifndef SCREEN_WIDTH
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#endif
#ifndef SCREEN_HEIGHT
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#endif

#import "AABlock.h"
#import "NotificationManager.h"
// UIView
#import "UIView+Extras.h"
#import "UIView+Chain.h"
#import "UIView+SuspendView.h"
#import "UIView+Measure.h"
#import "UIView+Animation.h"
#import "UIView+Gradient.h"
// NSString
#import "NSString+Extras.h"
// NSObject
#import "NSObject+Time.h"

#import "TimerManager.h"
#import "JobsBitsMonitorCore.h"

#import "SuspendBtn.h"
#import "SuspendLab.h"
#import "SuspendView.h"


#endif /* Manual_Add_ThirdParty_h */
