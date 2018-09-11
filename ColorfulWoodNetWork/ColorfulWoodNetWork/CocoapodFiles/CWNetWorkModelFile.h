//
//  CWNetWorkModelFile.h
//  ColorfulWoodNetWork
//  上传文件的参数：图片、音视频等
//  Created by 大新 on 2018/9/10.
//  Copyright © 2018年 ColorfulWood. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWNetWorkModelFile : NSObject

/**
 * 图片 mp4等
 */
@property(nonatomic, strong)NSObject * m_file;

/**
 * 参数名称
 */
@property(nonatomic, strong)NSString * m_paramName;

/**
 * 上传文件的名称
 */
@property(nonatomic, strong)NSString * m_fileName;

/**
 * 上传文件的类型：@"image/jpg" @"image/png" @"audio/aiff" 等
 */
@property(nonatomic, strong)NSString * m_fileType;

- (instancetype)initWithParamName:(NSString*)paramName file:(NSObject*)file fileName:(NSString*)fileName fileType:(NSString*)fileType;

/**
 * 检查参数是否有效
 */
- (BOOL)interface_check;

/**
 * 返回文件数据
 */
- (NSData*)interface_transData;

@end
