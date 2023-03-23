class Solution {
    func checkArithmeticSubarrays(_ nums: [Int], _ l: [Int], _ r: [Int]) -> [Bool] {
        zip(l, r).map { left, right in
            let subNums = nums[left...right]
            let maxNum = subNums.max()!
            let minNum = subNums.min()!
            let n = right - left
            // 间隔为整数
            guard (maxNum - minNum) % n == 0 else {
                return false
            }
            let gap = (maxNum - minNum) / n
            if gap == 0 {
                return true
            }
            /// 用来纪录是否已经枚举过
            var bools = [Bool](repeating: false, count: n + 1)
            for num in subNums {
                // 相差必须能被间隔整除
                guard (num - minNum) % gap == 0 else {
                    return false
                }
                // 计算索引
                let index = (num - minNum) / gap
                // 已经枚举过即重复了则直接返回 false
                if bools[index] {
                    return false
                }
                // 纪录
                bools[index] = true
            }
            return true
        }
    }
}