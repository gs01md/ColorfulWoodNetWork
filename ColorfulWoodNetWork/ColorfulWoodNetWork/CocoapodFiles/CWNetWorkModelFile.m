//
//  CWNetWorkModelFile.m
//  ColorfulWoodNetWork
//  上传文件的参数：图片、音视频等
//  Created by 大新 on 2018/9/10.
//  Copyright © 2018年 ColorfulWood. All rights reserved.
//

#import "CWNetWorkModelFile.h"
#import <UIKit/UIKit.h>
#import <ColorfulWoodTools/UIImage+ColorfulWood.h>

@implementation CWNetWorkModelFile

- (instancetype)initWithParamName:(NSString*)paramName file:(NSObject*)file fileName:(NSString*)fileName fileType:(NSString*)fileType{

    if (self = [super init]) {

        self.m_paramName = paramName;

        self.m_file = file;
        self.m_fileName = fileName;
        self.m_fileType = fileType;
    }

    return self;
}
/**
 * 检查参数是否有效
 */
- (BOOL)interface_check{

    BOOL bCheck = TRUE;

    if (!self.m_file) {
        return FALSE;
    }

    if (!self.m_paramName || self.m_paramName.length <1) {
        return FALSE;
    }

    if (!self.m_fileType || self.m_fileType.length <1) {
        return FALSE;
    }

    if (!self.m_fileName || self.m_fileName.length <1) {
        return FALSE;
    }

    return bCheck;
}

/**
 * 返回文件数据
 */
- (NSData*)interface_transData{

    NSData * data = [NSData new];

    if (self.m_file) {

        if ([self.m_file isKindOfClass:[UIImage class]]) {
            UIImage *image = (UIImage*)self.m_file;
            return [image interface_scaleWithCompressionQuality:1.];
        }
    }

    return data;

}

@end
