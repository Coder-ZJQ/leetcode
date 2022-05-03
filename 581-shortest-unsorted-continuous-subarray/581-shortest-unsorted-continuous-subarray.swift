class Solution {
    /// 
    /// 将 nums 数组分成三部分：
    /// [...nums1...] + [...nums2...] + [...nums3...]
    /// nums1, nums3 已排序，nums2 未排序
    ///
    /// 可以得到：
    /// nums2 中的数始终大于等于 nums1 中的数
    /// nums2 中的数始终小于等于 nums3 中的数
    ///
    /// 分别：
    /// 从左到右遍历，找到最右边比当前最大值小的索引，既是需要排序
    /// 从右到左遍历，找到最左边比当前最小值大的索引，既是需要排序
    ///
    /// 如果找不到最左最右索引则不需要排序，返回：
    /// 0
    /// 有找到则返回：
    /// 最右索引 - 最左索引 + 1
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        let n = nums.count
        var left = -1, right = -1, maxNum = Int.min, minNum = Int.max
        for i in 0..<n {
            // 从左到右遍历
            if maxNum > nums[i] {
                // 更新最右边比当前最大值小的索引
                right = i
            } else {
                // 更新当前最大值
                maxNum = nums[i]
            }

            // 从右到左遍历
            if minNum < nums[n - 1 - i] {
                // 更新最左边比当前最小值大的索引
                left = n - 1 - i
            } else {
                // 更新当前最小值
                minNum = nums[n - 1 - i]
            }
        }
        // 没有找到最左最右索引则不需要排序，直接返回 0
        return right == -1 ? 0 : right - left + 1
    }
}