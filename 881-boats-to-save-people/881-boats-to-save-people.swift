class Solution {
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
        let sorted = people.sorted(), n = sorted.count
        var left = 0, right = n - 1
        while left <= right {
            if sorted[left] + sorted[right] <= limit {
                left += 1
            }
            right -= 1
        }
        return n - 1 - right
    }
}
