//
//  XZDog.m
//  KVO初探
//
//  Created by Alan on 4/28/20.
//  Copyright © 2020 zhaixingzhi. All rights reserved.
//

#import "XZDog.h"

@implementation XZDog
- (NSString *)description{
    return [NSString stringWithFormat:@"%@-%d",self.name,self.age];
}

@end
