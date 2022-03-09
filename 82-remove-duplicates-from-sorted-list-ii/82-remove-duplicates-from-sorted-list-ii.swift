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
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if let node = head, let next = node.next {
            if node.val != next.val {
                node.next = deleteDuplicates(next)
            } else {
                var n = next.next
                while let temp = n, temp.val == node.val {
                    n = temp.next
                }
                return deleteDuplicates(n)
            }
        }
        return head
    }
}