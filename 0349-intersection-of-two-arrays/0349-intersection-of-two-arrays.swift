class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        [Int](Set(nums1).intersection(nums2))
    }
}
