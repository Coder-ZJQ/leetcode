class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, right = nums.count - 1
        while left < right {
            let mid = left + (right - left) / 2
            if nums[mid] > target {
                right = mid
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                return mid
            }
        }
        return nums[left] == target ? left : -1
    }
}
