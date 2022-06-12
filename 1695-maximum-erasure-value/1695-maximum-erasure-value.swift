class Solution {
    func maximumUniqueSubarray(_ nums: [Int]) -> Int {
        let n = nums.count
        var sums = nums
        for i in 1..<n {
            sums[i] += sums[i - 1]
        }
        var left = 0, right = 0, res = 0
        var indexes = [Int: Int]()
        while right < n {
            let num = nums[right]
            if let index = indexes[num], index >= left {
                left = index + 1
            }
            indexes[num] = right
            var sum = sums[right]
            if left > 0 {
                sum -= sums[left - 1]
            }
            res = max(res, sum)
            right += 1
        }
        return res
    }
}