class Solution {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        // 先二分查找，找到最接近 x 的索引
        var l = 0, r = arr.count - 1
        while l < r {
            let mid = l + (r - l) >> 1
            let num = arr[mid]
            if num < x {
                l = mid + 1
            } else {
                r = mid
            }
        }
        // 左右指针（大小为 k 的窗口）,注意不能超过右边界
        r = min(arr.count - 1, l + k - 1)
        l = r - k + 1
        while l - 1 >= 0 &&
                (abs(arr[l - 1] - x) < abs(arr[r] - x) ||
                 (abs(arr[l - 1] - x) == abs(arr[r] - x) && arr[l - 1] < arr[r])) {
            // 向左移动窗口
            l -= 1
            r -= 1
        }
        return Array(arr[l...r])
    }
}