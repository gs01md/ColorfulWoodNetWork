//
//  CWSystem.h
//  ColorfulWoodSystem
//
//  Created by 大新 on 2018/5/17.
//  Copyright © 2018年 ColorfulWood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWSystemInfo.h"

@interface CWSystem : NSObject

/**
 * 获取手机信息
 */
+ (CWSystemInfo *)interface_systemInfo;

#pragma mark - 单个功能
/**
 * 获取手机类型
 */
+ (NSString *)interface_iphoneType;

/**
 * 获取app版本号
 */
+ (NSString*)interface_appVersion;

/**
 * 获取设备UUID
 * 通用唯一标识符,UUID是指在一台机器上生成的数字，它保证对在同一时空中的所有机器都是唯一的
 */
+ (NSString*)interface_iphoneUUID;

/**
 * 获取系统版本号
 */
+ (NSString*)interface_iphoneSystemVersion;

/**
 * 获取设备名称
 */
+ (NSString*)interface_iphoneName;
@end
