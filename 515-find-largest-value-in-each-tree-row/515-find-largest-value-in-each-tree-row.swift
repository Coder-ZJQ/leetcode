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
    private var array: [Int] = []
    private func levelTraverse(_ node: TreeNode?, _ level: Int) {
        guard let node = node else { return }
        if array.count == level {
            array.append(node.val)
        } else {
            array[level] = max(array[level], node.val)
        }
        levelTraverse(node.left, level + 1)
        levelTraverse(node.right, level + 1)
    }
    func largestValues(_ root: TreeNode?) -> [Int] {
        levelTraverse(root, 0)
        return array
    }
}