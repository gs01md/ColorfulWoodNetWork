//
//  CWNetWorkError.m
//  ColorfulWoodNetWork
//
//  Created by 大新 on 2018/5/17.
//  Copyright © 2018年 ColorfulWood. All rights reserved.
//

#import "CWNetWorkError.h"

@implementation CWNetWorkError

- (instancetype)initWithCode:(NSString*)code message:(NSString*)msg{

    if (self = [super init]) {
        self.m_code = code;
        self.m_message = msg;
    }

    return self;
}

/**
 * 错误码：-1代表未知错误
 */
- (NSString *)m_code{

    if (!_m_code || _m_code.length < 1) {
        _m_code = @"-1";
    }

    return _m_code;
}

- (NSString *)m_message{

    if (!_m_message || _m_message.length < 1) {
        _m_message = @"unknown error";
    }

    return _m_message;
}
@end
