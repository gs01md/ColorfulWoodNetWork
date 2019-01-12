//
//  CWNetWorkRequest.h
//  ColorfulWoodNetWork
//
//  Created by 大新 on 2018/5/21.
//  Copyright © 2018年 ColorfulWood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWNetWorkDefine.h"
#import "CWNetWorkError.h"
#import <ColorfulWoodTools/ColorfulWoodMultiDelegate.h>

@protocol CWNetWorkRequestDelegate <NSObject>
@optional
- (void)CWNetWorkRequestDelegate_success:(id)information;
- (void)CWNetWorkRequestDelegate_failure:(CWNetWorkError *)error;
//- (void)CWNetWorkRequestDelegate_uploadProgress:(NSProgress *)progress;
@end

@interface CWNetWorkRequest : NSObject

/**
 * 标识：正在请求中
 * 在子类使用，防止重复请求
 */
@property(nonatomic, assign) BOOL m_isRequesting;

@property(nonatomic, weak)id<CWNetWorkRequestDelegate> delegate;

/**
 * 储存所有的代理，这样，一种请求（子类）就只需维护一个代理列表
 */
@property(nonatomic, strong) ColorfulWoodMultiDelegate *m_delegates;


/**
 * 请求成功
 */
@property (nonatomic, copy)void (^block_requestSuccess)(id info);

/**
 * 请求失败
 */
@property (nonatomic, copy)void (^block_requestFaild)(CWNetWorkError * error);

+ (id)shareInstance;

- (instancetype)initAndRequestWithUrl:(NSString*)url type:(CWNetWorkRequestType)type params:(NSDictionary*)params delegate:(id)delegate;

- (void)interface_requestWithUrl:(NSString*)url type:(CWNetWorkRequestType)type params:(NSMutableDictionary*)params delegate:(id)delegate;

- (void)interface_requestWithUrl:(NSString*)url type:(CWNetWorkRequestType)type params:(NSMutableDictionary*)params success:(void (^)(id info))success faild:(void (^)(CWNetWorkError * error))faild;

#pragma mark - 添加代理
- (void)interface_addDelegate:(id)delegate;

- (void)interface_removeDelegate:(id)delegate;

/**
 * 子类实现
 * 每次请求时，更新自定义的sign等信息
 */
- (void)inner_refreshAuth;
@end
