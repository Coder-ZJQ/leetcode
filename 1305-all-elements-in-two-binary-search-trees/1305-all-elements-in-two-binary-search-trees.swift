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
    
    private func inorderTraverse(_ node: TreeNode?, _ array: inout [Int]) {
        guard let node = node else {
            return
        }
        inorderTraverse(node.left, &array)
        array.append(node.val)
        inorderTraverse(node.right, &array)
    }
    
    func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
        var array1 = [Int](), array2 = [Int]()
        inorderTraverse(root1, &array1)
        inorderTraverse(root2, &array2)
        
        let m = array1.count, n = array2.count
        var i = 0, j = 0, res = [Int]()
        while i < m || j < n {
            if i == m {
                res += array2[j...]
                break
            }
            if j == n {
                res += array1[i...]
                break
            }
            let num1 = array1[i], num2 = array2[j]
            if num1 < num2 {
                res.append(num1)
                i += 1
            } else {
                res.append(num2)
                j += 1
            }
        }
        return res
    }
}