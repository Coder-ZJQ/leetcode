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
        var next1 = l1, next2 = l2, sum = 0
        var node = ListNode(0),
            dummy = node
        while next1 != nil || next2 != nil || sum > 0 {
            if let next = next1 {
                sum += next.val
                next1 = next.next
            }
            if let next = next2 {
                sum += next.val
                next2 = next.next
            }
            let node = ListNode(sum % 10)
            dummy.next = node
            dummy = node
            sum /= 10
        }
        return node.next
    }
}