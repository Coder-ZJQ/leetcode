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
    func nextLargerNodes(_ head: ListNode?) -> [Int] {
        var vals = [Int]()
        var head = head
        while let node = head {
            vals.append(node.val)
            head = node.next
        }
        var res = [Int](repeating: 0, count: vals.count), stack = [(index: Int, val: Int)]()
        for (index, val) in vals.enumerated() {
            if let lastVal = stack.last?.val {
                if val <= lastVal {
                    stack.append((index, val))
                } else {
                    while let last = stack.last, last.val < val {
                        res[last.index] = val
                        stack.removeLast()
                    }
                    stack.append((index, val))
                }
                
            } else {
                stack.append((index, val))
            }
        }
        return res
    }
}