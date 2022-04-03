class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        let n = nums.count
        // 找到最后一个，下一个数比前一个数大的索引i
        // （索引 i 之后其实为递减数列）
        var i = n - 2
        while i >= 0 {
            if nums[i] < nums[i + 1] {
                break
            }
            i -= 1
        }
        if i >= 0 {
            let num = nums[i]
            var j = n - 1
            // 从索引 i 之后的递减数列找到一个最接近的大于索引 i 位置的数的索引
            while j > i {
                if nums[j] > num {
                    break
                }
                j -= 1
            }
            // 根据索引交换两个数的位置
            (nums[i], nums[j]) = (nums[j], nums[i])
            // 交换后索引 i 之后依然是递减数列
            // 所以翻转索引 i 之后的子数组
            var l = i + 1, r = n - 1
            while l < r {
                (nums[l], nums[r]) = (nums[r], nums[l])
                l += 1
                r -= 1
            }
        } else {
            // 没有找到即翻转数组
            nums.reverse()
        }
    }
}