class Solution {
    func complexNumberMultiply(_ num1: String, _ num2: String) -> String {
        let nums1 = num1.split(separator: "+")
        let nums2 = num2.split(separator: "+")
        let real1 = Int(nums1[0]) ?? 0
        let real2 = Int(nums2[0]) ?? 0
        var str1 = nums1[1], str2 = nums2[1]
        str1.removeLast()
        str2.removeLast()
        let imaginary1 = Int(str1) ?? 0
        let imaginary2 = Int(str2) ?? 0
        return "\(real1 * real2 - imaginary1 * imaginary2)+\(real1 * imaginary2 + real2 * imaginary1)i"
    }
}