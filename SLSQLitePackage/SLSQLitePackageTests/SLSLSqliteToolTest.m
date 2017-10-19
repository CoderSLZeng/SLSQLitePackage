//
//  SLSLSqliteToolTest.m
//  SLSQLitePackageTests
//
//  Created by CoderSLZeng on 2017/10/19.
//  Copyright © 2017年 GitHub. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SLSqliteTool.h"

@interface SLSLSqliteToolTest : XCTestCase

@end

@implementation SLSLSqliteToolTest


- (void)testDdeal {
    NSString *sql = @"create table if not exists t_stu(id integer primary key autoincrement, name text not null, age integer, score real)";
    
    BOOL result = [SLSqliteTool deal:sql uid:nil];
    XCTAssertEqual(result, YES);
}


@end
