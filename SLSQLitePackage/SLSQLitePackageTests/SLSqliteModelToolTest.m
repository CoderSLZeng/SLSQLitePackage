//
//  SLSqliteModelToolTest.m
//  SLSQLitePackageTests
//
//  Created by CoderSLZeng on 2017/10/19.
//  Copyright © 2017年 GitHub. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SLSqliteModelTool.h"

@interface SLSqliteModelToolTest : XCTestCase

@end

@implementation SLSqliteModelToolTest

- (void)testCreateTableWithUid {
    Class cls = NSClassFromString(@"SLStu");
    BOOL result = [SLSqliteModelTool createTable:cls uid:nil];
    XCTAssertEqual(result, YES);
}

- (void)testIsTableRequiredUpdateWithUid {
    Class cls = NSClassFromString(@"SLStu");
    BOOL result = [SLSqliteModelTool isTableRequiredUpdate:cls uid:nil];
    XCTAssertEqual(result, YES);
}

@end
