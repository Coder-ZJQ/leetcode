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
    
    func maxLevelSum(_ root: TreeNode?) -> Int {
        guard let node = root else {
            return 0
        }
        var array = [node],
            sum = Int.min,
            level = 1,
            res = 0
        while !array.isEmpty {
            let curSum = array.reduce(0) { partialResult, node in
                partialResult + node.val
            }
            if curSum > sum {
                sum = curSum
                res = level
            }
            var nexts = [TreeNode]()
            for node in array {
                if let left = node.left {
                    nexts.append(left)
                }
                if let right = node.right {
                    nexts.append(right)
                }
            }
            array = nexts
            level += 1
        }
        return res
    }
}