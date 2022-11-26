class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        let total = nums.reduce(0, +)
        var sum = 0
        for (i, num) in nums.enumerated() {
            if sum + sum + num == total {
                return i
            }
            sum += num
        }
        return -1
    }
}
