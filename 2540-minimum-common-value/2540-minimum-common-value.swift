class Solution {
    
    /// 双指针
    private func getCommonWithTwoPointer(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var i = 0, j = 0
        let m = nums1.count, n = nums2.count
        while i < m {
            let num1 = nums1[i]
            var temp = j
            while temp < n {
                let num2 = nums2[temp]
                if num1 == num2 {
                    return num1
                } else if num1 < num2 {
                    j = temp
                    break
                }
                temp += 1
            }
            i += 1
        }
        return -1
    }
    
    /// 集合
    private func getCommonWithSet(_ nums1: [Int], _ nums2: [Int]) -> Int {
        Set(nums1).intersection(Set(nums2)).min() ?? -1
    }
    
    func getCommon(_ nums1: [Int], _ nums2: [Int]) -> Int {
//        getCommonWithSet(nums1, nums2)
        getCommonWithTwoPointer(nums1, nums2)
    }
}