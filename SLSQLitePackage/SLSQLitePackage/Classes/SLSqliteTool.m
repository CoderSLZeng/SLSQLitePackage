//
//  SLSqliteTool.m
//  SLSQLitePackage
//
//  Created by CoderSLZeng on 2017/10/19.
//  Copyright © 2017年 GitHub. All rights reserved.
//

#import "SLSqliteTool.h"
#import "sqlite3.h"

//#define kCachePath NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject
#define kCachePath @"/Users/zeng/Desktop"

@implementation SLSqliteTool

sqlite3 *ppDb = nil;

+ (BOOL)deal:(NSString *)sql uid:(NSString *)uid {
    
    
    // 打开数据库
    if (![self openDB:uid]) {
        NSLog(@"打开失败");
        return NO;
    }
    
    // 2. 执行语句
    BOOL result = sqlite3_exec(ppDb, sql.UTF8String, nil, nil, nil) == SQLITE_OK;
    
    // 3. 关闭数据库
    [self closeDB];
    
    return result;
    
}

#pragma mark - 私有方法
+ (BOOL)openDB:(NSString *)uid {
    NSString *dbName = @"common.sqlite";
    if (uid.length != 0) {
        dbName = [NSString stringWithFormat:@"%@.sqlite", uid];
    }
    
    NSString *dbPath = [kCachePath stringByAppendingPathComponent:dbName];
    
    // 1. 创建&打开一个数据库
    
    return  sqlite3_open(dbPath.UTF8String, &ppDb) == SQLITE_OK;
    
}

+ (void)closeDB {
    sqlite3_close(ppDb);
}

@end
