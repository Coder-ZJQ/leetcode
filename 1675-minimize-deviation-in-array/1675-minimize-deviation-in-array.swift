class Solution {
    /// 偶数可以一直除以 2 知道不能再被 2 整除
    /// 奇数只能乘以 2 一次
    func minimumDeviation(_ nums: [Int]) -> Int {
        var nums = nums.map {
            $0 % 2 == 0 ? $0 : $0 * 2
        }.sorted()
        var res = nums.last! - nums.first!
        while let last = nums.last, last % 2 == 0 {
            insert(&nums, last / 2)
            nums.removeLast()
            res = min(res, nums.last! - nums.first!)
        }
        return res
    }
    
    private func insert(_ nums: inout [Int], _ num: Int) {
        let n = nums.count
        guard n > 0 else {
            nums.append(num)
            return
        }
        var l = 0, r = nums.count - 1
        
        while l < r {
            let m = l + (r - l) / 2
            if nums[m] < num {
                l = m + 1
            } else {
                r = m
            }
        }
        if nums[l] != num {
            nums.insert(num, at: l)
        }
    }
}