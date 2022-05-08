class Solution {
    func find132pattern(_ nums: [Int]) -> Bool {
        let n = nums.count
        // 单调栈
        var stack = [nums[n - 1]]
        // 132 中的 2
        var two = Int.min
        // 逆序遍历
        for num in nums[0..<(n - 1)].reversed() {
            // 比 2 小也就是 1，返回 true
            if num < two {
                return true
            }
            // 如果当前数比栈顶元素大（也就是 3），一直移除直到最后一个当成 2
            while !stack.isEmpty && num > stack.last! {
                two = stack.removeLast()
            }
            if num > two {
                // 添加到新的候补
                stack.append(num)
            }
        }
        
        return false
    }
}