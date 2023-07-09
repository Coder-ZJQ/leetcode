class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted(), n = nums.count
        var res = [[Int]](), hash = Set<String>()
        for i in 0..<n-2 {
            let num = nums[i]
            var l = i + 1, r = n - 1
            while l < r {
                let sum = nums[l] + nums[r]
                if sum == -num {
                    let key = "\(nums[i]),\(nums[l]),\(nums[r])"
                    if !hash.contains(key) {
                        res.append([nums[i], nums[l], nums[r]])
                        hash.insert(key)
                    }
                    l += 1; r -= 1
                } else if sum > -num {
                    r -= 1
                } else {
                    l += 1
                }
            }
        }
        return res
    }
}