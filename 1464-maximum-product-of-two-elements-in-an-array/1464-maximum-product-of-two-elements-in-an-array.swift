class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        // 最大的两个数
        var m = 0, n = 0
        for num in nums {
            if num >= m {       // 大于等于最大的数，更新最大的两个数
                n = m
                m = num
            } else if num > n { // 大于第二大的数，更新第二大的数
                n = num
            }
        }
        return (m - 1) * (n - 1)
    }
}
