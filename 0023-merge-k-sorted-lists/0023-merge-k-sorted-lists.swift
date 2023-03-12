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
    private func mergeTwoList(_ list0: ListNode?, _ list1: ListNode?) -> ListNode? {
        guard let node0 = list0, let node1 = list1 else {
            return list0 ?? list1
        }
        if node0.val < node1.val {
            node0.next = mergeTwoList(node0.next, node1)
            return node0
        } else {
            node1.next = mergeTwoList(node1.next, node0)
            return node1
        }
    }
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard !lists.isEmpty else {
            return nil
        }
        var res = lists[0]
        for list in lists[1...] {
            res = mergeTwoList(res, list)
        }
        return res
    }
}