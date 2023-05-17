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
    func pairSum(_ head: ListNode?) -> Int {
        var vals = [Int](), head = head
        while let node = head {
            vals.append(node.val)
            head = node.next
        }
        var result = Int.min, l = 0, r = vals.count - 1
        while l < r {
            result = max(result, vals[l] + vals[r])
            l += 1
            r -= 1
        }
        return result
    }
}
