/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func getNodes(_ head: ListNode?) -> [ListNode] {
        var head = head, result = [ListNode]()
        while let node = head {
            result.insert(node, at: 0)
            head = node.next
        }
        return result
    }
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        let nodesA = getNodes(headA)
        let nodesB = getNodes(headB)
        let n = min(nodesA.count, nodesB.count)
        for i in 0..<n {
            if nodesA[i] !== nodesB[i] {
                if i == 0 {
                    return nil
                }
                return nodesA[i - 1]
            } else if i == n - 1 {
                return nodesA[i]
            }
        }
        return nil
    }
}