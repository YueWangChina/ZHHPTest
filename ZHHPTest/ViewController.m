//
//  ViewController.m
//  ZHHPTest
//
//  Created by wang on 17/7/11.
//  Copyright © 2017年 BJZhongHeHuangPU. All rights reserved.
//

#import "ViewController.h"
#import "ZHHPCautionAlert.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)click:(id)sender {
    
    [ZHHPCautionAlert zh_showMessage:@"提示文字很好不错啊~" WithImage:[UIImage imageNamed:@"common_icon_alipay"]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
