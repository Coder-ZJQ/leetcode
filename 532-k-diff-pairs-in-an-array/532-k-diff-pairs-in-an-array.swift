class Solution {
    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        /// [数: 个数]
        var counts = [Int: Int]()
        for num in nums {
            counts[num] = counts[num, default: 0] + 1
        }
        var res = 0
        // k 等于 0 时，即寻找相同的数
        if k == 0 {
            // 相同的数数量需大于一个才能配对，
            for (_, count) in counts where count > 1 {
                res += 1
            }
        } else {
            // k 不等于 0 时寻找对应 num + k 或者 num - k 的数，存在则累加结果
            for (num, _) in counts where counts[num + k] != nil {
                res += 1
            }
        }
        return res
    }
}
