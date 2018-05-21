//
//  CWNetWorkHeaderParam.h
//  ColorfulWoodNetWork
//
//  Created by 大新 on 2018/5/16.
//  Copyright © 2018年 ColorfulWood. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWNetWorkHeaderParam : NSObject
/**
 * 参数的名称
 */
@property(nonatomic, strong)NSString *m_name;

/**
 * 参数的值
 */
@property(nonatomic, strong)NSString *m_value;

- (instancetype)initWithName:(NSString*)name value:(NSString*)value;
@end
