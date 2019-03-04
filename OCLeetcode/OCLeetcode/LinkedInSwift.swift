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
    
    func upsideDownBinaryTree2(_ root:TreeNode?) -> TreeNode? {
        //
    }
    
    //leetcode 297
}
