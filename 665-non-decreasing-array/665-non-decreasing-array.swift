class Solution {
    func checkPossibility(_ nums: [Int]) -> Bool {
        let n = nums.count
        guard n > 1 else {
            return true
        }
        var count = 0, nums = nums
        // 前一个比当前数大时
        // 数量超过 1 时直接跳出循环
        for i in 1..<n where nums[i - 1] > nums[i] && count < 2 {
            count += 1
            if i - 2 >= 0 && nums[i - 2] > nums[i] {
                nums[i] = nums[i - 1]   // 1 2 1 3 修改当前为前一个后 1 2 2 3
            } else {
                nums[i - 1] = nums[i]   // 1 4 2 3 修改前一个为当前后 1 2 2 3
            }
        }
        return count <= 1
    }
}
