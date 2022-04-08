class Solution {
    var heap: [Int] = []
    var k: Int = 0
    
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
    
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        self.k = k
        for num in nums {
            insert(num)
        }
        return heap[k - 1]
    }
}