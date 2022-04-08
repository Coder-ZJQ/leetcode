
class KthLargest {
    var heap: [Int] = []
    var k: Int
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        for num in nums {
            insert(num)
        }
    }
    
    private func insert(_ num: Int) {
        guard heap.count < k || num > heap[k - 1] else { return }
        var left = 0, right = min(heap.count, k) - 1
        while left <= right {
            let mid = left + (right - left) >> 1
            if heap[mid] > num {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        heap.insert(num, at: left)
    }
    
    func add(_ val: Int) -> Int {
        insert(val)
        return heap[k - 1]
    }
}


/**
 * Your KthLargest object will be instantiated and called as such:
 * let obj = KthLargest(k, nums)
 * let ret_1: Int = obj.add(val)
 */
