class Solution {
    
    private var priorityQueue = [Int]()
    
    private func push(_ height: Int) {
        var l = 0, r = priorityQueue.count - 1
        while l <= r {
            let mid = l + (r - l) / 2,
            midH = priorityQueue[mid]
            if midH > height {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        priorityQueue.insert(height, at: l)
    }
    
    func furthestBuilding(_ heights: [Int], _ bricks: Int, _ ladders: Int) -> Int {
        let n = heights.count
        var sum = 0
        for i in 1..<n {
            let deltaH = heights[i] - heights[i - 1]
            if deltaH > 0 {
                push(deltaH)
                if priorityQueue.count > ladders {
                    sum += priorityQueue.removeLast()
                }
                if sum > bricks {
                    return i - 1
                }
            }
        }
        return n - 1
    }
}