class Solution {
    func maxOperations(_ nums: [Int], _ k: Int) -> Int {
        var counts = [Int: Int]()
        for num in nums where num < k {
            counts[num] = counts[num, default: 0] + 1
        }
        let nums = counts.keys.sorted()
        var res = 0, left = 0, right = nums.count - 1
        while left <= right {
            let nums1 = nums[left],
                nums2 = nums[right],
                sum = nums1 + nums2
            if sum == k {
                res += nums1 != nums2 ? min(counts[nums1]!, counts[nums2]!) : counts[nums1]! / 2
                left += 1
                right -= 1
            } else if sum < k {
                left += 1
            } else {
                right -= 1
            }
        }
        return res
    }
}