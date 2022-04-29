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
    func mergeInBetween(_ list1: ListNode?, _ a: Int, _ b: Int, _ list2: ListNode?) -> ListNode? {
        var i = 1
        var pre = list1, node1: ListNode?, node2: ListNode?
        while let next = pre?.next {
            if i == a {
                node1 = pre
            }
            if i == b {
                node2 = next.next
                break
            }
            pre = next
            i += 1
        }
        node1?.next = list2
        pre = list2
        while let next = pre?.next {
            pre = next
        }
        pre?.next = node2
        return list1
    }
}