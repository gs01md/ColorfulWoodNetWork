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
#import "CWNetWorkModelFile.h"
#import <ColorfulWoodTools/UIImage+ColorfulWood.h>

@interface CWNetWorkRequest()

@end

@implementation CWNetWorkRequest

+ (id)shareInstance{return [CWNetWorkRequest new];}

- (void)interface_requestWithUrl:(NSString*)url type:(CWNetWorkRequestType)type params:(NSMutableDictionary*)params success:(void (^)(id info))success faild:(void (^)(CWNetWorkError * error))faild{

    self.block_requestSuccess = success;
    self.block_requestFaild = faild;

    if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus != AFNetworkReachabilityStatusNotReachable) {

        switch (type) {

            case CWNetWorkRequestType_Get:

                [self func_Get_WithUrl:url parameters:params];

                break;

            case CWNetWorkRequestType_Post:

                [self func_Post_WithUrl:url parameters:params];

                break;

            default:
                break;
        }

    }else{

        [self fun_failureReachbility];
    }
}

- (void)interface_requestWithUrl:(NSString*)url type:(CWNetWorkRequestType)type params:(NSMutableDictionary*)params delegate:(id)delegate{

    self.delegate = delegate;
    [self.m_delegates interface_addDelegate:delegate];

    if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus != AFNetworkReachabilityStatusNotReachable) {

        switch (type) {

            case CWNetWorkRequestType_Get:

                [self func_Get_WithUrl:url parameters:params];

                break;

            case CWNetWorkRequestType_Post:

                [self func_Post_WithUrl:url parameters:params];

                break;

            default:
                break;
        }

    }else{

        [self fun_failureReachbility];
    }
}

- (instancetype)initAndRequestWithUrl:(NSString*)url type:(CWNetWorkRequestType)type params:(NSMutableDictionary*)params delegate:(id)delegate{

    if (self = [super init]) {

        self.delegate = delegate;

        if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus != AFNetworkReachabilityStatusNotReachable) {

            switch (type) {

                case CWNetWorkRequestType_Get:

                    [self func_Get_WithUrl:url parameters:params];

                    break;

                case CWNetWorkRequestType_Post:

                    [self func_Post_WithUrl:url parameters:params];

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

- (instancetype)initAndRequestWithUrl:(NSString*)url type:(CWNetWorkRequestType)type params:(NSMutableDictionary*)params files:(NSArray<CWNetWorkModelFile*>*)files delegate:(id)delegate{

    if (self = [super init]) {

        self.delegate = delegate;

        if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus != AFNetworkReachabilityStatusNotReachable) {

            switch (type) {

                case CWNetWorkRequestType_Get:

                    [self func_Get_WithUrl:url parameters:params];

                    break;

                case CWNetWorkRequestType_Post:

                    [self func_Post_WithUrl:url parameters:params];

                    break;

                case CWNetWorkRequestType_Form:

                    [self func_Post_Form_WithUrl:url parameters:params files:files];

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
- (void)func_Post_WithUrl:(NSString *)urlStr parameters:(NSDictionary *)parameters{

    self.m_isRequesting = YES;
    
    CWNetWorkManager * net = [CWNetWorkManager sharedManager];

    [net POST:urlStr parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        /**
         * 判断返回的接口数据是否有效
         */
        if( [CWNetWorkCheck interface_check:responseObject]){

            [self fun_success:responseObject];

        }else{

            [self fun_failure:[CWNetWorkCheck interface_error:responseObject]];
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        [self fun_failure:[CWNetWorkCheck interface_NSError:error]];
    }];
}

/**
 * 接口返回数据的结构必须定为：code: message: content:
 * 当code为0时，表示结果正确，直接读取content的内容；这时message里的内容基本是没有用的
 * 当code不为0时，表示接口错误，直接读取message的内容用于显示
 */
- (void)func_Get_WithUrl:(NSString *)urlStr parameters:(NSDictionary *)parameters{

    self.m_isRequesting = YES;

    CWNetWorkManager * net = [CWNetWorkManager sharedManager];

    [net GET:urlStr parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        /**
         * 判断返回的接口数据是否有效
         */
        if( [CWNetWorkCheck interface_check:responseObject]){

            [self fun_success:responseObject];

        }else{

            [self fun_failure:[CWNetWorkCheck interface_error:responseObject]];
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        [self fun_failure:[CWNetWorkCheck interface_NSError:error]];
    }];
}

/**
 * 接口返回数据的结构必须定为：code: message: content:
 * Form表单形式可以提供图片上传功能，Form只有Post形式
 * 当code为0时，表示结果正确，直接读取content的内容；这时message里的内容基本是没有用的
 * 当code不为0时，表示接口错误，直接读取message的内容用于显示
 */
- (NSURLSessionDataTask*)func_Post_Form_WithUrl:(NSString *)urlStr parameters:(NSDictionary *)parameters files:(NSArray<CWNetWorkModelFile*>*)files{

    self.m_isRequesting = YES;

    CWNetWorkManager * net = [CWNetWorkManager sharedManager];

    return [net POST:urlStr parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {

        if (files) {

            for (CWNetWorkModelFile *file in files) {

                if ([file interface_check]) {

                    NSData *data = [file interface_transData];
                    [formData appendPartWithFileData:data name:file.m_paramName fileName:file.m_fileName mimeType:file.m_fileType];
                }
            }
        }
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        /**
         * 判断返回的接口数据是否有效
         */
        if( [CWNetWorkCheck interface_check:responseObject]){

            [self fun_success:responseObject];

        }else{

            [self fun_failure:[CWNetWorkCheck interface_error:responseObject]];
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        [self fun_failure:[CWNetWorkCheck interface_NSError:error]];
    }];
}

/**
 * 返回错误信息
 */
- (void)fun_success:(id)info{

    self.m_isRequesting = NO;

    if ([self.delegate respondsToSelector:@selector(CWNetWorkRequestDelegate_success:)]) {

        [self.delegate CWNetWorkRequestDelegate_success:info];
    }

    if (self.block_requestSuccess) {
        self.block_requestSuccess(info);
    }
}

/**
 * 返回错误信息
 */
- (void)fun_failure:(CWNetWorkError*)error{

    self.m_isRequesting = NO;

    if ([self.delegate respondsToSelector:@selector(CWNetWorkRequestDelegate_failure:)]) {

        [self.delegate CWNetWorkRequestDelegate_failure:error];
    }

    if (self.block_requestFaild) {
        self.block_requestFaild(error);
    }
}

/**
 * 返回网络错误
 */
- (void)fun_failureReachbility{

    CWNetWorkError *error = [CWNetWorkError new];
    error.m_code = @"-1";
    error.m_message = @"network error!";
    [self fun_failure:error];

    if (self.block_requestFaild) {
        self.block_requestFaild(error);
    }
}

#pragma mark - 属性

- (ColorfulWoodMultiDelegate*)m_delegates{

    if (!_m_delegates) {
        _m_delegates = [ColorfulWoodMultiDelegate new];
    }

    return _m_delegates;
}

@end
