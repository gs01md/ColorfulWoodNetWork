//
//  CWSystemInfo.m
//  ColorfulWoodSystem
//
//  Created by 大新 on 2018/5/17.
//  Copyright © 2018年 ColorfulWood. All rights reserved.
//

#import "CWSystemInfo.h"

@implementation CWSystemInfo
/**
 * iphone名称
 */
- (NSString*)m_iphoneName{
    if (!_m_iphoneName) {
        _m_iphoneName = @"need to find";
    }
    return _m_iphoneName;
}

/**
 * iphone设备类型
 */
- (NSString*)m_iphoneType{
    if (!_m_iphoneType) {
        _m_iphoneType = @"need to find";
    }
    return _m_iphoneType;
}

/**
 * iphone设备 UUID
 */
- (NSString*)m_iphoneUUID{
    if (!_m_iphoneUUID) {
        _m_iphoneUUID = @"need to find";
    }
    return _m_iphoneUUID;
}

/**
 * 程序版本
 */
- (NSString*)m_appVersion{
    if (!_m_appVersion) {
        _m_appVersion = @"need to find";
    }
    return _m_appVersion;
}

/**
 * iphone系统版本
 */
- (NSString*)m_iphoneSystemVersion{
    if (!_m_iphoneSystemVersion) {
        _m_iphoneSystemVersion = @"need to find";
    }
    return _m_iphoneSystemVersion;
}


@end
