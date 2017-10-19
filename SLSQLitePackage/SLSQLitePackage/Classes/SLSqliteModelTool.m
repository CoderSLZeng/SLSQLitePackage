//
//  SLSqliteModelTool.m
//  SLSQLitePackage
//
//  Created by CoderSLZeng on 2017/10/19.
//  Copyright © 2017年 GitHub. All rights reserved.
//

#import "SLSqliteModelTool.h"
#import "SLModelProtocol.h"
#import "SLModelTool.h"
#import "SLSqliteTool.h"

@implementation SLSqliteModelTool
// 关于这个工具类的封装
// 实现方案 2
// 1. 基于配置
// 2. runtime动态获取
+ (BOOL)createTable:(Class)cls uid:(NSString *)uid {
    
    // 1. 创建表格的sql语句给拼接出来
    // 尽可能多的, 能够自己获取, 就自己获取, 实在判定不了用的意图的, 只能让用户来告诉我们
    
    // create table if not exists 表名(字段1 字段1类型, 字段2 字段2类型 (约束),...., primary key(字段))
    // 1.1 获取表格名称
    NSString *tableName = [SLModelTool tableName:cls];
    
    if (![cls respondsToSelector:@selector(primaryKey)]) {
        NSLog(@"如果想要操作这个模型, 必须要实现+ (NSString *)primaryKey;这个方法, 来告诉我主键信息");
        return NO;
    }
    
    NSString *primaryKey = [cls primaryKey];
    
    // 1.2 获取一个模型里面所有的字段, 以及类型
    NSString *createTableSql = [NSString stringWithFormat:@"create table if not exists %@(%@, primary key(%@))", tableName, [SLModelTool columnNamesAndTypesStr:cls], primaryKey];
    
    
    // 2. 执行
    return [SLSqliteTool deal:createTableSql uid:uid];
    
}
@end
