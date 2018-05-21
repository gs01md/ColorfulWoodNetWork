//
//  CWNetWorkHeaderParams.h
//  ColorfulWoodNetWork
//  用户设置网络请求的公共头参数
//  Created by 大新 on 2018/5/16.
//  Copyright © 2018年 ColorfulWood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWNetWorkHeaderParam.h"

@interface CWNetWorkHeaderParams : NSObject

+ (NSMutableArray<CWNetWorkHeaderParam*>*)interface_createDefaultParamArray;

@end
