//
//  SLModelTool.m
//  SLSQLitePackage
//
//  Created by CoderSLZeng on 2017/10/19.
//  Copyright © 2017年 GitHub. All rights reserved.
//

#import "SLModelTool.h"

@implementation SLModelTool
+ (NSString *)tableName:(Class)cls {
    return NSStringFromClass(cls);
}
@end
