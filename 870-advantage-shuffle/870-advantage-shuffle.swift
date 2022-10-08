class Solution {
    func advantageCount(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let sortedNums1 = nums1.sorted()
        let sortedNums2WithOffset = nums2.enumerated().sorted {
            $0.element < $1.element
        }
        var res = sortedNums1
        var l = 0, r = sortedNums2WithOffset.count - 1
        for num1 in sortedNums1 {
            let num2WithOffset = sortedNums2WithOffset[l]
            if num1 > num2WithOffset.element {
                res[num2WithOffset.offset] = num1
                l += 1
            } else {
                res[sortedNums2WithOffset[r].offset] = num1
                r -= 1
            }
        }
        return res
    }
}