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
    func findBottomLeftValue(_ root: TreeNode?) -> Int {
        guard let node = root else {
            return -1
        }
        var array = [node], res = 0
        while !array.isEmpty {
            res = array.first!.val
            var newArray = [TreeNode]()
            for node in array {
                if let left = node.left {
                    newArray.append(left)
                }
                if let right = node.right {
                    newArray.append(right)
                }
            }
            array = newArray
        }
        return res
    }
}
