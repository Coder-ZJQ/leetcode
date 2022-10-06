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
    func reverseOddLevels(_ root: TreeNode?) -> TreeNode? {
        guard let node = root else { return nil }
        var array = [node], level = 0
        while !array.isEmpty {
            level += 1
            var newArray = [TreeNode]()
            for node in array {
                if let left = node.left {
                    newArray.append(left)
                }
                if let right = node.right {
                    newArray.append(right)
                }
            }
            if level % 2 == 1 {
                var l = 0, r = newArray.count - 1
                while l < r {
                    (newArray[l].val, newArray[r].val) = (newArray[r].val, newArray[l].val)
                    l += 1
                    r -= 1
                }
            }
            array = newArray
        }
        return node
    }
}