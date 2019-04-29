//
//  MSInSwift.swift
//  OCLeetcode
//
//  Created by ght on 2019/4/14.
//  Copyright © 2019 youdao. All rights reserved.
//

import Foundation

class leetcodeList {
    //206
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard let headd = head, headd.next != nil else {
            return head
        }
        var cur:ListNode? = headd, pre : ListNode? = nil
        while cur != nil {
            let tem = cur!.next
            cur!.next = pre
            pre = cur
            cur = tem
        }
        return pre
    }
    
    func reverseList(_ head:ListNode?, from m:Int, to n:Int) -> ListNode? {
        guard let headd = head,headd.next != nil else {
            return head
        }
        //
        guard m < n else
        {
            return head
        }
        var cur:ListNode? = head,pre : ListNode? = nil,head = head
       
        var i = m, j = n - m + 1
        while i > 1 {
            pre = cur
            cur = cur?.next
            i -= 1
        }
        let before:ListNode? = pre , tail:ListNode? = cur
        while  j > 0 {
            let tem = cur!.next
            cur!.next = pre
            pre = cur
            cur = tem
            j -= 1
        }
        tail?.next = cur
        if before != nil
        {
           before?.next = pre
        } else
        {
            head = pre
        }
        return head
    }
    
    //21
    func mergeSortedList(l1:ListNode?, l2:ListNode?) ->ListNode?
    {
        guard l1 != nil else
        {
            return l2
        }
        guard l1 != nil else
        {
            return l1
        }
        var l1:ListNode? = l1, l2:ListNode? = l2
        let mergeList:ListNode?
        if l1!.value < l2!.value {
            mergeList = l1
            l1 = l1?.next
        } else
        {
           mergeList = l2
            l2 = l2?.next
        }
        var cur:ListNode? = mergeList
        while l1 != nil, l2 != nil {
            if l1!.value < l2!.value {
                cur?.next = l1
                l1 = l1?.next
            } else
            {
               cur?.next = l2
                 l2 = l2?.next
            }
            cur = cur?.next
        }
        cur?.next = l1 != nil ? l1:l2
      return mergeList
    }
    
    //138
    func copyRandomLinkedList(_ head:LinkedListNode) -> LinkedListNode
    {
        
        
        
        return head;
    }
}
