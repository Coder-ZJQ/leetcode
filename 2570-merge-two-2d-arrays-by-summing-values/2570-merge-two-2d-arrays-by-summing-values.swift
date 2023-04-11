class Solution {
    func mergeArrays(_ nums1: [[Int]], _ nums2: [[Int]]) -> [[Int]] {
        var dict = [Int: Int]()
        for num in nums1 + nums2 {
            dict[num[0]] = dict[num[0], default: 0] + num[1]
        }
        return dict.sorted {
            $0.key < $1.key
        }.map {
            [$0.key, $0.value]
        }
    }
}
