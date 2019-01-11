//
//  CWNWModel.m
//  ColorfulWoodNetWork
//
//  Created by 大新 on 2018/12/27.
//  Copyright © 2018 ColorfulWood. All rights reserved.
//

#import "CWNetWorkModel.h"

@implementation CWNetWorkModel
/**
 * 返回数据是否有效
 * 判断mode是否为空，model.code是否为“0”
 */
+ (BOOL)interface_isValidate:(CWNetWorkModel*)model{

    if (model) {

        if (model.code && [model.code isEqualToString:@"0"]) {
            return TRUE;
        } else {
            return FALSE;
        }

    } else {
        return FALSE;
    }
}

- (NSString *)code{

    if (!_code) {
        _code = @"";
    }
    return _code;
}

- (NSString *)message{

    if (!_message) {
        _message = @"";
    }
    return _message;
}

@end
