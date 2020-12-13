//
//  ViewController.m
//  JobsBitsMonitor
//
//  Created by Jobs on 2020/12/13.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong)UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    JobsBitsMonitorCore.sharedInstance.bitsMonitorRunMode = BitsMonitorManualRun;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [JobsBitsMonitorCore.sharedInstance stop];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [JobsBitsMonitorCore.sharedInstance pause];
}

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

@end
