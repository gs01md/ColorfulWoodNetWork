//
//  CWNetWorkHeaderParam.m
//  ColorfulWoodNetWork
//
//  Created by 大新 on 2018/5/16.
//  Copyright © 2018年 ColorfulWood. All rights reserved.
//

#import "CWNetWorkHeaderParam.h"

@implementation CWNetWorkHeaderParam

- (instancetype)initWithName:(NSString*)name value:(NSString*)value{

    if (self = [super init]) {
        self.m_name = name;
        self.m_value = value;
    }
    return self;
}

- (NSString *)m_name{

    if (!_m_name || _m_name.length < 1) {
        _m_name = @"appVersion";
    }

    return _m_name;
}

- (NSString *)m_value{

    if (!_m_value || _m_value.length < 1) {
        _m_value = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    }

    return _m_value;
}
@end
