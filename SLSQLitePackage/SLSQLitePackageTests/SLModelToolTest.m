//
//  SLModelToolTest.m
//  SLSQLitePackageTests
//
//  Created by CoderSLZeng on 2017/10/20.
//  Copyright © 2017年 GitHub. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SLModelTool.h"
#import "SLStu.h"

@interface SLModelToolTest : XCTestCase

@end

@implementation SLModelToolTest


/**
 测试根据类名, 获取表格名称
 */
- (void)testTableName {
    NSString *tableName = [SLModelTool tableName:[SLStu class]];
    NSLog(@"%@", tableName);
}


/**
 根据类名, 获取临时表格名称
 */
- (void)testTemporaryTableName
{
    NSString *tableName = [SLModelTool temporaryTableName:[SLStu class]];
    NSLog(@"%@", tableName);
}


/**
 测试获取所有的有效成员变量, 以及成员变量对应的类型
 */
- (void)testClassIvarNameTypeDic {
    NSDictionary *dict = [SLModelTool classIvarNameTypeDic:[SLStu class]];
    NSLog(@"%@", dict);
}


/**
 测试获取所有的成员变量, 以及成员变量映射到数据库里面对应的类型
 */
- (void)testClassIvarNameSqliteTypeDic {
    NSDictionary *dict = [SLModelTool classIvarNameSqliteTypeDic:[SLStu class]];
    NSLog(@"%@", dict);
}

/**
 测试获取字段名称和sql类型, 拼接的用户创建表格的字符串
 */
- (void)testColumnNamesAndTypesStr {
    NSString *columnName = [SLModelTool columnNamesAndTypesStr:[SLStu class]];
    NSLog(@"%@", columnName);
}

/**
 测试获取排序后的类名对应的成员变量数组, 用于和表格字段进行验证是否需要更新
 */
- (void)testAllTableSortedIvarNames {
    NSArray *arry = [SLModelTool allTableSortedIvarNames:[SLStu class]];
    NSLog(@"%@", arry);
}

@end
