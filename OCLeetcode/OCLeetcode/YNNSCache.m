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
@property (nonatomic, strong) id key;
@property (nonatomic, strong) YNCacheEntry *preEntry;
@property (nonatomic, strong) YNCacheEntry *nextEntry;
@property (nonatomic, assign) NSInteger cost;
@end

@implementation YNCacheEntry

//
- (id)copyWithZone:(NSZone *)zone
{
    return  self;
}
@end

@interface YNNSCache()
@property (nonatomic, strong) NSMutableDictionary *entryDict;
@property (nonatomic, strong) YNCacheEntry *head;
@property (nonatomic, strong) YNCacheEntry *tail;
@property (nonatomic, strong) NSLock *lock;
@property (nonatomic, assign) NSInteger totalCost;
@property (nonatomic, assign) NSInteger countLimit;
//@property (nonatomic, assign) NSInteger totalCostLimit;
@end

@implementation YNNSCache

-(instancetype)init
{
    if (self = [super init]) {
        //
        _entryDict = [NSMutableDictionary dictionary];
        _lock = [[NSLock alloc] init];
        _totalCost = 0;
        //_totalCostLimit = 0;
    }
    return self;
}

- (void)setCountLimit:(NSInteger)countLimit
{
    [_lock lock];
    _countLimit = countLimit;
    [_lock unlock];
}

- (void)setCache:(NSObject*)value forKey:(id)key
{
    [_lock lock];
    YNCacheEntry *entry = [_entryDict objectForKey:key];
    if (entry) {
        // update linkedlist
        [self updateLinkedList:entry];
    } else
    {
        entry = [[YNCacheEntry alloc] init];
        entry.key = key;
        entry.value = value;
        entry.cost = 0;
        if ([_entryDict count] > _countLimit) {
            _tail = _tail.preEntry;
            _tail.nextEntry = nil;
        }
        [_entryDict setObject:entry forKey:key];
        entry.nextEntry = _head;
        _head.preEntry = entry;
        _head = entry;
        if (!_tail) {
            _tail = _head.nextEntry;
        }
    }
    [_lock unlock];
}

- (void)removeCacheForKey:(NSObject*)key
{
    YNCacheEntry *entry = [_entryDict objectForKey:key];
    [self removeCache:entry];
}

- (void)removeCache:(YNCacheEntry*)entry
{
    
}

- (YNCacheEntry*)cacheForKey:(id)key
{
    [_lock lock];
    YNCacheEntry *entry = [_entryDict objectForKey:key];
    if (entry) {
        [self updateLinkedList:entry];
    }
    [_lock unlock];
    return entry;
}

#pragma private
- (void)updateLinkedList:(YNCacheEntry*)entry
{
    if (entry == _head) {
        return;
    }
    
    if (entry == _tail) {
        _tail = entry.preEntry;
        _tail.nextEntry = nil;
    } else
    {
        entry.preEntry.nextEntry = entry.nextEntry;
        entry.nextEntry.preEntry = entry.preEntry;
    }
    entry.nextEntry = _head;
    _head.preEntry = entry;
    _head = entry;
}

@end
