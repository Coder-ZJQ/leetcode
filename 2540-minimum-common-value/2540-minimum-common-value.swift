class Solution {
    func getCommon(_ nums1: [Int], _ nums2: [Int]) -> Int {
        Set(nums1).intersection(Set(nums2)).min() ?? -1
    }
}