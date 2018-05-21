//
//  ViewController.m
//  TestNetWork
//
//  Created by 大新 on 2018/5/16.
//  Copyright © 2018年 ColorfulWood. All rights reserved.
//

#import "ViewController.h"
#import <ColorfulWoodNetWork/ColorfulWoodNetWork.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSDictionary * dic = @{@"1":@"1"};
    [[CWNetWorkRequest alloc] initAndRequestWithUrl:@"" type:CWNetWorkRequestType_Get params:dic delegate:self];

}

- (void)CWNetWorkRequestDelegate_success:(id)information{
    NSLog(@"%@",information);
}

- (void)CWNetWorkRequestDelegate_failure:(CWNetWorkError *)error{
    NSLog(@"%@",error.m_code);


}


@end
