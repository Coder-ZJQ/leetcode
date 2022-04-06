class Solution {
    func minOperations(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let n1 = nums1.count, n2 = nums2.count
        let maxInSmall = max(n1, n2),
            minInBig = min(n1 * 6, n2 * 6)
        guard maxInSmall <= minInBig else {
            return -1
        }
        var sum1 = nums1.reduce(0, +),
            sum2 = nums2.reduce(0, +)
        
        guard sum1 != sum2 else { return 0 }
        if sum1 > sum2 {
            return minOperations(nums2, nums1)
        }
        
        var counts1 = [Int](repeating: 0, count: 7),
            counts2 = [Int](repeating: 0, count: 7)
        for num in nums1 {
            counts1[num] += 1
        }
        for num in nums2 {
            counts2[num] += 1
        }
        // 12345
        // 54321
        var res = 0, i = 1, j = 6
        while sum1 < sum2 {
            if i + j > 6 {
                if counts2[j] > 0 {
                    sum2 -= j - 1
                    res += 1
                    counts2[j] -= 1
                } else {
                    j -= 1
                }
            } else {
                if counts1[i] > 0 {
                    sum1 += 6 - i
                    res += 1
                    counts1[i] -= 1
                } else {
                    i += 1
                }
            }
        }
        
        return res
    }
}
