class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let sortedNums = nums.sorted(), n = sortedNums.count
        var res = sortedNums[0] + sortedNums[1] + sortedNums[2]
        for i in 0..<n - 2 {
            let num = sortedNums[i]
            var l = i + 1, r = n - 1
            while l < r {
                let sum = num + sortedNums[l] + sortedNums[r]
                if sum > target {
                    r -= 1
                } else if sum < target {
                    l += 1
                } else {
                    return target
                }
                if abs(res - target) > abs(sum - target) {
                    res = sum
                }
            }
        }
        return res
    }
}
