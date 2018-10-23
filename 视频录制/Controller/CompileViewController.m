//
//  CompileViewController.m
//  视频录制
//
//  Created by mac on 23/10/2018.
//  Copyright © 2018 Woodsoo. All rights reserved.
//

#import "CompileViewController.h"

@interface CompileViewController ()

@end

@implementation CompileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *titleLable = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:titleLable];
    titleLable.text =@"编辑页面";
    titleLable.font = [UIFont systemFontOfSize:15];

}



@end
