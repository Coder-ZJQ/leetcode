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
    func createBinaryTree(_ descriptions: [[Int]]) -> TreeNode? {
        var map = [Int: TreeNode]()
        var childSet = Set<Int>()
        for description in descriptions {
            let nodeVal = description[0],
                childVal = description[1],
                isLeft = description[2]
            let node: TreeNode!
            if let tmp = map[nodeVal] {
                node = tmp
            } else {
                node = TreeNode(nodeVal)
                map[nodeVal] = node
            }
            let child: TreeNode!
            if let tmp = map[childVal] {
                child = tmp
            } else {
                child = TreeNode(childVal)
                map[childVal] = child
            }
            if isLeft == 1 {
                node.left = child
            } else {
                node.right = child
            }
            childSet.insert(childVal)
        }
        for (val, _) in map {
            if !childSet.contains(val) {
                return map[val]
            }
        }
        return nil
    }
}