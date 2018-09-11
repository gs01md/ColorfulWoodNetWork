//
//  CWNetWorkCheck.h
//  ColorfulWoodNetWork
//
//  负责检测返回内容等有效性
//
//  Created by 大新 on 2018/5/18.
//  Copyright © 2018年 ColorfulWood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWNetWorkError.h"

@interface CWNetWorkCheck : NSObject
/**
 * 从返回的字典里，获取错误的code 和 message
 */
+ (CWNetWorkError*)interface_error:(id)responseObject;

/**
 * 从NSError中，获取错误的code 和 message
 */
+ (CWNetWorkError*)interface_NSError:(NSError*)nsError;

/**
 * 返回的结果是否是有效，是否包含code 、 message 和 content
 */
+ (BOOL)interface_check:(id)responseObject;


/**
 * 返回的结果是否是有效，是否包含code，code是否为“0”
 * codeRight: 正确的code值
 */
+ (BOOL)interface_check:(id)responseObject codeRight:(NSString*)codeRight;
@end
