class Solution {
    func separateDigits(_ nums: [Int]) -> [Int] {
        var res = [Int]()
        for num in nums {
            var num = num
            var arr = [Int]()
            while num > 0 {
                arr.append(num % 10)
                num /= 10
            }
            res += arr.reversed()
        }
        return res
    }
}

