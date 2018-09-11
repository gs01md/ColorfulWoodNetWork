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

    NSDictionary * dic = @{@"id":@"12121"};
    [[CWNetWorkRequest alloc] initAndRequestWithUrl:@"https://www.nbastories.com/v1/test?update" type:CWNetWorkRequestType_Post params:dic delegate:self];

}

- (void)CWNetWorkRequestDelegate_success:(id)information{
    NSLog(@"%@",information);
}

- (void)CWNetWorkRequestDelegate_failure:(CWNetWorkError *)error{
    NSLog(@"%@",error.m_code);


}


@end
