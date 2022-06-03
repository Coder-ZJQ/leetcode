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
    
    private var res = 0
    
    private func dfs(_ node: TreeNode) -> (sum: Int, count: Int) {
        var sum = node.val, count = 1
        if let left = node.left {
            let tuple = dfs(left)
            sum += tuple.sum
            count += tuple.count
        }
        if let right = node.right {
            let tuple = dfs(right)
            sum += tuple.sum
            count += tuple.count
        }
        if node.val == sum / count {
            res += 1
        }
        return (sum, count)
    }
    
    func averageOfSubtree(_ root: TreeNode?) -> Int {
        if let node = root {
            dfs(node)
        }
        return res
    }
}