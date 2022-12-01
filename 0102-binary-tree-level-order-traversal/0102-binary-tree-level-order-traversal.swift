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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let node = root else { return [] }
        var queue = [node]
        var res = [[Int]]()
        while !queue.isEmpty {
            res.append(queue.map(\.val))
            var array = [TreeNode]()
            for node in queue {
                if let left = node.left {
                    array.append(left)
                }
                if let right = node.right {
                    array.append(right)
                }
            }
            queue = array
        }
        return res
    }
}