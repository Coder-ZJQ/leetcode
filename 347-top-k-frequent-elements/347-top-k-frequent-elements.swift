class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var frequency = [Int: Int]()
        for num in nums {
            frequency[num] = (frequency[num] ?? 0) + 1
        }
        var bucket = [Int: [Int]]()
        var maxFreq = 0
        for (k, v) in frequency {
            maxFreq = max(maxFreq, v)
            bucket[v] = (bucket[v] ?? []) + [k]
        }
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
