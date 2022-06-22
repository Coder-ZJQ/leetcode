class MaxHeap<Element: Comparable> {
    
    private var array = [Element]()
    private var capacity: Int
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func insert(_ element: Element) {
        guard array.count < capacity || element > array[capacity - 1] else { return }
        var left = 0, right = min(array.count, capacity) - 1
        while left <= right {
            let mid = left + (right - left) >> 1
            if array[mid] > element {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        array.insert(element, at: left)
        if array.count > capacity {
            array.removeLast()
        }
    }
    
    func top() -> Element? {
        array.last
    }
    
}

class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let heap = MaxHeap<Int>(k)
        for num in nums {
            heap.insert(num)
        }
        return heap.top() ?? 0
    }
}
