//
//  XZStudent.m
//  KVO初探
//
//  Created by Alan on 4/28/20.
//  Copyright © 2020 zhaixingzhi. All rights reserved.
//

#import "XZStudent.h"

@implementation XZStudent
static XZStudent* _instance = nil;
+ (instancetype)shareInstance{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init] ;
    }) ;
    return _instance ;
}

@end
