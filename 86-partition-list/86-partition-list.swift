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
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        guard let _ = head else { return nil }
        var next = head
        var small: [ListNode] = []
        var big: [ListNode] = []
        while let node = next {
            if node.val < x {
                small.append(node)
            } else {
                big.append(node)
            }
            next = node.next
        }
        let total = small + big
        let n = total.count
        for i in 0..<n-1 {
            total[i].next = total[i + 1]
        }
        total.last?.next = nil
        return total.first
    }
}