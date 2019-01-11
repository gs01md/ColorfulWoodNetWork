//
//  ViewController.m
//  ColorfulWoodNetWork
//
//  Created by 大新 on 2018/5/16.
//  Copyright © 2018年 ColorfulWood. All rights reserved.
//

#import "ViewController.h"
#import "CWNetWorkRequest.h"

@interface ViewController ()<
CWNetWorkRequestDelegate
>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSDictionary * dic = @{@"1":@"1"};
    [[CWNetWorkRequest alloc] initAndRequestWithUrl:@"http://192.168.1.221:80/api/company/getIntroduction2Edit" type:CWNetWorkRequestType_Get params:dic delegate:self];

}

- (void)CWNetWorkRequestDelegate_success:(id)information{
    NSLog(@"%@",information);
}

- (void)CWNetWorkRequestDelegate_failure:(CWNetWorkError *)error{
    NSLog(@"%@",error.m_code);


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
