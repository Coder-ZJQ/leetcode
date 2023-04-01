class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0, r = nums.count - 1
        while l <= r {
            let mid = l + (r - l) >> 1
            let num = nums[mid]
            if num == target {
                return mid
            } else if num > target {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        return -1
    }
}
