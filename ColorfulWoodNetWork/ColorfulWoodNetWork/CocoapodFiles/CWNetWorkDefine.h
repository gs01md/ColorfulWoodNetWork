//
//  CWNetWorkDefine.h
//  ColorfulWoodNetWork
//
//  Created by 大新 on 2018/5/21.
//  Copyright © 2018年 ColorfulWood. All rights reserved.
//

#ifndef CWNetWorkDefine_h
#define CWNetWorkDefine_h


typedef enum : NSUInteger {
    CWNetWorkRequestType_Get = 1,
    CWNetWorkRequestType_Post,

    /**
     * Form只有post形式
     */
    CWNetWorkRequestType_Form
} CWNetWorkRequestType;


#endif /* CWNetWorkDefine_h */
