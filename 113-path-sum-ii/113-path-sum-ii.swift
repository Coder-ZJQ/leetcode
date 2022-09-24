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
    var res = [[Int]]()
    
    private func dfs(_ node: TreeNode, _ vals: [Int], _ sum: Int, _ targetSum: Int) {
        var isRoot = true
        var vals = vals + [node.val]
        var sum = sum + node.val
        if let left = node.left {
            dfs(left, vals , sum, targetSum)
            isRoot = false
        }
        if let right = node.right {
            dfs(right, vals, sum, targetSum)
            isRoot = false
        }
        if isRoot && sum == targetSum {
            res.append(vals)
        }
    }
    
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        if let node = root {
            dfs(node, [], 0, targetSum)
        }
        return res
    }
}
