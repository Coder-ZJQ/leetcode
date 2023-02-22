class Solution {
    
    private func canShipWithinDays(_ weights: [Int], _ capacity: Int, _ days: Int) -> Bool {
        var daysNeeded = 1,
            loadedWeight = 0
        for weight in weights {
            loadedWeight += weight
            if loadedWeight > capacity {
                daysNeeded += 1
                loadedWeight = weight
            }
        }
        return daysNeeded <= days
    }
    
    
    func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
        var l = weights.max()!,
            r = weights.reduce(0, +)
        while l < r {
            let mid = l + (r - l) >> 1
            if canShipWithinDays(weights, mid, days) {
                r = mid
            } else {
                l = mid + 1
            }
        }
        return l
    }
}
