class Solution {
    
    ///   1---n
    /// 1
    /// |
    /// m
    func findKthNumber(_ m: Int, _ n: Int, _ k: Int) -> Int {
        // 二分查找
        var left = 1, right = m * n
        while left < right {
            let mid = left + (right - left) >> 1
            
            /// 行内每个都比 mid 小的行数
            let start = mid / n
            /// 比 mid 小的个数（行数 x 每行个数）
            var count = start * n
            
            // 遍历之后的每一行，追加个数
            for i in (start + 1)...m {
                count += mid / i
            }
            // 数量比 k 小的话说明还在中点右边，所以移动左边界
            if count < k {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
}
