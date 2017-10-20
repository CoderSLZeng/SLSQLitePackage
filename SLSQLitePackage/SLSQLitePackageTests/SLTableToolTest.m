//
//  SLTableToolTest.m
//  SLSQLitePackageTests
//
//  Created by CoderSLZeng on 2017/10/19.
//  Copyright © 2017年 GitHub. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SLTableTool.h"

@interface SLTableToolTest : XCTestCase

@end

@implementation SLTableToolTest


/**
 测试获取表格中所有的排序后字段
 */
- (void)testTableSortedColumnNames {
    Class cls = NSClassFromString(@"SLStu");
    NSArray *arry = [SLTableTool tableSortedColumnNames:cls uid:nil];
    NSLog(@"%@", arry);
}


/**
 判断表格是否存在
 */
- (void)testIsTableExists {
    Class cls = NSClassFromString(@"SLStu");
    BOOL result = [SLTableTool isTableExists:cls uid:nil];
    XCTAssertEqual(result, YES);
}

@end
