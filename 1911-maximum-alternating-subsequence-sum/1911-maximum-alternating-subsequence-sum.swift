class Solution {
    func maxAlternatingSum(_ nums: [Int]) -> Int {
        var even = nums[0], odd = 0
        for num in nums[1...] {
            even = max(even, odd + num)
            odd = max(odd, even - num)
        }
        return even
    }
}
