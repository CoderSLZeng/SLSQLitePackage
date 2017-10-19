//
//  SLSqliteTool.h
//  SLSQLitePackage
//
//  Created by CoderSLZeng on 2017/10/19.
//  Copyright © 2017年 GitHub. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLSqliteTool : NSObject

// 用户机制
// uid : nil  common.db
// uid: zhangsan  zhangsan.db

/**
 处理sql语句, 包括增删改记录, 创建删除表格等等无结果集操作
 
 @param sql sql语句
 @param uid 用户的唯一标识
 @return 是否处理成功
 */
+ (BOOL)deal:(NSString *)sql uid:(NSString *)uid;

/**
 查询语句, 有结果集返回
 
 @param sql sql语句
 @param uid 用户的唯一标识
 @return 字典(一行记录)组成的数组
 */
+ (NSMutableArray <NSMutableDictionary *>*)querySql:(NSString *)sql uid:(NSString *)uid;

@end
