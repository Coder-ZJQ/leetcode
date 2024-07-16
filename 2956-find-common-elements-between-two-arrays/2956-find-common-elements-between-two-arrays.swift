class Solution {
    func findIntersectionValues(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let set = Set<Int>(nums1).intersection(nums2)
        let count1 = nums1.reduce(0) { res, num in
            set.contains(num) ? res + 1 : res
        }
        let count2 = nums2.reduce(0) { res, num in
            set.contains(num) ? res + 1 : res
        }
        return [count1, count2]
    }
}
