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
    func deepestLeavesSum(_ root: TreeNode?) -> Int {
        guard let node = root else {
            return 0
        }
        var array = [node]
        while !array.isEmpty {
            var newArray = [TreeNode]()
            for node in array {
                if let right = node.right {
                    newArray.append(right)
                }
                if let left = node.left {
                    newArray.append(left)
                    
                }
            }
            if !newArray.isEmpty {
                array = newArray
            } else {
                break
            }
        }
        return array.reduce(0, { partialResult, next in
            partialResult + next.val
        })
    }
}