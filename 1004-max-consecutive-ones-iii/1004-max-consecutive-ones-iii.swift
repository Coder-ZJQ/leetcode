class Solution {
    func longestOnes(_ nums: [Int], _ k: Int) -> Int {
        var start = 0, res = 0, count = 0
        for end in 0..<nums.count {
            if nums[end] == 0 {
                count += 1
            }
            while count > k {
                if nums[start] == 0 {
                    count -= 1
                }
                start += 1
            }
            res = max(end - start + 1, res)
        }
        return res
    }
}
