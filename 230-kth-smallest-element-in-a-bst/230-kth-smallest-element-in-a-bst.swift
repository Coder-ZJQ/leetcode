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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var leftCount = 0
        if let left = root?.left {
            inorderRraverse(left)
            leftCount = array.count
            if leftCount >= k {
                return array[k - 1].val
            }
            array = []
        }
        leftCount += 1
        if leftCount == k {
            return root!.val
        }
        if let right = root?.right {
            inorderRraverse(right)
            let rightCount = k - leftCount
            if array.count >= rightCount {
                return array[rightCount - 1].val
            }
        }
        return -1
    }
}