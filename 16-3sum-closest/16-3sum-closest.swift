class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let sorted = nums.sorted(), n = sorted.count
        var res = nums[0] + nums[1] + nums[2]
        for i in 0..<(n - 2) {
            let numi = sorted[i]
            var left = i + 1, right = n - 1
            while left < right {
                let sum = numi + sorted[left] + sorted[right]
                if sum > target {
                    right -= 1
                } else {
                    left += 1
                }
                if abs(res - target) > abs(sum - target) {
                    res = sum
                }
            }
        }
        return res
    }
}
