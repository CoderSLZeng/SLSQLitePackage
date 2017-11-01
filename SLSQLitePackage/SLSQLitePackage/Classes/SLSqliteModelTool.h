//
//  SLSqliteModelTool.h
//  SLSQLitePackage
//
//  Created by CoderSLZeng on 2017/10/19.
//  Copyright © 2017年 GitHub. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, ColumnNameToValueRelationType) {
    ColumnNameToValueRelationTypeMore,
    ColumnNameToValueRelationTypeLess,
    ColumnNameToValueRelationTypeEqual,
    ColumnNameToValueRelationTypeMoreEqual,
    ColumnNameToValueRelationTypeLessEqual
};

typedef NS_ENUM(NSUInteger, SortOrderByType) {
    SortOrderByTypeAsc, // 正序
    SortOrderByTypeDesc// 倒叙
};

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

// score > 10 or name = 'xx'

/**
 根据字段名条件筛选来删除模型

 @param cls 类名
 @param name 字段名
 @param relation 关系类型
 @param value 字段名的值
 @param uid 用户唯一标识
 @return 是否删除模型成功
 */
+ (BOOL)deleteModel:(Class)cls columnName:(NSString *)name relation:(ColumnNameToValueRelationType)relation value:(id)value uid:(NSString *)uid;

/**
 根据表名查询，获取所有的模型

 @param cls 类名
 @param uid 用户唯一标识
 @return 所有模型的结果集，模型数组
 */
+ (NSArray *)queryAllModels:(Class)cls uid:(NSString *)uid;


/**
 根据一个字段名条件筛选来查询，获取模型

 @param cls 类名
 @param columnName 字段名
 @param relation 关系类型
 @param value 字段名的值
 @param uid 用户唯一标识
 @return 模型的结果集，模型数组
 */
+ (NSArray *)queryModels:(Class)cls
              columnName:(NSString *)columnName
                relation:(ColumnNameToValueRelationType)relation
                   value:(id)value
                     uid:(NSString *)uid;

/**
 根据一个字段名条件并排序筛选来查询，获取模型
 
 @param cls 类名
 @param columnName 字段名
 @param relation 关系类型
 @param value 字段名的值
 @param sortName 排序的字段
 @param sequence 顺序类型
 @param uid 用户唯一标识
 @return 模型的结果集，模型数组
 */
+ (NSArray *)queryModels:(Class)cls
              columnName:(NSString *)columnName
                relation:(ColumnNameToValueRelationType)relation
                   value:(id)value
         sortOrderByName:(NSString *)sortName
                sequence:(SortOrderByType)sequence
                     uid:(NSString *)uid;


/**
 根据两个字段名条件筛选来查询，获取模型
 
 @param cls 类名
 @param firstName 第一个字段名
 @param firstRelation 第一个关系类型
 @param firstValue 第一个字段名的值
 @param secondName 第二个字段名
 @param secondRelation 第二个关系类型
 @param secondValue 第二个字段名的值
 @param uid 用户唯一标识
 @return 模型的结果集，模型数组
 */
+ (NSArray *)queryModels:(Class)cls
         columnFirstName:(NSString *)firstName
           firstRelation:(ColumnNameToValueRelationType)firstRelation
              firstValue:(id)firstValue columnSecondName:(NSString *)secondName
          secondRelation:(ColumnNameToValueRelationType)secondRelation
             secondValue:(id)secondValue
                     uid:(NSString *)uid;



/**
 根据两个字段名条件并排序筛选来查询，获取模型
 
 @param cls 类名
 @param firstName 第一个字段名
 @param firstRelation 第一个关系类型
 @param firstValue 第一个字段名的值
 @param secondName 第二个字段名
 @param secondRelation 第二个关系类型
 @param secondValue 第二个字段名的值
 @param sortName 排序的字段
 @param sequence 顺序类型
 @param uid 用户唯一标识
 @return 模型的结果集，模型数组
 */
+ (NSArray *)queryModels:(Class)cls
         columnFirstName:(NSString *)firstName
           firstRelation:(ColumnNameToValueRelationType)firstRelation
              firstValue:(id)firstValue
        columnSecondName:(NSString *)secondName
          secondRelation:(ColumnNameToValueRelationType)secondRelation
             secondValue:(id)secondValue
         sortOrderByName:(NSString *)sortName
                sequence:(SortOrderByType)sequence
                     uid:(NSString *)uid;

/**
 根据SQL语句查询，获取模型

 @param cls 类名
 @param sql SQL语句
 @param uid 用户唯一标识
 @return 模型的结果集，模型数组
 */
+ (NSArray *)queryModels:(Class)cls WithSql:(NSString *)sql uid:(NSString *)uid;
@end
