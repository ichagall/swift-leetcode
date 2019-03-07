//
//  LinkedInSwift.swift
//  OCLeetcode
//
//  Created by ght on 2019/2/23.
//  Copyright © 2019 youdao. All rights reserved.
//

import Foundation

class LinkedInSwift {
    //leetcode156 binary tree upside down,右子树要么为空要么有对应的左子点
    func upsideDownBinaryTree(_ root:TreeNode?) -> TreeNode? {
        var flipRoot = root
        guard let root = root, root.left != nil else {
            return flipRoot;
        }
        flipRoot = upsideDownBinaryTree(root.left)
        root.left!.left = root.right
        root.left!.right = root
        root.left = nil
        root.right = nil
        return flipRoot
    }
    
    //156,迭代
    func upsideDownBinaryTree2(_ root:TreeNode?) -> TreeNode? {
        //
        var cur = root , pre:TreeNode? = nil, next:TreeNode? = nil,tmp:TreeNode? = nil
        while cur != nil {
            next = cur?.left
            cur?.left = tmp
            tmp = cur?.right
            cur?.right = pre
            pre = cur
            cur = next
        }
        return pre;
    }
    
    //leetcode 206,reverse linked list
    func reverseLinkedList(_ head:ListNode?) -> ListNode? {
        if let head = head, head.next != nil  {
            var cur:ListNode? = head, pre:ListNode? = nil
            while cur != nil {
                let tmp = cur?.next
                cur?.next = pre
                pre = cur
                cur = tmp
            }
            return pre
        } else {
            return head
        }
    }
    //leetcode 92, reverse linkedlist from m to n
    func reverseLinkedList(_ head:ListNode?, from m:Int, to n:Int) -> ListNode? {
        var head = head
        var cur = head, pre:ListNode? = nil
        var mm = m, nn = n-m
        while mm > 1 {
            mm -= 1
            //startPre = cur
            pre = cur
            cur = cur?.next
        }
        let startPre = pre, tail = cur
        while nn > 0 {
            nn -= 1
            let tmp = cur?.next
            cur?.next = pre
            pre = cur
            cur = tmp
        }
        if let startPre = startPre {
            startPre.next = pre
        } else {
            head = pre
        }
        tail?.next = cur
        return head
    }
    //leetcode 234,判断是否是回文linkedlist
    func isPalindrome(_ head:ListNode?) -> Bool {
        guard let tmp = head, tmp.next != nil else {
            return true
        }
        var fast = head, slow = head
        while fast != nil , fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        
        fast = head
        slow = reverseLinkedList(slow)
    
        while slow != nil {
            if fast?.value != slow?.value {
                return false
            } else {
                fast = fast?.next
                slow = slow?.next
            }
        }
        return true
    }
    
    //leetcode 237,delete a node in a linked list-done by java
   
    //TODO leetcode 382,linked list random node
    func getRandom(_ head:ListNode?) -> Int {
        var cur = head
        var result = cur?.value
        var n = 2
        while cur != nil {
            n += 1
           // Int.r
        }
    }
    
    // leetcode 23 merge K sorted linkedlist
    //leetcode 21,merge 2 sorted list
    
    //leetcode 138,copy linkedlist with random pointer
}
