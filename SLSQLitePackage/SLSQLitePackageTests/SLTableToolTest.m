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

- (void)testTableSortedColumnNames {
    Class cls = NSClassFromString(@"SLStu");
    NSArray *arry = [SLTableTool tableSortedColumnNames:cls uid:nil];
    NSLog(@"%@", arry);
}

@end
