/// 优先队列
class PriorityQueue<Element: Comparable> {
    
    /// 队列中的元素
    private var elements: [Element]
    
    init(_ elements: [Element]) {
        self.elements = elements.sorted(by: <)
    }
    
    /// 入队
    func enqueue(_ element: Element) {
        var left = 0, right = elements.count - 1
        while left <= right {
            let mid = left + (right - left) >> 1
            if elements[mid] > element {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        elements.insert(element, at: left)
    }
    
    /// 出队
    func dequeue() -> Element? {
        elements.popLast()
    }
}

class Solution {
    func isPossible(_ target: [Int]) -> Bool {
        
        // 所有数的和
        var sum = target.reduce(0, +)
        
        // 数组初始化为优先队列
        let priorityQueue = PriorityQueue(target)
        
        while true {
            // 题目已限制 target 数组有元素，即优先队列不会为空，所以强制解包
            let tail = priorityQueue.dequeue()!
            // 队列尾部已经是 1 则表示队列元素全是 1 跳出循环
            if tail == 1 { break }
            // 剩下的其他数的和
            let otherSum = sum - tail
        
            // 需大于等于 1
            guard tail - otherSum >= 1 && otherSum != 0 else {
                return false
            }
            // 减少重复递减，避免超时
            var next = tail % otherSum
            if next == 0 {
                next = otherSum
            }
            // 入队
            priorityQueue.enqueue(next)
            // 更新和
            sum -= (tail - next)
        }
        
        return true
    }
}
