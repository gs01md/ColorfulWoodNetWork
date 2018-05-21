//
//  CWSystemInfo.h
//  ColorfulWoodSystem
//
//  Created by 大新 on 2018/5/17.
//  Copyright © 2018年 ColorfulWood. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWSystemInfo : NSObject

/**
 * iphone名称
 */
@property(nonatomic, strong)NSString* m_iphoneName;

/**
 * iphone设备类型
 */
@property(nonatomic, strong)NSString* m_iphoneType;

/**
 * iphone设备UUID
 */
@property(nonatomic, strong)NSString* m_iphoneUUID;

/**
 * iphone系统版本
 */
@property(nonatomic, strong)NSString* m_iphoneSystemVersion;

/**
 * 程序版本
 */
@property(nonatomic, strong)NSString* m_appVersion;
@end
