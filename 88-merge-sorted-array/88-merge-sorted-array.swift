class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        // 两个指针指向两个数组尾部
        var p1 = m - 1, p2 = n - 1,
        // 一个指向整体尾部
        tail = m + n - 1
        while p1 >= 0 || p2 >= 0 {
            var num = 0
            if p1 == -1 {
                num = nums2[p2]
                p2 -= 1
            } else if p2 == -1 {
                num = nums1[p1]
                p1 -= 1
            } else if nums1[p1] > nums2[p2] {
                num = nums1[p1]
                p1 -= 1
            } else {
                num = nums2[p2]
                p2 -= 1
            }
            // 更新整体尾部
            nums1[tail] = num
            tail -= 1
        }
    }
}
