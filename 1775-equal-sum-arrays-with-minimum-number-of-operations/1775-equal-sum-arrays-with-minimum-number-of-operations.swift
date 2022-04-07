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
            if i + j > 7 {
                let count = counts2[j]
                if count > 0 {
                    let reduce = (j - 1) * count
                    if sum1 < sum2 - reduce {
                        sum2 -= reduce
                        res += count
                        counts2[j] = 0
                        j -= 1
                    } else {
                        let remain = (sum2 - sum1) / (j - 1)
                        let op = (sum2 - sum1) % (j - 1) == 0 ? remain : remain + 1
                        sum2 -= op * (j - 1)
                        res += op
                        counts2[j] -= op
                    }
                } else {
                    j -= 1
                }
            } else {
                let count = counts1[i]
                if count > 0 {
                    let increase = (6 - i) * count
                    if sum1 + increase < sum2 {
                        sum1 += increase
                        res += count
                        counts1[i] = 0
                        i += 1
                    } else {
                        let remain = (sum2 - sum1) / (6 - i)
                        let op = (sum2 - sum1) % (6 - i) == 0 ? remain : remain + 1
                        sum1 += op * (6 - i)
                        res += op
                        counts1[i] -= op
                    }
                } else {
                    i += 1
                }
            }
        }
        
        return res
    }
}