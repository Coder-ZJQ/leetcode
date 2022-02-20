class Solution {
    func rearrangeArray(_ nums: [Int]) -> [Int] {
        var pos = 0, neg = 1, res = [Int](repeating: 0, count: nums.count)
        for num in nums {
            if num > 0 {
                res[pos] = num
                pos += 2
            } else {
                res[neg] = num
                neg += 2
            }
        }
        return res
    }
}
