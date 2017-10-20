//
//  SLSqliteModelTool.h
//  SLSQLitePackage
//
//  Created by CoderSLZeng on 2017/10/19.
//  Copyright © 2017年 GitHub. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLSqliteModelTool : NSObject
/**
 根据一个模型类, 创建数据库表
 
 @param cls 类名
 @param uid 用户唯一标识
 @return 是否创建成功
 */
+ (BOOL)createTable:(Class)cls uid:(NSString *)uid;

/**
 判断一个表格是否需要更新
 
 @param cls 类名
 @param uid 用户唯一标识
 @return 是否需要更新
 */
+ (BOOL)isTableRequiredUpdate:(Class)cls uid:(NSString *)uid;

/**
 更新表格
 
 @param cls 类名
 @param uid 用户唯一标识
 @return 是否更新成功
 */
+ (BOOL)updateTable:(Class)cls uid:(NSString *)uid;

/**
 保存/更新模型
 
 @param model 模型
 @param uid 用户唯一标识
 @return 是否保存/更新模型成功
 */
+ (BOOL)saveOrUpdateModel:(id)model uid:(NSString *)uid;


/**
 删除模型

 @param model 模型
 @param uid 用户唯一标识
 @return 是否删除模型成功
 */
+ (BOOL)deleteModel:(id)model uid:(NSString *)uid;

// age > 19
// score <= 10 and xxx
/**
 根据条件来删除模型

 @param cls 类名
 @param whereStr 条件
 @param uid 用户唯一标识
 @return 是否删除模型成功
 */
+ (BOOL)deleteModel:(Class)cls whereStr:(NSString *)whereStr uid:(NSString *)uid;

@end
