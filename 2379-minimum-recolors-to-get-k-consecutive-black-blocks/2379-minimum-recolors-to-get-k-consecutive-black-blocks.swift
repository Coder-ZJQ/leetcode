class Solution {
    func minimumRecolors(_ blocks: String, _ k: Int) -> Int {
        var prefixSum = [Int](repeating: 0, count: blocks.count)
        var sum = 0
        for (i, block) in blocks.enumerated() {
            if block == "W" {
                sum += 1
            }
            prefixSum[i] = sum
        }
        var res = prefixSum[k - 1]
        if prefixSum.count > k {
            for i in k..<prefixSum.count {
                res = min(res, prefixSum[i] - prefixSum[i - k])
            }
        }
        return res
    }
}