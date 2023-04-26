class Solution {
    
    /// 根据前缀和枚举结果
    private func maxSumTwoWithPrefixSum(_ prefixSum: [Int], _ firstLen: Int, _ secondLen: Int) -> Int {
        let n = prefixSum.count
        var res = 0
        for i in (firstLen - 1)..<(n - secondLen) {
            let sumi = prefixSum[i] - (i - firstLen >= 0 ? prefixSum[i - firstLen] : 0)
            for j in (i + secondLen)..<n {
                let sumj = prefixSum[j] - prefixSum[j - secondLen]
                res = max(res, sumi + sumj)
            }
        }
        return res
    }
    
    func maxSumTwoNoOverlap(_ nums: [Int], _ firstLen: Int, _ secondLen: Int) -> Int {
        // 计算前缀和
        var prefixSum = nums
        for i in 1..<nums.count {
            prefixSum[i] += prefixSum[i - 1]
        }
        let sum = maxSumTwoWithPrefixSum(prefixSum, firstLen, secondLen)
        // 长度相等的话，减少重复枚举
        return firstLen == secondLen ? sum : max(sum, maxSumTwoWithPrefixSum(prefixSum, secondLen, firstLen))
    }
}