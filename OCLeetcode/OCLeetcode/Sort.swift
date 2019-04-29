//
//  Sort.swift
//  OCLeetcode
//
//  Created by ght on 2019/4/29.
//  Copyright © 2019 youdao. All rights reserved.
//

import Foundation

class Sort {
    // sort list- merge sort  O(nlogn)
    func sortList(_ head:ListNode?) -> ListNode?{
        guard let headd = head else {
            return head
        }
        var cur : ListNode? = headd
        var count = 0
        while cur != nil {
            cur = cur?.next
            count += 1
        }
        
        return head
    }
}
