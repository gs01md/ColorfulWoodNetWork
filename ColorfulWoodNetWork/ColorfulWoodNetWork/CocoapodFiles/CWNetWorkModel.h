//
//  CWNWModel.h
//  ColorfulWoodNetWork
//
//  Created by 大新 on 2018/12/27.
//  Copyright © 2018 ColorfulWood. All rights reserved.
//

#import "JSONModel/JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CWNetWorkModel : JSONModel
/**
 * 返回成功与否标识：0为成功
 */
@property(nonatomic, copy) NSString <Optional> * code;

/**
 * 返回提示信息
 */
@property(nonatomic, copy) NSString <Optional> * message;

/**
 * 返回数据是否有效
 * 判断mode是否为空，model.code是否为“0”
 */
+ (BOOL)interface_isValidate:(CWNetWorkModel*)model;
@end

NS_ASSUME_NONNULL_END
