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
#import "SLModelTool.h"

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
    stu.stuNum = 31;
    stu.age = 521;
    stu.name = @"王二小1";
    stu.score = 171;
    NSMutableArray *arr = [NSMutableArray array];
    [arr addObject:@1];
    [arr addObject:@2];
//    stu.ID = arr;
//    stu.book = @{@"问题的力量": @"zeng", @"从入门到放弃": @"xin"};
    
    
    [SLSqliteModelTool saveOrUpdateModel:stu uid:nil];

}

/**
 测试删除模型
 */
- (void)testDeleteModel {
    
    SLStu *stu = [[SLStu alloc] init];
    stu.stuNum = 2;
    stu.age = 28;
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


/**
 测试根据字段名条件筛选来删除模型
 */
- (void)testDeleteModelWhere2 {
    
    [SLSqliteModelTool deleteModel:[SLStu class] columnName:@"name" relation:ColumnNameToValueRelationTypeEqual value:@"王二小" uid:nil];
    
}


/**
 测试根据字段名条件筛选来查询，获取模型
 */
- (void)testQueryAllModels {
    
    NSArray *array = [SLSqliteModelTool queryAllModels:[SLStu class] uid:nil];
    NSLog(@"%@", array);
 
}


/**
 测试根据字段名条件筛选来查询，获取模型
 */
- (void)testQueryModels {
    
    NSArray *results = [SLSqliteModelTool queryModels:[SLStu class] columnName:@"name" relation:ColumnNameToValueRelationTypeEqual value:@"王二小1" uid:nil];
    NSLog(@"%@", results);
    
}


/**
 测试根据SQL语句查询，获取模型
 */
- (void)testQueryModelsWithSql {
    
    NSString *tableName = [SLModelTool tableName:[SLStu class]];
    // 1. sql
    NSString *sqlStr = [NSString stringWithFormat:@"select * from %@", tableName];
    
    NSArray *results = [SLSqliteModelTool queryModels:[SLStu class] WithSql:sqlStr uid:nil];
    NSLog(@"%@", results);
}

@end
