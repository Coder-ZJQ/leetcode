class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        // 记录数字出现次数：[数字: 次数]
        var frequency = [Int: Int]()
        for num in nums {
            frequency[num] = (frequency[num] ?? 0) + 1
        }
        // 将相同次数的数放在同一桶中：[次数: [数字1, 数字2, ...]]
        // 并记录最大次数
        var bucket = [Int: [Int]]()
        var maxFreq = 0
        for (k, v) in frequency {
            maxFreq = max(maxFreq, v)
            bucket[v] = (bucket[v] ?? []) + [k]
        }
        // 从最大次数的桶开始取数字，知道满足 k 个
        var res = [Int](), index = maxFreq
        while res.count < k && maxFreq > 0 {
            if let arr = bucket[index] {
                res += arr
            }
            index -= 1
        }
        return res
    }
}
