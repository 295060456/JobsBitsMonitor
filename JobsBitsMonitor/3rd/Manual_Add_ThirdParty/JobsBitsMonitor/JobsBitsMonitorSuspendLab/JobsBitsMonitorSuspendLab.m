//
//  JobsBitsMonitorSuspendLab.m
//  JobsBitsMonitor
//
//  Created by Jobs on 2020/12/13.
//

#import "JobsBitsMonitorSuspendLab.h"

@interface JobsBitsMonitorSuspendLab ()

@end

@implementation JobsBitsMonitorSuspendLab

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(instancetype)init{
    if (self = [super init]) {
//        [[NSNotificationCenter defaultCenter] addObserver:self
//                                                 selector:@selector(download:)
//                                                     name:GSDownloadNetworkSpeedNotificationKey
//                                                   object:nil];
//        [[NSNotificationCenter defaultCenter] addObserver:self
//                                                 selector:@selector(upload:)
//                                                     name:GSUploadNetworkSpeedNotificationKey
//                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(uploadAndDownload:)
                                                     name:GSUploadAndDownloadNetworkSpeedNotificationKey
                                                   object:nil];
        {// A
            self.userInteractionEnabled = YES;
            self.target = self;
            self.tapGRSEL = NSStringFromSelector(@selector(showMenu));
            self.numberOfTouchesRequired = 1;
            self.numberOfTapsRequired = 1;
            self.tapGR.enabled = YES;
        }
    }return self;
}

//-(void)download:(NSNotification *)noti{
//    noti.object;
//
//}
//
//-(void)upload:(NSNotification *)noti{
//    noti.object;
//}

-(void)uploadAndDownload:(NSNotification *)noti{
    NSLog(@"%@",noti.object);
    self.text = noti.object;
    [self sizeToFit];
    [self adjustsFontSizeToFitWidth];
    self.height = 30;
}

-(void)showMenu{
    ZWPullMenuView *menuView = [ZWPullMenuView pullMenuAnchorView:self
                                                       titleArray:@[@"2019年02月",
                                                                    @"2019年01月",
                                                                    @"2018年12月",
                                                                    @"2018年11月"]];
    menuView.blockSelectedMenu = ^(NSInteger menuRow) {
        NSLog(@"action----->%ld",(long)menuRow);
    };
}

@end
