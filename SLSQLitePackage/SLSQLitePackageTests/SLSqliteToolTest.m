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

- (void)testDeal {
    NSString *sql = @"create table if not exists t_stu(id integer primary key autoincrement, name text not null, age integer, score real)";
    
    BOOL result = [SLSqliteTool deal:sql uid:nil];
    XCTAssertEqual(result, YES);
}

- (void)testDealSqls {
    NSString *sql1 = @"create table if not exists t_stu1(id integer primary key autoincrement, name text not null, age integer, score real)";
    NSString *sql2 = @"create table if not exists t_stu2(id integer primary key autoincrement, name text not null, age integer, score real)";
    NSString *sql3 = @"create table if not exists t_stu3(id integer primary key autoincrement, name text not null, age integer, score real)";
    NSArray *sqls = @[sql1, sql2, sql3];
    
    BOOL result = [SLSqliteTool dealSqls:sqls uid:nil];
    XCTAssertEqual(result, YES);
}

- (void)testQuery {
    
    NSString *sql = @"select * from t_stu";
    NSMutableArray *result = [SLSqliteTool querySql:sql uid:nil];
    
    NSLog(@"%@", result);
    
    
}

@end
