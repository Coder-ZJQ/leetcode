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
    
    private var array: [TreeNode] = []
    
    private func inorderTraverse(_ node: TreeNode) {
        if let left = node.left {
            inorderTraverse(left)
        }
        array.append(node)
        if let right = node.right {
            inorderTraverse(right)
        }
    }
    
    func recoverTree(_ root: TreeNode?) {
        guard let node = root else {
            return
        }
        inorderTraverse(node)
        var node1: TreeNode?
        for i in 0..<array.count - 1 {
            if array[i].val > array[i + 1].val {
                node1 = array[i]
                break
            }
        }
        var node2: TreeNode?
        for i in (1..<array.count).reversed() {
            if array[i].val < array[i - 1].val {
                node2 = array[i]
                break
            }
        }
        guard let node1 = node1, let node2 = node2 else {
            return
        }
        (node1.val, node2.val) = (node2.val, node1.val)

    }
}