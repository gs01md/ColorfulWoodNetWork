//
//  CWNetConfig.m
//  ColorfulWoodNetWork
//  配置参数
//  Created by gao on 2020/11/4.
//  Copyright © 2020 ColorfulWood. All rights reserved.
//

#import "CWNetConfig.h"

@implementation CWNetConfig

static CWNetConfig *_instance;

+ (instancetype)sharedManager {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        _instance = [[CWNetConfig alloc] new];
        
    });

    return _instance;
}

- (NSString *)m_code{

    if (!_m_code || _m_code.length < 1) {
        _m_code = @"0";
    }

    return _m_code;
}
@end
