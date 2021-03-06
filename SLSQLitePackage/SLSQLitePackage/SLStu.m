//
//  SLStu.m
//  SQLitePackage
//
//  Created by CoderSLZeng on 2017/10/19.
//  Copyright © 2017年 GitHub. All rights reserved.
//

#import "SLStu.h"

@implementation SLStu

+ (NSString *)primaryKey {
    return @"stuNum";
}

+ (NSArray *)ignoreColumnNames {
    return @[@"b", @"score2"];
}

+ (NSDictionary *)newNameToOldNameDic {
    return @{ @"arr" : @"ID", @"dict" : @"book"};
}

@end
