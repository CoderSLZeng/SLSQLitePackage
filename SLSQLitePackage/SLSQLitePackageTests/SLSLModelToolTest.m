//
//  SLSLModelToolTest.m
//  SLSQLitePackageTests
//
//  Created by CoderSLZeng on 2017/10/19.
//  Copyright © 2017年 GitHub. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SLModelTool.h"
#import "SLStu.h"

@interface SLSLModelToolTest : XCTestCase

@end

@implementation SLSLModelToolTest

- (void)testTableName {
    NSString *tableName = [SLModelTool tableName:[SLStu class]];
    NSLog(@"%@", tableName);
}

- (void)testClassIvarNameTypeDic {
    NSDictionary *dict = [SLModelTool classIvarNameTypeDic:[SLStu class]];
    NSLog(@"%@", dict);
}

- (void)testClassIvarNameSqliteTypeDic {
    NSDictionary *dict = [SLModelTool classIvarNameSqliteTypeDic:[SLStu class]];
    NSLog(@"%@", dict);
}

- (void)testColumnNamesAndTypesStr {
    NSString *columnName = [SLModelTool columnNamesAndTypesStr:[SLStu class]];
    NSLog(@"%@", columnName);
}



- (void)testAllTableSortedIvarNames {
    NSArray *arry = [SLModelTool allTableSortedIvarNames:[SLStu class]];
    NSLog(@"%@", arry);
}


@end
