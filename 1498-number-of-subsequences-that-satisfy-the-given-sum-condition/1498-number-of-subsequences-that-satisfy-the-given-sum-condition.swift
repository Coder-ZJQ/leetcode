class Solution {
    
    private let MOD = 1_000_000_007
    
    func numSubseq(_ nums: [Int], _ target: Int) -> Int {
        let nums = nums.sorted(), n = nums.count
        
        // 预处理，防止溢出
        var pows = [Int](repeating: 0, count: n + 1)
        pows[0] = 1
        for i in 1...n {
            pows[i] = (pows[i - 1] << 1) % MOD
        }
        
        var res = 0
        var r = n - 1
        // 双指针确定区间
        for l in 0..<n {
            let minNum = nums[l]
            guard minNum * 2 <= target else {
                continue
            }
            while minNum + nums[r] > target {
                r -= 1
            }
            res = (res + pows[r - l]) % MOD
        }
        
        return res
    }
}