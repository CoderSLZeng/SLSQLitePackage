//
//  SLTableTool.h
//  SLSQLitePackage
//
//  Created by CoderSLZeng on 2017/10/19.
//  Copyright © 2017年 GitHub. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLTableTool : NSObject

/**
 获取表格中所有的排序后字段
 
 @param cls 类名
 @param uid 用户唯一标识
 @return 字段数组
 */
+ (NSArray *)tableSortedColumnNames:(Class)cls uid:(NSString *)uid;


/**
 判断表格是否存在

 @param cls 类名
 @param uid 用户唯一标识
 @return 判断表格是否存在
 */
+ (BOOL)isTableExists:(Class)cls uid:(NSString *)uid;
@end
