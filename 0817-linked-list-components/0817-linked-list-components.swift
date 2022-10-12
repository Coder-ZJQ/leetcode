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
    func numComponents(_ head: ListNode?, _ nums: [Int]) -> Int {
        /// 数字集合，用于判断节点 val 是否在集合中
        var numSet = Set(nums)
        /// 组件数，返回的结果
        var count = 0
        /// 是否已经有组件头
        var hasCompHead = false
        /// 链表头节点
        var head = head
        // 遍历链表
        while let node = head {
            if numSet.contains(node.val) {
                if !hasCompHead {
                    // val 在集合中且还没有组件头，设置已经有组件头
                    hasCompHead = true
                    // 累加组件数量
                    count += 1
                }
            } else {
                // 还没有组件头
                hasCompHead = false
            }
            // 移动至下一个节点
            head = node.next
        }
        return count
    }
}
