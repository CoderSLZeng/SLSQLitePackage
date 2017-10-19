//
//  SLModelTool.h
//  SLSQLitePackage
//
//  Created by CoderSLZeng on 2017/10/19.
//  Copyright © 2017年 GitHub. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLModelTool : NSObject
/**
 根据类名, 获取表格名称
 
 @param cls 类名
 @return 表格名称
 */
+ (NSString *)tableName:(Class)cls;

/**
 获取所有的有效成员变量, 以及成员变量对应的类型
 
 @param cls 类名
 @return 所有的有效成员变量, 以及成员变量对应的类型
 */
+ (NSDictionary *)classIvarNameTypeDic:(Class)cls;
@end
