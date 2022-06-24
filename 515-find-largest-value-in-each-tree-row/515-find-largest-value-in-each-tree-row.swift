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
    // 数组用于记录每行的最大值
    private var array: [Int] = []
    private func levelTraverse(_ node: TreeNode?, _ level: Int) {
        guard let node = node else { return }
        if array.count == level {
            // 层级超过数组数量则追加数组
            array.append(node.val)
        } else {
            // 更新最大值
            array[level] = max(array[level], node.val)
        }
        // 继续层级遍历下一级
        levelTraverse(node.left, level + 1)
        levelTraverse(node.right, level + 1)
    }
    func largestValues(_ root: TreeNode?) -> [Int] {
        // 从 0 级开始层级遍历
        levelTraverse(root, 0)
        return array
    }
}
