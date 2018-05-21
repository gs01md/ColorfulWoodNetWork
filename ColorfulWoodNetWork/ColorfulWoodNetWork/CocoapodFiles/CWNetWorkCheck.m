//
//  CWNetWorkCheck.m
//  ColorfulWoodNetWork
//
//  Created by 大新 on 2018/5/18.
//  Copyright © 2018年 ColorfulWood. All rights reserved.
//

#import "CWNetWorkCheck.h"

@implementation CWNetWorkCheck

/**
 * 从返回的字典里，获取错误的code 和 message
 */
+ (CWNetWorkError*)interface_error:(id)responseObject{

    CWNetWorkError * error = [CWNetWorkError new];

    if (responseObject) {

        if ([responseObject isKindOfClass:[NSDictionary class]] ||
            [responseObject isKindOfClass:[NSMutableDictionary class]]) {

            NSString* code = responseObject[@"code"];
            if (code && [code isKindOfClass:[NSString class]]) {
                error.m_code = code;
            }

            NSString* message = responseObject[@"message"];
            if (message && [message isKindOfClass:[NSString class]]) {
                error.m_message = message;
            }
        }
    }

    return error;
}

/**
 * 从NSError中，获取错误的code 和 message
 */
+ (CWNetWorkError*)interface_NSError:(NSError*)nsError{

    CWNetWorkError * error = [CWNetWorkError new];
    error.m_code = @"-1";

    if (nsError && nsError.domain && nsError.domain.length>0) {
        error.m_message = nsError.domain;
    }

    return error;
}

/**
 * 返回的结果是否是有效，是否包含code，code是否为“0”
 */
+ (BOOL)interface_check:(id)responseObject{

    BOOL valid = FALSE;

    if (responseObject) {

        if ([responseObject isKindOfClass:[NSDictionary class]] ||
            [responseObject isKindOfClass:[NSMutableDictionary class]]) {

            NSString* code = responseObject[@"code"];

            if (code && [code isKindOfClass:[NSString class]]
                ) {

                if ([code isEqual:@"0"]) {
                    valid = TRUE;
                }
            }
        }
    }

    return valid;
}




@end
