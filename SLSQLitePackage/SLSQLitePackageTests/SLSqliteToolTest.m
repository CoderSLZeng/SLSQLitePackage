//
//  SLSqliteToolTest.m
//  SLSQLitePackageTests
//
//  Created by CoderSLZeng on 2017/10/19.
//  Copyright © 2017年 GitHub. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SLSqliteTool.h"

@interface SLSqliteToolTest : XCTestCase

@end

@implementation SLSqliteToolTest

/**
 测试是否可以正常执行sql语句
 */
- (void)testDeal {
    // 创建表格的语句
    NSString *sql = @"create table if not exists t_stu(id integer primary key autoincrement, name text not null, age integer, score real)";
    
    BOOL result = [SLSqliteTool deal:sql uid:nil];
    XCTAssertEqual(result, YES);
}

/**
 测试查询, 是否可以返回处理好的结果集
 */
- (void)testDealSqls {
    // 删除所有记录
    NSString *deleteSql = @"delete from t_stu";
    BOOL deleteSqlR = [SLSqliteTool deal:deleteSql uid:nil];
    XCTAssertTrue(deleteSqlR);
    
    // 追加两条记录
    NSString *insertSql1 = @"insert into t_stu(id, name, age, score) values (1, 'sz', 18, 0)";
    BOOL insertSqlR1 = [SLSqliteTool deal:insertSql1 uid:nil];
    XCTAssertTrue(insertSqlR1);
    
    NSString *insertSql2 = @"insert into t_stu(id, name, age, score) values (2, 'zs', 81, 1)";
    BOOL insertSqlR2 = [SLSqliteTool deal:insertSql2 uid:nil];
    XCTAssertTrue(insertSqlR2);
    
    NSString *sql = @"select * from t_stu";
    NSMutableArray *result = [SLSqliteTool querySql:sql uid:nil];
    
    
    // 给定结果验证
    NSArray *successR = @[@{
                              @"age": @18,
                              @"id": @1,
                              @"name": @"sz",
                              @"score": @0
                              },
                          @{
                              @"age": @81,
                              @"id": @2,
                              @"name": @"zs",
                              @"score": @1
                              }];
    
    XCTAssertTrue([result isEqualToArray:successR]);
}

/**
 测试查询语句, 有结果集返回
 */
- (void)testQuery {
    
    NSString *sql = @"select * from t_stu";
    NSMutableArray *result = [SLSqliteTool querySql:sql uid:nil];
    
    NSLog(@"%@", result);
    
    
}

@end
