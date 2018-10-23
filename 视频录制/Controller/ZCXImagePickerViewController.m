//
//  ZCXImagePickerViewController.m
//  视频录制
//
//  Created by mac on 23/10/2018.
//  Copyright © 2018 Woodsoo. All rights reserved.
//

#import "ZCXImagePickerViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <Photos/Photos.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "CompileViewController.h"

#define WS(weakSelf)        __weak __typeof(&*self)weakSelf = self;

@interface ZCXImagePickerViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@end

@implementation ZCXImagePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //1.判断相机是否可用 视频是否可用
    if (![self isCramaAvialable]) {
        UIAlertController *alert =  [UIAlertController alertControllerWithTitle:@"相机不可用" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    
    [self configPicker];

}

#pragma mark 自定义方法
//配置PickerController的资源类型/媒体类型等,闪光灯,录制时间,视频质量
-(void)configPicker{
    
    //设置资源类型
    [self setSourceType:UIImagePickerControllerSourceTypeCamera];
    if ([self isAvalableMediaType:kUTTypeMovie sourcType:UIImagePickerControllerSourceTypeCamera]) {
        //配置媒体类型
        [self setMediaTypes:@[(__bridge NSString *)kUTTypeMovie]];
        //配置视频质量
        [self setVideoQuality:UIImagePickerControllerQualityTypeHigh];
        //设置最大录制时间
//        [self setVideoMaximumDuration:10];
        //设置代理
        self.delegate = self;

    }else{
        UIAlertController *alert =  [UIAlertController alertControllerWithTitle:@"视频不可用" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    }

}

//判断相机是否可用
-(BOOL)isCramaAvialable{
    
    //相机是否可用
    return  [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
//    //后置相机是否可用
//    return   [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
//    //前置相机是否可用
//    return    [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
//    //后置闪光灯是否可用
//    return    [UIImagePickerController isFlashAvailableForCameraDevice:UIImagePickerControllerCameraDeviceRear];
//    //前置闪光灯是否可用
//    return   [UIImagePickerController isFlashAvailableForCameraDevice:UIImagePickerControllerCameraDeviceFront];
}

//判断指定资源类型下的媒体类型是否可用,这里的资源类型是指 相机还是图库等,媒体类型是指 是图片还是视频 视频选用movie 而不是video 请注意
-(BOOL)isAvalableMediaType:(CFStringRef)mediaType sourcType:(UIImagePickerControllerSourceType)soureType{
    NSArray *array =  [UIImagePickerController availableMediaTypesForSourceType:soureType];
    NSLog(@"%@",array);
    return [array containsObject:(__bridge NSString *)mediaType];
}

#pragma mark - UIImagePickerControllerDelegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{

    if ([info[UIImagePickerControllerMediaType] isEqualToString:(__bridge NSString *)kUTTypeMovie]) {
        NSURL *URL =  info[UIImagePickerControllerMediaURL];
        NSError *error;
        [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
            [PHAssetChangeRequest creationRequestForAssetFromVideoAtFileURL:URL];
            NSLog(@"%@",error);
        } error:&error];
    }
    
    CompileViewController *vc = [[CompileViewController alloc]init];
    [self presentViewController:vc animated:YES completion:^{
        
    }];

}



@end
