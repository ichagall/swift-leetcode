//
//  LRUCache.swift
//  OCLeetcode
//
//  Created by ght on 2019/4/18.
//  Copyright © 2019 youdao. All rights reserved.
//

import Foundation
//import <UIKit\UIKit.h>

class LRUCache : NSObject{
    fileprivate var _storage : Dictionary<String, Any>
    fileprivate var _orderList : Array<String>
    fileprivate var limit = 20
    private let lock = NSLock()
    
    public override init() {
        _storage = [:]
        _orderList = []
        super.init()
    }
    
    func addObject(aKey:String,object:Any) {
        lock.lock()
        if _orderList.count >= limit {
            let last:String = _orderList.removeLast()
            _storage.removeValue(forKey: last)
        }
        if _storage[aKey] != nil {
            //update orderlist
            _orderList = _orderList.filter { $0 != aKey}
            _orderList.insert(aKey, at: 0)
        } else
        {
            _orderList.insert(aKey, at: 0)
            _storage[aKey]  = object
        }
        lock.unlock()
    }
    
    func object(forKey:String) -> Any? {
        return _storage[forKey]
    }
    
}

//extension Array {
//    func removeObject(_ key:String) -> Array {
//        return self.filter { $0  }
//    }
//}
