class Solution {
    func countBadPairs(_ nums: [Int]) -> Int {
        // j - i != nums[j] - nums[i]
        // j - nums[j] != i - nums[i]
        let n = nums.count
        var map = [Int: Int]()
        var res = n * (n - 1) / 2
        for (i, num) in nums.enumerated() {
            let temp = i - num
            if let count = map[temp] {
                res -= count
                map[temp] = count + 1
            } else {
                map[temp] = 1
            }
        }
        return res
    }
}