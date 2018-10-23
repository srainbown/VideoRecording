//
//  MainViewController.m
//  视频录制
//
//  Created by mac on 23/10/2018.
//  Copyright © 2018 Woodsoo. All rights reserved.
//

#import "MainViewController.h"
#import "ZCXImagePickerViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 100, 100)];
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor grayColor];
    [btn setTitle:@"开始录制" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)btnClick{
    
    ZCXImagePickerViewController *vc = [[ZCXImagePickerViewController alloc]init];
    
    [self presentViewController:vc animated:YES completion:^{
        
    }];
    
}





@end
