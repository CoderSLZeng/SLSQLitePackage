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
@end
