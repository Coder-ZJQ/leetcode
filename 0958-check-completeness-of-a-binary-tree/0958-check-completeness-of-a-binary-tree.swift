/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func isCompleteTree(_ root: TreeNode?) -> Bool {
        guard let node = root else {
            return true
        }
        var queue = [node]
        while !queue.isEmpty {
            var hasnil = false
            var newQueue = [TreeNode]()
            for node in queue {
                if hasnil {
                    if node.left != nil || node.right != nil {
                        return false
                    }
                } else {
                    if let left = node.left {
                        newQueue.append(left)
                    } else {
                        hasnil = true
                    }
                    if let right = node.right {
                        if hasnil {
                            return false
                        } else {
                            newQueue.append(right)
                        }
                    } else {
                        hasnil = true
                    }
                }
            }
            if hasnil {
                for node in newQueue where node.left != nil || node.right != nil {
                    return false
                }
            }
            queue = newQueue
        }
        
        return true
    }
}