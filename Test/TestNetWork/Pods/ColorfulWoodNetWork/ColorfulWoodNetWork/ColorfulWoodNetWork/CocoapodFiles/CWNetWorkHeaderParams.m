//
//  CWNetWorkHeaderParams.m
//  ColorfulWoodNetWork
//
//  Created by 大新 on 2018/5/16.
//  Copyright © 2018年 ColorfulWood. All rights reserved.
//

#import "CWNetWorkHeaderParams.h"
#import <ColorfulWoodSystem/ColorfulWoodSystem.h>

@implementation CWNetWorkHeaderParams

+ (NSMutableArray<CWNetWorkHeaderParam*>*)interface_createDefaultParamArray{

    NSMutableArray<CWNetWorkHeaderParam*> *array = [NSMutableArray<CWNetWorkHeaderParam*> new];

    CWSystemInfo * sys = [CWSystem interface_systemInfo];

    //app 版本
    [array addObject:[[CWNetWorkHeaderParam alloc] initWithName:@"appVersion" value:sys.m_appVersion]];

    //苹果：1，安卓：2
    [array addObject:[[CWNetWorkHeaderParam alloc] initWithName:@"appType" value:@"1"]];

    //设备型号: e.g.: iphone 8
    [array addObject:[[CWNetWorkHeaderParam alloc] initWithName:@"deviceType" value:sys.m_iphoneType]];

    //设备自定义名称
    [array addObject:[[CWNetWorkHeaderParam alloc] initWithName:@"deviceName" value:sys.m_iphoneName]];

    //系统版本：e.g.:11.3
    [array addObject:[[CWNetWorkHeaderParam alloc] initWithName:@"OSVersion" value:sys.m_iphoneSystemVersion]];

    //UUID : 通用唯一识别码
    [array addObject:[[CWNetWorkHeaderParam alloc] initWithName:@"deviceImei" value:sys.m_iphoneUUID]];

    return array;
}

@end
