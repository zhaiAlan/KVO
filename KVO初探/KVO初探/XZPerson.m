//
//  XZPerson.m
//  KVO初探
//
//  Created by Alan on 4/28/20.
//  Copyright © 2020 zhaixingzhi. All rights reserved.
//

#import "XZPerson.h"

@implementation XZPerson
// 下载进度 -- writtenData/totalData
+ (NSSet<NSString *> *)keyPathsForValuesAffectingValueForKey:(NSString *)key{
    
    NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
    if ([key isEqualToString:@"downloadProgress"]) {
        NSArray *affectingKeys = @[@"totalData", @"writtenData"];
        keyPaths = [keyPaths setByAddingObjectsFromArray:affectingKeys];
    }
    return keyPaths;
}

// 自动开关，设置为NO后，需要手动触发Willchange和didchange
//+ (BOOL) automaticallyNotifiesObserversForKey:(NSString *)key{
//    return NO;
//}




- (NSString *)downloadProgress{
    if (self.writtenData == 0) {
        self.writtenData = 10;
    }
    if (self.totalData == 0) {
        self.totalData = 100;
    }
    return [[NSString alloc] initWithFormat:@"%f",1.0f*self.writtenData/self.totalData];
}

- (void)setNick:(NSString *)nick{
    [self willChangeValueForKey:@"nick"];
    _nick = nick;
    [self didChangeValueForKey:@"nick"];
}

- (void)insertObject:(id)object inDateArrayAtIndex:(NSUInteger)index{
    [self.dateArray insertObject:object atIndex:index];
}

-(void)removeObjectFromDateArrayAtIndex:(NSUInteger)index{
    [self.dateArray removeObjectAtIndex:index];
}

@end
