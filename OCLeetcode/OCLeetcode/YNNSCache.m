//
//  YNNSCache.m
//  OCLeetcode
//
//  Created by ght on 2019/4/18.
//  Copyright © 2019 youdao. All rights reserved.
//

#import "YNNSCache.h"
@interface YNCacheEntry: NSObject<NSCopying>
@property (nonatomic, strong) NSObject *value;
@property (nonatomic, strong) YNCacheEntry *preEntry;
@property (nonatomic, strong) YNCacheEntry *nextEntry;
@property (nonatomic, assign) NSInteger cost;
@end

@implementation YNNSCache

@end
