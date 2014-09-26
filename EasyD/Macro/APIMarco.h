//
//  APIMarco.h
//  ProInspection
//
//  Created by Aries on 14-7-8.
//  Copyright (c) 2014年 Sagitar. All rights reserved.
//

#ifndef ProInspection_APIMarco_h
#define ProInspection_APIMarco_h

//#define Domain @"http://192.168.1.234:8081"
//#define Domain @"http://192.168.1.114:8080"
#define Domain @"http://42.96.185.45:8888"
//#define Domain @"http://122.13.71.189"
//登陆接口
#define Login_URL Domain"/inspect/app/user/login.do"
//获取项目列表接口
#define GetProjectList_URL Domain"/inspect/app/instance/getProjectList.do"
//下载项目信息
#define GetProjectInfo_URL Domain"/inspect/app/instance/createInstance.do"
//上传缺陷
#define UploadInspect_URL Domain"/inspect/app/instance/uploadInstance.do"
//获取整改列表
#define GetCorrectiveList_URL Domain"/inspect/app/instance/getCorrectiveList.do"
//上传整改
#define UploadCorrectiveList_URL Domain"/inspect/app/instance/upCorrective.do"
//获取红宝书
#define GetRedBook_URL Domain"/inspect/app/data/createItemPicZIP.do"
//获取红宝书压缩包
#define GetRedBookZip_URL Domain"/inspect/app/data/getItemPicZIP.do"

//获取照片，录音地址
#define ImageAndRecord_URL Domain"/inspect"

#endif
