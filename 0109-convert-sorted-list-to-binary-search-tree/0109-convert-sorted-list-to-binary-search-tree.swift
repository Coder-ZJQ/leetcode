/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
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
    
    private func bst(_ left: Int, _ right: Int) -> TreeNode? {
        guard left <= right else {
            return nil
        }
        let mid = left + (right - left) >> 1
        
        let node = array[mid]
        node.left = bst(left, mid - 1)
        node.right = bst(mid + 1, right)
        return node
    }
    
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        var head = head
        while let node = head {
            array.append(TreeNode(node.val))
            head = node.next
        }
        return bst(0, array.count - 1)
    }
}