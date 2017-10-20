//
//  SLSqliteModelToolTest.m
//  SLSQLitePackageTests
//
//  Created by CoderSLZeng on 2017/10/19.
//  Copyright © 2017年 GitHub. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SLSqliteModelTool.h"
#import "SLStu.h"

@interface SLSqliteModelToolTest : XCTestCase

@end

@implementation SLSqliteModelToolTest

/**
 测试创建表格
 */
- (void)testCreateTableWithUid {
    Class cls = NSClassFromString(@"SLStu");
    BOOL result = [SLSqliteModelTool createTable:cls uid:nil];
    XCTAssertEqual(result, YES);
}

/**
 测试是否需要更新
 */
- (void)testIsTableRequiredUpdateWithUid {
    Class cls = NSClassFromString(@"SLStu");
    BOOL result = [SLSqliteModelTool isTableRequiredUpdate:cls uid:nil];
    XCTAssertEqual(result, YES);
}

/**
 测试更新表格
 */
- (void)testUpdateTable {
    Class cls = NSClassFromString(@"SLStu");
    BOOL result = [SLSqliteModelTool updateTable:cls uid:nil];
    XCTAssertEqual(result, YES);
}
/**
 测试保存/更新模型
 */
- (void)testSaveOrUpdateModel {
    
    SLStu *stu = [[SLStu alloc] init];
    stu.stuNum = 4;
    stu.age2 = 4;
    stu.name = @"王二小2";
    stu.score = 1;
    
    [SLSqliteModelTool saveOrUpdateModel:stu uid:nil];

}

/**
 测试删除模型
 */
- (void)testDeleteModel {
    
    SLStu *stu = [[SLStu alloc] init];
    stu.stuNum = 2;
    stu.age2 = 28;
    stu.name = @"王二小";
    stu.score = 99;
    
    [SLSqliteModelTool deleteModel:stu uid:nil];
 
}

/**
 测试根据条件删除模型
 */
- (void)testDeleteModelWhere {
    
    [SLSqliteModelTool deleteModel:[SLStu class] whereStr:@"score <= 4" uid:nil];
    
}

@end
