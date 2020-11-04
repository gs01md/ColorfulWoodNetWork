//
//  CWNetConfig.h
//  ColorfulWoodNetWork
//
//  Created by gao on 2020/11/4.
//  Copyright © 2020 ColorfulWood. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CWNetConfig : NSObject

/**
 * 参数 网络返回码正确时的数值
 */
@property(nonatomic, strong)NSString *m_code;

+ (instancetype)sharedManager;
@end

NS_ASSUME_NONNULL_END
