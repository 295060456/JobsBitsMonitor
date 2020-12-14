//
//  ViewController.m
//  JobsBitsMonitor
//
//  Created by Jobs on 2020/12/13.
//

#import "ViewController.h"
#import "JobsBitsMonitorSuspendLab.h"

@interface ViewController ()

@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)JobsBitsMonitorSuspendLab *bitsMonitorSuspendLab;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.alpha = 1;
    self.bitsMonitorSuspendLab.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    JobsBitsMonitorCore.sharedInstance.bitsMonitorRunMode = BitsMonitorManualRun;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [JobsBitsMonitorCore.sharedInstance stop];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    NSLog(@"timerCurrentStatus = %lu",(unsigned long)JobsBitsMonitorCore.sharedInstance.nsTimerManager.timerCurrentStatus);
    if (JobsBitsMonitorCore.sharedInstance.nsTimerManager.timerCurrentStatus == NSTimerCurrentStatusRun) {
        [JobsBitsMonitorCore.sharedInstance pause];
        return;
    }
    
    if (JobsBitsMonitorCore.sharedInstance.nsTimerManager.timerCurrentStatus == NSTimerCurrentStatusPause) {
        [JobsBitsMonitorCore.sharedInstance continues];
        return;
    }
    
    if (JobsBitsMonitorCore.sharedInstance.nsTimerManager.timerCurrentStatus == NSTimerCurrentStatusStop) {
        [JobsBitsMonitorCore.sharedInstance start];
        return;
    }
}
#pragma mark —— lazyLoad
-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = UIImageView.new;
        NSString *path = @"http://img.3355.cf/uploads/default/201903/04/default201903041857218539.jpg";
        [_imageView sd_setImageWithURL:[NSURL URLWithString:path]];
        [self.view addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(100, 100));
            make.top.left.equalTo(self.view).offset(200);
        }];
    }return _imageView;
}

-(JobsBitsMonitorSuspendLab *)bitsMonitorSuspendLab{
    if (!_bitsMonitorSuspendLab) {
        _bitsMonitorSuspendLab = JobsBitsMonitorSuspendLab.new;
        _bitsMonitorSuspendLab.font = [UIFont systemFontOfSize:10 weight:UIFontWeightBold];
        _bitsMonitorSuspendLab.backgroundColor = KLightGrayColor;
        _bitsMonitorSuspendLab.textColor = kRedColor;
        @weakify(self)
        _bitsMonitorSuspendLab.vc = self_weak_;
        _bitsMonitorSuspendLab.isAllowDrag = YES;//悬浮效果必须要的参数
        [self.view addSubview:_bitsMonitorSuspendLab];
        _bitsMonitorSuspendLab.frame = CGRectMake(20,
                                                  SCREEN_HEIGHT - 200,
                                                  100,
                                                  50);
    }return _bitsMonitorSuspendLab;
}

@end
