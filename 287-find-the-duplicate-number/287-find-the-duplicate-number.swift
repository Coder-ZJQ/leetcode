class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var left = 1, right = nums.count - 1
        while left < right {
            let mid = left + (right - left) / 2
            var count = 0
            for num in nums {
                if num <= mid {
                    count += 1
                }
            }
            if count <= mid {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
}
