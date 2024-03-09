class Solution {
    func getCommon(_ nums1: [Int], _ nums2: [Int]) -> Int {
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
}