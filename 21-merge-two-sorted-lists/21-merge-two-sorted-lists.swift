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
    
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard let node1 = list1, let node2 = list2 else {
            return list1 ?? list2
        }
        if node1.val <= node2.val {
            node1.next = mergeTwoLists(node2, node1.next)
            return node1
        } else {
            node2.next = mergeTwoLists(node1, node2.next)
            return node2
        }
    }
    
}