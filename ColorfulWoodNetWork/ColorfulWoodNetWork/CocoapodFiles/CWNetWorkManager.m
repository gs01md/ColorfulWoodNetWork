//
//  CWNetWorkManager.m
//  ColorfulWoodNetWork
//
//  Created by 大新 on 2018/5/16.
//  Copyright © 2018年 ColorfulWood. All rights reserved.
//

#import "CWNetWorkManager.h"
#import <Foundation/Foundation.h>
#import "CWNetWorkHeaderParams.h"
#import <ColorfulWoodTools/ColorfulWoodCheckArray.h>
#import "AFNetworkReachabilityManager.h"

@interface CWNetWorkManager()

@end

@implementation CWNetWorkManager

static CWNetWorkManager *_instance;

+ (instancetype)sharedManager {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        _instance = [[CWNetWorkManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        _instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/json", @"application/json",  @"text/javascript", @"application/javascript", @"text/plain",  @"text/html", nil];
        _instance.requestSerializer.timeoutInterval = 8.;

        //处理后台数据返回
        _instance.requestSerializer = [AFJSONRequestSerializer serializer];
        _instance.responseSerializer = [AFJSONResponseSerializer serializer];

        [_instance interface_changeParams: [CWNetWorkHeaderParams interface_createDefaultParamArray]];

        /**
         * 检测网络状态
         */
        [[AFNetworkReachabilityManager sharedManager] startMonitoring];
        
    });

    return _instance;
}

/**
 * 更改或者设置请求参数
 */
- (void)interface_changeParams:(NSMutableArray<CWNetWorkHeaderParam *>*)array{

    if ([ColorfulWoodCheckArray interface_checkArray:array]) {

        for (CWNetWorkHeaderParam * param in array) {

            if ([param isMemberOfClass:[CWNetWorkHeaderParam class]]) {

                [_instance.requestSerializer setValue:param.m_value forHTTPHeaderField:param.m_name];

            }
        }
    }

}

- (void)interface_setParam:(NSString *)param value:(NSString*)vl{

    if (param && param.length >0 && vl) {
        [_instance.requestSerializer setValue:param forHTTPHeaderField:vl];
    }

}

@end
