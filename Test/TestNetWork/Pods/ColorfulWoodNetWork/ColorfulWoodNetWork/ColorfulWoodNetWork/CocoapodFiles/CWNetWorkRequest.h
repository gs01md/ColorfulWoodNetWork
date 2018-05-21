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

@protocol CWNetWorkRequestDelegate <NSObject>
@optional
- (void)CWNetWorkRequestDelegate_success:(id)information;
- (void)CWNetWorkRequestDelegate_failure:(CWNetWorkError *)error;
//- (void)CWNetWorkRequestDelegate_uploadProgress:(NSProgress *)progress;
@end

@interface CWNetWorkRequest : NSObject

@property(nonatomic, weak)id<CWNetWorkRequestDelegate> delegate;


- (instancetype)initAndRequestWithUrl:(NSString*)url type:(CWNetWorkRequestType)type params:(NSDictionary*)params delegate:(id)delegate;


@end
