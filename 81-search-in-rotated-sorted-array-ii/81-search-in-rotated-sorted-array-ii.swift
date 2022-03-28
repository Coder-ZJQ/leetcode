class Solution {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        var left = 0, right = nums.count - 1, mid: Int
        while left <= right {
            mid = (right + left) >> 1
            let numMid = nums[mid]
            if numMid == target {
                return true
            }
            let numRight = nums[right],
                numLeft = nums[left]
            
            if numMid == numRight && numMid == numLeft {
                right -= 1
                left += 1
            } else if numLeft <= numMid {
                if numLeft <= target && numMid > target {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            } else {
                if numRight >= target && numMid < target {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
        }
        return false
    }
}