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
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var node1 = l1, node2 = l2, node = ListNode(), current = node
        var sum = 0
        while node1 != nil || node2 != nil || sum > 0 {
            if let node = node1 {
                sum += node.val
                node1 = node.next
            }
            if let node = node2 {
                sum += node.val
                node2 = node.next
            }
            let newNode = ListNode(sum % 10)
            current.next = newNode
            current = newNode
            sum /= 10
        }
        return node.next
    }
}