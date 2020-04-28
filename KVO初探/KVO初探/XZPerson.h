//
//  XZPerson.h
//  KVO初探
//
//  Created by Alan on 4/28/20.
//  Copyright © 2020 zhaixingzhi. All rights reserved.
//

#import <Foundation/Foundation.h>
@class XZStudent;

NS_ASSUME_NONNULL_BEGIN

@interface XZPerson : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *nick;
@property (nonatomic, copy) NSString *downloadProgress;
@property (nonatomic, assign) double writtenData;
@property (nonatomic, assign) double totalData;
@property (nonatomic, strong) NSMutableArray *dateArray;
@property (nonatomic, strong) XZStudent *st;

@end

NS_ASSUME_NONNULL_END
