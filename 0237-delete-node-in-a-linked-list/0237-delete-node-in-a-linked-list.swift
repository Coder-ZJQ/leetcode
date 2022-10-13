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
    func deleteNode(_ node: ListNode?) {
        var cur = node, pre = node
        // 遍历链表
        while let nxt = cur?.next {
            // 将下一个节点的值转移至当前节点
            cur?.val = nxt.val
            // 记录当前节点为前一节点
            pre = cur
            // 移动当前节点
            cur = nxt
        }
        // 移除最后一个节点
        pre?.next = nil
    }
}