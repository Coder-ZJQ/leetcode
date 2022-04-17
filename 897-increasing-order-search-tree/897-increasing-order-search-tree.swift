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
    private var array = [TreeNode]()
    private func inorderRraverse(_ node: TreeNode) {
        if let left = node.left {
            inorderRraverse(left)
        }
        array.append(node)
        if let right = node.right {
            inorderRraverse(right)
        }
    }
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        if let node = root {
            inorderRraverse(node)
            for i in 0..<(array.count - 1) {
                let node = array[i]
                node.left = nil
                node.right = array[i + 1]
            }
            array.last?.left = nil
            return array.first!
        }
        return nil
    }
}