class Solution {
    func differenceOfSum(_ nums: [Int]) -> Int {
        var elementSum = 0, digitSum = 0
        for num in nums {
            elementSum += num
            var num = num
            while num > 0 {
                digitSum += num % 10
                num /= 10
            }
        }
        return abs(elementSum - digitSum)
    }
}
