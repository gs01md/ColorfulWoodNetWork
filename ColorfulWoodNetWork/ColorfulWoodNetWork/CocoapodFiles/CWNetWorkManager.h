//
//  CWNetWorkManager.h
//  ColorfulWoodNetWork
//
//  Created by 大新 on 2018/5/16.
//  Copyright © 2018年 ColorfulWood. All rights reserved.
//

#import "AFNetworking/AFNetworking.h"
#import "CWNetWorkHeaderParam.h"
#import "CWNetWorkError.h"
#import "CWNetWorkDefine.h"

@interface CWNetWorkManager : AFHTTPSessionManager

+ (instancetype)sharedManager;

- (void)interface_changeParams:(NSMutableArray<CWNetWorkHeaderParam*>*)array;

- (void)interface_setParam:(NSString *)param value:(NSString*)vl;
@end
