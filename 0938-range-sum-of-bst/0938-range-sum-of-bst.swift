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
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let node = root else {
            return 0
        }
        if node.val < low { // 比左区间还小则计算右节点
            return rangeSumBST(node.right, low, high)
        } else if node.val > high { // 比右区间还大则计算左节点
            return rangeSumBST(node.left, low, high)
        } else { // 在区间内则加上当前节点 val，及左右节点和
            return node.val + rangeSumBST(node.left, low, high) + rangeSumBST(node.right, low, high)
        }
    }
}
