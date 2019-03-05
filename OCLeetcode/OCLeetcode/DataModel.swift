//
//  DataModel.swift
//  OCLeetcode
//
//  Created by ght on 2019/2/23.
//  Copyright © 2019 youdao. All rights reserved.
//

import Foundation

class TreeNode {
    var right:TreeNode?
    var left:TreeNode?
    var value:String
    
    init(value:String) {
        self.value = value
    }
}

class ListNode {
    var value:Int
    var next:ListNode?
    
    init(value:Int) {
        self.value = value
        self.next = nil
    }
}
