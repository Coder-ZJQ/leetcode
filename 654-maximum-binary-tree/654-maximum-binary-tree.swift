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
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        if let num = nums.max() {
            let index = nums.firstIndex(of: num)!
            let node = TreeNode(num)
            let leftNums = nums[0..<index],
                rightNums = nums[(index + 1)..<nums.count]
            node.left = constructMaximumBinaryTree([Int](leftNums))
            node.right = constructMaximumBinaryTree([Int](rightNums))
            return node
        }
        return nil
    }
}