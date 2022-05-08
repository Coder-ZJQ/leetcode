/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public func isInteger() -> Bool
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     public func getInteger() -> Int
 *
 *     // Set this NestedInteger to hold a single integer.
 *     public func setInteger(value: Int)
 *
 *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
 *     public func add(elem: NestedInteger)
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     public func getList() -> [NestedInteger]
 * }
 */

class NestedIterator {

    /// 用以跟踪元素的栈
    private var stack: [NestedInteger]
    
    init(_ nestedList: [NestedInteger]) {
        // 将嵌套列表逆序存入栈
        stack = nestedList.reversed()
    }
    
    func next() -> Int {
        stack.removeLast().getInteger()
    }
    
    func hasNext() -> Bool {
        // 如果最后一个不是数字
        while let last = stack.last, !last.isInteger() {
            // 如果最后一个是数组，则移除并再将其元素逆序入栈
            for nestedList in stack.removeLast().getList().reversed() {
                stack.append(nestedList)
            }
        }
        return !stack.isEmpty
    }
}

/**
 * Your NestedIterator object will be instantiated and called as such:
 * let obj = NestedIterator(nestedList)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */