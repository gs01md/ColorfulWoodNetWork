//
//  CWNetWorkError.h
//  ColorfulWoodNetWork
//
//  Created by 大新 on 2018/5/17.
//  Copyright © 2018年 ColorfulWood. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWNetWorkError : NSObject
/**
 * 错误码
 */
@property(nonatomic, strong)NSString *m_code;

/**
 * 错误信息
 */
@property(nonatomic, strong)NSString *m_message;

- (instancetype)initWithCode:(NSString*)code message:(NSString*)msg;
@end
