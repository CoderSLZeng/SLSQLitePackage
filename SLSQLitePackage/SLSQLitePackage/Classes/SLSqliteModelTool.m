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
#import "SLTableTool.h"

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

+ (BOOL)isTableRequiredUpdate:(Class)cls uid:(NSString *)uid {
    // 1. 获取类对应的所有有效成员变量名称, 并排序
    NSArray *modelNames = [SLModelTool allTableSortedIvarNames:cls];
    
    // 2. 获取当前表格, 所有字段名称, 并排序
    NSArray *tableNames = [SLTableTool tableSortedColumnNames:cls uid:uid];
    
    // 3. 通过对比数据判定是否需要更新
    return ![modelNames isEqualToArray:tableNames];
}

+ (BOOL)updateTable:(Class)cls uid:(NSString *)uid {
    
    
    // 1. 创建一个拥有正确结构的临时表
    // 1.1 获取表格名称
    NSString *tmpTableName = [SLModelTool temporaryTableName:cls];
    NSString *tableName = [SLModelTool tableName:cls];
    
    if (![cls respondsToSelector:@selector(primaryKey)]) {
        NSLog(@"如果想要操作这个模型, 必须要实现+ (NSString *)primaryKey;这个方法, 来告诉我主键信息");
        return NO;
    }
    NSMutableArray *execSqls = [NSMutableArray array];
    NSString *primaryKey = [cls primaryKey];
    NSString *createTableSql = [NSString stringWithFormat:@"create table if not exists %@(%@, primary key(%@));", tmpTableName, [SLModelTool columnNamesAndTypesStr:cls], primaryKey];
    [execSqls addObject:createTableSql];
    // 2. 根据主键, 插入数据
    // insert into SLstu_tmp(stuNum) select stuNum from SLstu;
    NSString *insertPrimaryKeyData = [NSString stringWithFormat:@"insert into %@(%@) select %@ from %@;", tmpTableName, primaryKey, primaryKey, tableName];
    [execSqls addObject:insertPrimaryKeyData];
    // 3. 根据主键, 把所有的数据更新到新表里面
    NSArray *oldNames = [SLTableTool tableSortedColumnNames:cls uid:uid];
    NSArray *newNames = [SLModelTool allTableSortedIvarNames:cls];
    
    for (NSString *columnName in newNames) {
        if (![oldNames containsObject:columnName]) {
            continue;
        }
        NSString *updateSql = [NSString stringWithFormat:@"update %@ set %@ = (select %@ from %@ where %@.%@ = %@.%@)", tmpTableName, columnName, columnName, tableName, tmpTableName, primaryKey, tableName, primaryKey];
        [execSqls addObject:updateSql];
    }
    
    NSString *deleteOldTable = [NSString stringWithFormat:@"drop table if exists %@", tableName];
    [execSqls addObject:deleteOldTable];
    
    NSString *renameTableName = [NSString stringWithFormat:@"alter table %@ rename to %@", tmpTableName, tableName];
    [execSqls addObject:renameTableName];
    
    
    return [SLSqliteTool dealSqls:execSqls uid:uid];
    
}

@end
