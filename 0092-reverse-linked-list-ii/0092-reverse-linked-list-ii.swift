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
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        var nodes = [ListNode]()
        var head = head
        while let node = head {
            nodes.append(node)
            head = node.next
        }
        var left = left, right = right
        while left < right {
            let temp = nodes[right - 1].val
            nodes[right - 1].val = nodes[left - 1].val
            nodes[left - 1].val = temp
            left += 1
            right -= 1
        }
        return nodes.first
    }
}