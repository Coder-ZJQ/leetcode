class Solution {
    func maxRotateFunction(_ nums: [Int]) -> Int {
        let n = nums.count
        var sum = 0, fi = 0
        for i in 0..<n {
            let num = nums[i]
            sum += num
            fi += num * i
            
        }
        var res = fi
        for i in 1..<n {
            fi = fi + sum - nums[n - i] * n
            res = max(res, fi)
        }
        return res
    }
}
