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
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let node = root else {
            return 0
        }
        node.val = 0
        var width = 1
        var array = [node]
        while !array.isEmpty {
            var newArray = [TreeNode]()
            let start = array.first!.val
            width = max(width, array.last!.val - start + 1)
            for node in array {
                if let left = node.left {
                    left.val = node.val * 2 - start         // 防止越界，减去起始值
                    newArray.append(left)
                }
                if let right = node.right {
                    right.val = node.val * 2 + 1 - start    // 防止越界，减去起始值
                    newArray.append(right)
                }
            }
            array = newArray
        }
        
        return width
    }
}