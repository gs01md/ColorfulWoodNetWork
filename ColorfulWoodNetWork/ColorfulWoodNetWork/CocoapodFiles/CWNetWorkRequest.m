//
//  CWNetWorkRequest.m
//  ColorfulWoodNetWork
//
//  Created by 大新 on 2018/5/21.
//  Copyright © 2018年 ColorfulWood. All rights reserved.
//

#import "CWNetWorkRequest.h"
#import "CWNetWorkManager.h"
#import "CWNetWorkCheck.h"

@interface CWNetWorkRequest()

@end

@implementation CWNetWorkRequest

- (instancetype)initAndRequestWithUrl:(NSString*)url type:(CWNetWorkRequestType)type params:(NSMutableDictionary*)params delegate:(id)delegate{

    if (self = [super init]) {

        self.delegate = delegate;

        if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus != AFNetworkReachabilityStatusNotReachable) {

            switch (type) {

                case CWNetWorkRequestType_Get:

                    [self func_Get_WithUrl:url withParameters:params];

                    break;

                case CWNetWorkRequestType_Post:

                    [self func_Post_WithUrl:url withParameters:params];

                    break;

                default:
                    break;
            }

        }else{

            [self fun_failureReachbility];
        }
    }

    return self;
}

#pragma mark - request
/**
 * 接口返回数据的结构必须定为：code: message: content:
 * 当code为0时，表示结果正确，直接读取content的内容；这时message里的内容基本是没有用的
 * 当code不为0时，表示接口错误，直接读取message的内容用于显示
 */
- (void)func_Post_WithUrl:(NSString *)urlStr withParameters:(NSDictionary *)parameters{

    CWNetWorkManager * net = [CWNetWorkManager sharedManager];

    [net POST:urlStr parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        /**
         * 判断返回的接口数据是否有效
         */
        if( [CWNetWorkCheck interface_check:responseObject]){

            if ([self.delegate respondsToSelector:@selector(CWNetWorkRequestDelegate_success:)]) {

                [self.delegate CWNetWorkRequestDelegate_success:responseObject];
            }

        }else{

            [self fun_failureDelegate:[CWNetWorkCheck interface_error:responseObject]];
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        [self fun_failureDelegate:[CWNetWorkCheck interface_NSError:error]];
    }];
}

/**
 * 接口返回数据的结构必须定为：code: message: content:
 * 当code为0时，表示结果正确，直接读取content的内容；这时message里的内容基本是没有用的
 * 当code不为0时，表示接口错误，直接读取message的内容用于显示
 */
- (void)func_Get_WithUrl:(NSString *)urlStr withParameters:(NSDictionary *)parameters{

    CWNetWorkManager * net = [CWNetWorkManager sharedManager];

    [net GET:urlStr parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        /**
         * 判断返回的接口数据是否有效
         */
        if( [CWNetWorkCheck interface_check:responseObject]){

            if ([self.delegate respondsToSelector:@selector(CWNetWorkRequestDelegate_success:)]) {

                [self.delegate CWNetWorkRequestDelegate_success:responseObject];
            }

        }else{

            [self fun_failureDelegate:[CWNetWorkCheck interface_error:responseObject]];
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        [self fun_failureDelegate:[CWNetWorkCheck interface_NSError:error]];
    }];
}

/**
 * 返回错误信息
 */
- (void)fun_failureDelegate:(CWNetWorkError*)error{

    if ([self.delegate respondsToSelector:@selector(CWNetWorkRequestDelegate_failure:)]) {

        [self.delegate CWNetWorkRequestDelegate_failure:error];
    }
}

/**
 * 返回网络错误
 */
- (void)fun_failureReachbility{

    CWNetWorkError *error = [CWNetWorkError new];
    error.m_code = @"-1";
    error.m_message = @"network error!";
    [self fun_failureDelegate:error];
}

@end
